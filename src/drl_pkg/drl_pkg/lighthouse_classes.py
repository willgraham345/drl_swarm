#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  
"""
Classes taken from Crazyflie example for writing to lighthouse base station geometry and calibration.
Modified for use in drl_pkg.

Author: Will Graham
"""
import sys
import logging
import time
from threading import Event, Timer
import cflib.crtp 
from cflib.crazyflie import Crazyflie
from cflib.crazyflie.log import LogConfig
from cflib.crazyflie.syncCrazyflie import SyncCrazyflie
from cflib.positioning.motion_commander import MotionCommander
from cflib.positioning.position_hl_commander import PositionHlCommander
from cflib.localization.lighthouse_types import LhCfPoseSample
from cflib.localization.lighthouse_geometry_solver import LighthouseGeometrySolver
from cflib.localization.lighthouse_sweep_angle_reader import LighthouseSweepAngleAverageReader
from cflib.localization.lighthouse_initial_estimator import LighthouseInitialEstimator
from cflib.localization.lighthouse_types import LhDeck4SensorPositions
from cflib.crazyflie.mem import LighthouseBsGeometry
from cflib.crazyflie.mem import LighthouseMemHelper
from cflib.utils import uri_helper


from cflib.crazyflie.mem import LighthouseMemory


position_estimate = [0, 0, 0, 0]
lh_estimate = [0, 0, 0]
DEFAULT_HEIGHT = 2.0
# Only output errors from the logging framework
# logging.basicConfig(level=logging.ERROR)
class ReadLHMem:
    def __init__(self, uri):
        self._event = Event()

        with SyncCrazyflie(uri, cf=Crazyflie(rw_cache='./cache')) as scf:
            helper = LighthouseMemHelper(scf.cf)
            helper.read_all_geos(self._geo_read_ready)
            self._event.wait()
            self._event.clear()
            helper.read_all_calibs(self._calib_read_ready)
            self._event.wait()
            self._event.clear()

    def _geo_read_ready(self, geo_data):
        self.geo_data = {}
        for id, data in geo_data.items():
            print('---- Geometry for base station', id + 1)
            data.dump()
            print()
            self.geo_data[id] = data
        self._event.set()

    def _calib_read_ready(self, calib_data):
        self.calib_data = {}
        for id, data in calib_data.items():
            print('---- Calibration data for base station', id + 1)
            data.dump()
            print()
            self.calib_data[id] = data
        self._event.set()

class WriteLHMem:
    def __init__(self, uri, geo_dict, calib_dict):
        self._event = Event()

        with SyncCrazyflie(uri, cf=Crazyflie(rw_cache='./cache')) as scf:
            helper = LighthouseMemHelper(scf.cf)
            helper.write_geos(geo_dict, self._data_written)
            self._event.wait()
            self._event.clear()
            helper.write_calibs(calib_dict, self._data_written)
            self._event.wait()

    def _data_written(self, success):
        if success:
            print('Data written')
        else:
            print('Write failed')

        self._event.set()

class WriteLHGeoMem:
    """ 
    Write only the geometry memory
    :param uri: URI of the Crazyflie to connect to
    :param geo_dict: Dictionary of base station geometries to write
    :type geo_dict: dict[int, LighthouseBsGeometry]

    """
    #TODO: Remove these classes (depricated)
    def __init__(self, uri, geo_dict):
        self._event = Event()

        with SyncCrazyflie(uri, cf=Crazyflie(rw_cache='./cache')) as scf:
            helper = LighthouseMemHelper(scf.cf)

            helper.write_geos(geo_dict, self._data_written)
            self._event.wait()

    def _data_written(self, success):
        if success:
            print('Lighthouse geometry write success')
        else:
            print('Lighthouse geometry write failure')

        self._event.set()

class SyncCrazyflie_WriteLh():
    '''
    A class that will sync with a crazyflie and fly it, with capability to write custom lighthouse configuration.
    
    '''
    def __init__(self,
            URI,
            initial_position: list[float],
            final_position: list[float],
            initial_yaw: int,
            geos_dict: dict,
            rotation_matrix: list):
        self.URI = URI
        self.cf = Crazyflie(rw_cache='./cache')
        self._create_lh_geos(geos_dict, rotation_matrix)
        self._initial_position = initial_position
        self._final_position = final_position
        self._initial_yaw = initial_yaw
        self.lh_helper = None

        self.hl_commander = None

        self._event = Event()
        with SyncCrazyflie(URI, cf = Crazyflie(rw_cache='./cache')) as scf:
            self.scf = scf
            self.setup()

    def setup(self):
        self._init_configure_lighthouse()
        self._init_kalman_log_config()
        self.__init_lighthouse_log_config()
        self.__init_hl_commander()
        time.sleep(1)
        self.hl_commander_workflow()

        # self.get_lighthouse_geos()
        # self.hl_commander_workflow()
        # self.send_to_position(scf, self._final_position)
    
    def _create_lh_geos(self, geos_dict, rotation_matrix):
        '''
        '''
        self.lh_dict = {}
        for bs in geos_dict:
            bs_geo = LighthouseBsGeometry()
            bs_geo.origin = geos_dict[bs]
            bs_geo.rotation_matrix = rotation_matrix
            print("wrote geo for bs", bs, "origin:", bs_geo.origin, "rotation matrix:", bs_geo.rotation_matrix)
            bs_geo.valid = True
            self.lh_dict[bs] = bs_geo

    def _init_configure_lighthouse(self):
        '''
        This class initializes a new lighthouse geo writer for easier use.
        
        Args:
            config_packet (LighthouseConfigPacket): The configuration packet for the lighthouse.
        '''
        self.lh_helper = LighthouseMemHelper(self.scf.cf)
        self.lh_helper.write_geos(self.lh_dict, self._data_written)
        self._event.wait()
        self._event.clear()
    
    def _data_written(self, success):
        '''
        Callback function for writing data to the lighthouse.
        
        Args:
            success (bool): Whether the data was written successfully.
        '''
        if success:
            print('Lighthouse geometry write success')
        else:
            print('Lighthouse geometry write failure')

        self._event.set()

    def get_lighthouse_geos(self):
        '''
        Prints lighthouse geos to cli.

        Args:
            scf: crazyflie's scf

        Returns:
            None
        '''
        self.lh_helper.read_all_geos(self._geo_read_ready)
        self._event.wait()
        self._event.clear()

    def _init_kalman_log_config(self):
        self._reset_position_estimator()
        self._set_initial_position()
        self.log_pose_config = LogConfig(name='Position', period_in_ms=10)
        self.log_pose_config.add_variable('stateEstimate.x', 'float')
        self.log_pose_config.add_variable('stateEstimate.y', 'float')
        self.log_pose_config.add_variable('stateEstimate.z', 'float')
        self.log_pose_config.add_variable('stateEstimate.yaw', 'float')
        self.log_pose_config.add_variable('pm.batteryLevel', 'float')
        try: 
            self.log_pose_config.data_received_cb.add_callback(self.__log_pos_callback)
            self.log_pose_config.error_cb.add_callback(self.__log_error_callback)
            self.scf.cf.log.add_config(self.log_pose_config)
            self.log_pose_config.start()
        except KeyError as e:
            print('Could not start log configuration,'
                '{} not found in TOC'.format(str(e)))
        except AttributeError:
            print('Could not add Position log config, bad configuration.')
    def stop_kalman_log(self):
        self.log_pose_config.stop()

    def start_kalman_log(self):
        self.log_pose_config.start()

    def __log_pos_callback(self, timestamp, data, logconf):
        '''
        Callback function for logging position data.
        
        Args:
            timstamp: The timestamp of the logged data.
            data: The logged data.
            logconf: The log configuration.
        '''
        data['timestamp'] = timestamp
        print(data)
        # for name, value in data.items():
        #     print(f'{name}: {value:3.3f}, ', end='')
        # print()
        
    def __log_error_callback(self, logconf, msg):
        '''
        Callback function for logging errors.
        
        Args:
            logconf: The log configuration.
            msg: The error message.
        '''
        print(msg)
    
    def __init_lighthouse_log_config(self):
        self.log_lighthouse_config = LogConfig(name='Lighthouse', period_in_ms=10)
        self.log_lighthouse_config.add_variable('lighthouse.x', 'float')
        self.log_lighthouse_config.add_variable('lighthouse.y', 'float')
        self.log_lighthouse_config.add_variable('lighthouse.z', 'float')

        try:
            self.log_lighthouse_config.data_received_cb.add_callback(self.__log_pos_callback)
            self.log_lighthouse_config.error_cb.add_callback(self.__log_error_callback)
            self.scf.cf.log.add_config(self.log_lighthouse_config)
            self.log_lighthouse_config.start()
        except KeyError as e:
            print('Could not start log configuration,'
                '{} not found in TOC'.format(str(e)))
        except AttributeError:
            print('Could not add Position log config, bad configuration.')
    
    def __log_lh_pos_callback(self, timestamp, data, logconf):
        '''
        Callback function for logging lighthouse position data.
        
        Args:
            timstamp: The timestamp of the logged data.
            data: The logged data.
            logconf: The log configuration.
        '''
        data['lh timestamp'] = timestamp
        print(data)
        # for name, value in data.items():
        #     print(f'{name}: {value:3.3f}, ', end='')
        # print()

    def _geo_read_ready(self, geo_data):
        for id, data in geo_data.items():
            print('---- Geometry for base station', id + 1)
            data.dump()
            print()
        self._event.set()
  
    def __init_hl_commander(self):
        '''
        Initializes the high level commander.
        
        Args:
            scf (SyncCrazyflie): The SyncCrazyflie object.
        '''
        self.hl_commander = PositionHlCommander(self.scf, x = self._initial_position[0], y = self._initial_position[1], z = self._initial_position[2], default_height = DEFAULT_HEIGHT, controller = 1)
        time.sleep(.1)
        print(f'Position according to hl commander: {self.get_pos_hl_commander()}')
        time.sleep(1)
        print(f'Position according to hl commander: {self.get_pos_hl_commander()}')
        time.sleep(.1)
        self._set_hl_velocity(0.05)
    
    def _set_hl_velocity(self, velocity):
        '''
        Sets the velocity of the high level commander.
        
        Args:
            velocity (float): The velocity to set.
        '''
        self.hl_commander.set_default_velocity(velocity)
    def get_pos_hl_commander(self):
        '''
        Returns the position according to the high level commander'''
        return self.hl_commander.get_position()
    
    def hl_commander_workflow(self):
        ''' Starts hl commander in a hover state'''
        print("Starting take off")
        self.hl_commander.take_off(height = 1.0)
        print("Stay in one spot for 1 second(s)")
        time.sleep(1.0)
        # print("Going to final position")
        # self.hl_commander.go_to(self._final_position[0], self._final_position[1], self._final_position[2], velocity = 0.075)
        # time.sleep(5.0)
        self.hl_commander.land()

    def _set_initial_position(self):
        self.scf.cf.param.set_value('kalman.initialX', self._initial_position[0])
        self.scf.cf.param.set_value('kalman.initialY', self._initial_position[1])
        self.scf.cf.param.set_value('kalman.initialZ', self._initial_position[2])
        self.scf.cf.param.set_value('kalman.initialYaw', self._initial_yaw)
        self._reset_position_estimator()
        time.sleep(0.1)
        
    
    def _reset_position_estimator(self):
        self.scf.cf.param.set_value('kalman.resetEstimation', '1')
        time.sleep(0.1)
        self.scf.cf.param.set_value('kalman.resetEstimation', '0')
    
    def estimate_pose_from_lh(self, scf):
        self.stop_kalman_log()
        do_repeat = True
        while do_repeat:
            measurement = self.record_angles_average(scf)
            do_repeat = False
            if measurement is not None:
                position_measurement = measurement
            else:
                do_repeat = True
        self.estimate_position_from_sample(position_measurement)
        self.start_kalman_log()

    def record_angles_average(self, scf) -> LhCfPoseSample:
        '''
        Records the angles from the lighthouse and returns the average.
        Args:
            scf (SyncCrazyflie): The SyncCrazyflie object.
        Returns:
            LhCfPoseSample: The average of the lighthouse angles.
        '''
        recorded_angles = None

        is_ready = Event()

        def ready_cb(averages):
            nonlocal recorded_angles
            recorded_angles = averages
            is_ready.set()

        reader = LighthouseSweepAngleAverageReader(scf.cf, ready_cb)
        print('Taking lighthouse measurement...')
        reader.start_angle_collection()
        is_ready.wait(timeout = 10.0)

        if recorded_angles is None:
            print('Measurement failed, trying again!')
            return None

        angles_calibrated = {}
        for bs_id, data in recorded_angles.items():
            angles_calibrated[bs_id] = data[1]

        result = LhCfPoseSample(angles_calibrated=angles_calibrated)

        visible = ', '.join(map(lambda x: str(x + 1), recorded_angles.keys()))
        print(f'  Position recorded, base station ids visible: {visible}')

        if len(recorded_angles.keys()) < 2:
            print('Received too few base stations, we need at least two. Please try again!')
            print(f'Recorded keys: {recorded_angles.keys()}')
            result = None

        return result
        
    
    def estimate_position_from_sample(self, position_measurement: LhCfPoseSample):
        matched_samples = [position_measurement] 
        initial_guess, cleaned_matched_samples = LighthouseInitialEstimator.estimate(matched_samples, LhDeck4SensorPositions.positions)
        
        bs_poses = initial_guess.bs_poses
        cf_poses = initial_guess.cf_poses
        # cf is a Pose object
        print()
        print('------------------------------------')
        print("CF Position, as estimated by lighthouse. Note: This will estimate cf to be the origin of the new world frame.")
        for cf in cf_poses:
            translation = cf.translation
            rot_matrix = cf.rot_matrix
            print(f'{cf} translation: {translation}')
            print(f'{cf} rot_matrix: {rot_matrix}')
        print('------------------------------------')
        print("CF position in rotor frame as seen by LH:")
        for bs, pose_obj in bs_poses.items():
            print(f'{bs} translation: {pose_obj.translation}')
            print(f'{bs} rot_matrix: {pose_obj.rot_matrix}')
        print()
        print('------------------------------------')
        print("Current basestation location global frame:")
        for bs, geo in self.lh_dict.items():
            print(f'{bs}: {geo.origin}')
            print(f'Rotation matrix of bs {bs}: {geo.rotation_matrix}')
        print()
        print('------------------------------------')
        print("Position of the crazflie in global frame from lighthouse:")
        
        '''
        pseudocode:
        1. Get the lighthouse position and rotation matrix in the global frame
        2. Use that to output a position and rotation matrix for the crazyflie in the global frame
        '''


# The WriteGeoMem class is used to write only the geometry memory.
# It takes a URI of the Crazyflie to connect to and a dictionary of base station geometries to write.
# It uses the LighthouseMemHelper to write the geometries and waits for the data to be written.

# In the main function, it first initializes the low-level drivers.
# Then it reads the current values from the lighthouse memory.
# It creates a LighthouseBsGeometry object and modifies the origin and rotation_matrix fields.
# The new origin and rotation matrix are then written to the lighthouse.
if __name__ == '__main__':
    # URI to the Crazyflie to connect to
    uri = uri_helper.uri_from_env(default='radio://0/80/2M/E7E7E7E7E7')

    # Initialize the low-level drivers
    cflib.crtp.init_drivers()

    # Read the current values
    # temp_memory = ReadLHMem(uri)

    # Create a LighthouseBsGeometry object
    bs1geo = LighthouseBsGeometry()


    # Modify the origin and rotation_matrix fields
    bs1geo.origin = [0.0, 0.0, 0.1] # Best guess on wheere the base station is on tb
    bs1geo.rotation_matrix = [
        [0.0, -1.0, 0.0],
        [1.0, 0.0, 0.0],
        [0.0, 0.0, 1.0],
    ]

    # Write geo memory to crazyflie
    geo_dict = {0: bs1geo}
    WriteLHGeoMem(uri, geo_dict)
