#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  
"""
Classes taken from Crazyflie example for writing to lighthouse base station geometry and calibration.
Modified for use in webots_pkg.

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
    #TODO: Refactor this class to take a rotation matrix and origin as arguments rather than a dictionary
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
    
    Args:
        URI (str): The URI of the Crazyflie to sync with.
        initial_position (list[int]): The initial position of the Crazyflie.
        initial_yaw (int): The initial yaw of the Crazyflie (in radians)
        geos_dict (dict): The dictionary of base station geometries to write.
        rotation_matrix (list): The rotation matrix of the base station.

    Attributes:
        cf (Crazyflie): The Crazyflie object.
        _initial_position (list[int]): The initial position of the Crazyflie.
        _initial_yaw (int): The initial yaw of the Crazyflie (in radians)
        _event (Event): The event object used for synchronization.
        logconf (LogConfig): The log configuration.
        lh_helper (LighthouseMemHelper): The lighthouse memory helper.
        lh_dict (dict): The dictionary of base station geometries to write.

    Methods:
        setup: Sets up the Crazyflie.
        _validate_geos: Validates the base station geometries.
        _init_configure_lighthouse: Initializes the lighthouse configuration.
        _data_written: Callback function for writing data to the lighthouse.
        get_lighthouse_geos: Prints lighthouse geos to cli.
        _geo_read_ready: Callback function for reading lighthouse geos.
        _init_log_config: Initializes the log configuration and adds callback for logging function.
        _log_pos_callback: Callback function for logging position data.
        hover: Hover the Crazyflie for 5 seconds.
        _set_initial_position: Sets the initial position of the Crazyflie.
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
        self._validate_geos(geos_dict, rotation_matrix)
        self._initial_position = initial_position
        self._final_position = final_position
        self._initial_yaw = initial_yaw

        self._event = Event()
        with SyncCrazyflie(URI, cf = Crazyflie(rw_cache='./cache')) as scf:
            self.setup(scf)

    def setup(self, scf):
        self._init_configure_lighthouse(scf)
        self._init_kalman_log_config(scf)
        # self.estimate_pose_from_lh(scf)
        # self.get_lighthouse_geos()
        time.sleep(1)        
        # self.hover(scf)
        self.send_to_position(scf, self._final_position)
    
    def _validate_geos(self, geos_dict, rotation_matrix):
        '''
        '''
        self.lh_dict = {}
        for bs in geos_dict:
            bs_geo = LighthouseBsGeometry()
            bs_geo.origin = geos_dict[bs]
            bs_geo.rotation_matrix = rotation_matrix
            bs_geo.valid = True
            self.lh_dict[bs] = bs_geo

    def _init_configure_lighthouse(self, scf):
        '''
        This class initializes a new lighthouse geo writer for easier use.
        
        Args:
            config_packet (LighthouseConfigPacket): The configuration packet for the lighthouse.
        '''
        self.lh_helper = LighthouseMemHelper(scf.cf)
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

    def _init_kalman_log_config(self, scf):
        self._reset_position_estimator(scf)
        self._set_initial_position(scf)
        self.log_config = LogConfig(name='Position', period_in_ms=10)
        self.log_config.add_variable('stateEstimate.x', 'float')
        self.log_config.add_variable('stateEstimate.y', 'float')
        self.log_config.add_variable('stateEstimate.z', 'float')
        self.log_config.add_variable('stabilizer.yaw', 'float')
        try: 
            self.log_config.data_received_cb.add_callback(self.__log_pos_callback)
            self.log_config.error_cb.add_callback(self.__log_error_callback)
            scf.cf.log.add_config(self.log_config)
            self.log_config.start()
        except KeyError as e:
            print('Could not start log configuration,'
                '{} not found in TOC'.format(str(e)))
        except AttributeError:
            print('Could not add Position log config, bad configuration.')
        
    def __log_pos_callback(self, timstamp, data, logconf):
        '''
        Callback function for logging position data.
        
        Args:
            timstamp: The timestamp of the logged data.
            data: The logged data.
            logconf: The log configuration.
        '''
        print(data)
        for name, value in data.items():
            print(f'{name}: {value:3.3f}', end='')
        print()
        
        
    def __log_error_callback(self, logconf, msg):
        '''
        Callback function for logging errors.
        
        Args:
            logconf: The log configuration.
            msg: The error message.
        '''
        print(msg)

    def _geo_read_ready(self, geo_data):
        for id, data in geo_data.items():
            print('---- Geometry for base station', id + 1)
            data.dump()
            print()
        self._event.set()


    def hover(self, scf):
        '''
        Hover the Crazyflie for 5 seconds.
        '''
        self._set_initial_position(scf)
        with MotionCommander(scf, default_height = DEFAULT_HEIGHT) as mc:
            time.sleep(5)
    
    def send_to_position(self, scf, position):
        '''
        Send the Crazyflie to a position.
        
        Args:
            scf (SyncCrazyflie): The SyncCrazyflie object.
            position (list[int]): The position to send the Crazyflie to.
        '''
        with PositionHlCommander(scf, default_height = DEFAULT_HEIGHT) as pc:
            pc.take_off(height = 0.75)
            time.sleep(5)
            pc.go_to(self._final_position[0], self._final_position[1], self._final_position[2], velocity = 0.075)
            time.sleep(5)
            pc.land()

    def _set_initial_position(self, scf):
        scf.cf.param.set_value('kalman.initialX', self._initial_position[0])
        scf.cf.param.set_value('kalman.initialY', self._initial_position[1])
        scf.cf.param.set_value('kalman.initialZ', self._initial_position[2])
        scf.cf.param.set_value('kalman.initialYaw', self._initial_yaw)
        self._reset_position_estimator(scf)
        
    
    def _reset_position_estimator(self, scf):
        scf.cf.param.set_value('kalman.resetEstimation', '1')
        time.sleep(0.1)
        scf.cf.param.set_value('kalman.resetEstimation', '0')
    
    def estimate_pose_from_lh(self, scf):
        do_repeat = True
        while do_repeat:
            measurement = self.record_angles_average(scf)
            do_repeat = False
            if measurement is not None:
                position_measurement = measurement
            else:
                do_repeat = True
        self.estimate_position_from_sample(position_measurement)

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
            result = None

        return result
        
    
    def estimate_position_from_sample(self, position_measurement: LhCfPoseSample):
        matched_samples = [position_measurement] 
        initial_guess, cleaned_matched_samples = LighthouseInitialEstimator.estimate(matched_samples, LhDeck4SensorPositions.positions)
        
        bs_poses = initial_guess.bs_poses
        cf_poses = initial_guess.cf_poses
        for cf in initial_guess.cf_poses:
            print(f"Guess of cf", cf, "matrix vec:", cf.matrix_vec)
        for bs, value in initial_guess.bs_poses.items():
            print("Guess of bs", bs, "matrix vec:", value.matrix_vec)
        


# This Python file is used to write a new origin and rotation matrix for the lighthouse.

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
