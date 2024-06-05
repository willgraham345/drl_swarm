"""
The file that defines the cf_publisher executable within the ROS 2 system.
Responsible for all crazyflie communication, control, and publishing into Ros2. Acts as
a wrapper for each individual Crazyflie within ROS 2. 
"""
from threading import Event
import time
import math
from math import pi
import rclpy
from rclpy.node import Node
from rcl_interfaces.msg import ParameterDescriptor
import tf_transformations
from tf2_ros.transform_broadcaster import TransformBroadcaster
from tf2_ros.transform_listener import TransformListener
from tf2_ros.buffer import Buffer
from sensor_msgs.msg import Range
from sensor_msgs.msg import LaserScan
from nav_msgs.msg import Odometry
from geometry_msgs.msg import (
    Twist,
    Pose,
    TransformStamped,
    Point,
    Quaternion,
    )

import cflib.crtp
from cflib.crazyflie import Crazyflie
from cflib.crazyflie.log import LogConfig
from cflib.crazyflie.mem import LighthouseMemHelper
from cflib.crazyflie.mem import LighthouseBsGeometry, LighthouseBsCalibration



def radians(degrees):
    """
    simple conversion between degrees and radians
    """
    return degrees * math.pi / 180.0

ROTATION_MATRIX_90_PITCH = [
    [0.0, 0.0, 1.0],
    [0.0, 1.0, 0.0],
    [-1.0, 0.0, 0.0],
]

ROTATION_MATRIX_NEG_90_PITCH = [
    [0.0, 0.0, -1.0],
    [0.0, 1.0, 0.0],
    [1.0, 0.0, 0.0],
]
NO_ROTATION_MATRIX = [
    [1.0, 0.0, 0.0],
    [0.0, 1.0, 0.0],
    [0.0, 0.0, 1.0]
]

ROTATION_MATRIX_90_PITCH_180_ROLL = [
    [0.0, 0.0, -1.0],
    [0.0, -1.0, 0.0],
    [-1.0, 0.0, 0.0],
]

ROTATION_MATRIX_NEG_90_PITCH_180_ROLL = [
    [0.0, 0.0, 1.0],
    [0.0, -1.0, 0.0],
    [1.0, 0.0, 0.0],
]

ROTATION_MATRIX_90_PITCH_180_YAW = [
    [0.0, 0.0, 1.0],
    [0.0, -1.0, 0.0],
    [-1.0, 0.0, 0.0],
]

ROTATION_MATRIX_NEG_90_PITCH_180_YAW = [
    [0.0, 0.0, 1.0],
    [0.0, -1.0, 0.0],
    [1.0, 0.0, 0.0],
]
ROTATION_MATRIX_90_PITCH_180_YAW = [
    [0.0, 0.0, -1.0],
    [0.0, -1.0, 0.0],
    [-1.0, 0.0, 0.0],
]

ROTATION_MATRIX_90_PITCH_90_YAW = [
    [0.0, -1.0, 0.0],
    [0.0, 0.0, 1.0],
    [-1.0, 0.0, 0.0],
]
NOT_SURE_WHAT_ROTATION_MATRIX = [
    [0.0, 0.0, 1.0],
    [0.0, 1.0, 0.0],
    [1.0, 0.0, 0.0],
]
ZEROS = [
    [0.0, 0.0, 0.0],
    [0.0, 0.0, 0.0],
    [0.0, 0.0, 0.0],
]

INPUT_ROTATION_MATRIX = [ZEROS, ZEROS]

def dict_to_lh_config(geos: dict, rotation_matrices: list[list[list[float]]]):
    """
    Convert a dictionary of geometries and rotation matrices to a lighthouse configuration.

    Args:
        geos (dict): A dictionary of geometries, where the keys are the base stations and the
        values are the origins.  rotation_matrices (list[list[list[float]]]): A list of rotation
        matrices for each base station.

    Returns:
        dict: A dictionary representing the lighthouse configuration, where the keys are the base
        stations and the values are the corresponding geometries.

    """
    print(rotation_matrices)
    lh_config = {}
    for bs, origin in geos.items():
        bs_geo = LighthouseBsGeometry()
        bs_geo.origin = origin
        bs_geo.rotation_matrix = rotation_matrices[bs]
        bs_geo.valid = True
        lh_config[bs] = bs_geo
    return lh_config

class LighthouseData:
    """
    Initializes a new instance of the LighthousePoses class.

    Attributes:
        lh_frames (dict): A dictionary of lighthouse frames.
        lh_poses (dict): A dictionary of lighthouse poses.

    Args:
        basestation_tf2: dict with keys as tf2 frame IDs, and basestation n0 as value
        lh_poses (list[Pose]): A list of lighthouse poses.

    Example: 
        LighthousePoses(
        0: {'lh_pose': "tb1/lighthouse_pose", 'pose': [x, y, z, qx, qy, qz, qw]}
        1: {'lh_pose': "tb2/lighthouse_pose", 'pose': [x, y, z, qx, qy, qz, qw]}
        )
    """

    def __init__(self, lh_tf2_frames: list[str]):
        self.check_lh_frames(lh_tf2_frames)
        self.lh_frames = {}
        self.lh_poses = {}
        self.populate_frames_and_poses(lh_tf2_frames)

    def populate_frames_and_poses(self, lh_tf2_frames):
        """
        Populates the local arrays `lh_frames` and `lh_poses` with the given `lh_tf2_frames`.

        Args:
            lh_tf2_frames (list): A list of tf2 frames.

        Returns:
            None
        """
        for i, frame in enumerate(lh_tf2_frames):
            self.lh_frames[i] = frame
            self.lh_poses[i] = Pose(position=Point(x=0.0, y=0.0, z=0.0),
                                    orientation=Quaternion(x=0.0, y=0.0, z=0.0, w=1.0))

    def check_lh_frames(self, lh_tf2_frames):
        """
        Check the validity of the input list of tf2 frames.

        Args:
            lh_tf2_frames (list): A list of strings representing tf2 frames.

        Raises:
            ValueError: If lh_tf2_frames is not a list of strings or if it contains
            duplicate strings.

        """
        for frame in lh_tf2_frames:
            if not isinstance(frame, str):
                raise ValueError("lh_tf2_frames must be a list of strings")
            if lh_tf2_frames.count(frame) > 1:
                raise ValueError("lh_tf2_frames must contain unique strings")

    def check_pose_inputs(self, input_pose):
        """
        Check the validity of the input pose.

        Args:
            input_pose (dict): A dictionary mapping base station IDs to Pose objects.

        Raises:
            ValueError: If input_pose is not a dictionary or if it contains invalid keys.

        """
        if not isinstance(input_pose, dict):
            raise ValueError("input_pose must be a dictionary")
        if not set(input_pose.keys()).issubset(set(self.lh_frames.keys())):
            raise ValueError("input_pose contains invalid keys")
    def set_pose(self, input_pose: dict[int, Pose]):
        """
        Sets the pose for each base station.

        Args:
            input_pose (dict[int, Pose]): A dictionary mapping base station IDs to Pose objects.

        Returns:
            None
        """
        self.check_pose_inputs(input_pose)
        for bs, pose in input_pose.items():
            self.lh_poses[bs] = pose

    def get_lh_config(self):
        """
        Returns the configuration of the Lighthouse base stations.

        Returns:
            dict: A dictionary containing the configuration of each base station.
                The keys are the base station IDs and the values are instances of
                LighthouseBsGeometry.
        """
        lh_config = {}
        for bs, pose in self.lh_poses.items():
            bs_geo = LighthouseBsGeometry()
            bs_geo.origin = [pose.position.x, pose.position.y, pose.position.z]
            temp_rot_matrix = tf_transformations.quaternion_matrix([
                pose.orientation.x,
                pose.orientation.y,
                pose.orientation.z,
                pose.orientation.w
                ])
            bs_geo.rotation_matrix = temp_rot_matrix[:3, :3]
            bs_geo.valid = True
            lh_config[bs] = bs_geo
        return lh_config

class LighthouseConfigWriter:
    """
    Class that writes lighthouse configurations to crazyflie memory. Can be updated with new
    rotation matrices as needed.

    Attributes:
        _calibs_on_cf (bool): A flag indicating if the calibrations are on the crazyflie.
        cf (Crazyflie): The crazyflie instance to write to.
        calibs (dict[int, LighthouseBsCalibration]): A dictionary of calibration data for each
            base station.
        lh_helper (LighthouseMemHelper): A helper class from Bitcraze designed to reading and writing lighthouse data.
        lh_rotation_matrices (list[list[list[float]]]): A list of rotation matrices for each base
            station.
        _read_write_event (Event): An event to signal when reading and writing is complete.

    Args:
        crayzflie_instance (Crazyflie): The crazyflie instance to write to.
        calibs (dict[int, LighthouseBsCalibration]): A dictionary of calibration data for each
            base station.
    
    Methods:
        __init__(): Initializes a new instance of the LighthouseConfigWriter class.
        check_lh_frames(lh_tf2_frames): Check the validity of the input list of tf2 frames.
        check_pose_inputs(input_pose): Checks the validity of the input pose.
        dict_to_lh_config(geos: dict, rotation_matrices: list[list[list[float]]]): Converts
            a dictionary of geometries and rotation matrices to a lighthouse configuration.
        get_lh_config(): Returns the configuration of the Lighthouse base stations.
        _lh_geo_read_callback(geo_data): Callback function for reading lighthouse geometries
            from memory.
        _lh_calib_read_callback(calib_data): Callback function for reading lighthouse
            calibrations from memory.
        _lh_geo_data_written_callback(success): Callback function for writing lighthouse
            geometries to memory.
        _lh_calib_data_written_callback(success): Callback function for writing lighthouse
            calibrations to memory.
        populate_frames_and_poses(lh_tf2_frames): Populates the local arrays `lh_frames` and
            `lh_poses` with the given `lh_tf2_frames`.
        read_lh_geos_from_memory(): Reads lighthouse geometries from memory.
        read_lh_calibs_from_memory(): Reads lighthouse calibrations from memory.
        set_pose(input_pose: dict[int, Pose]): Sets the pose for each base station.
        update_rotation_matrices(rotation_matrices): Updates the rotation matrices for
            lighthouse configurations.
        write_lh_geos_to_memory(lh_config): Writes lighthouse geometries to memory.
        write_lh_calibs_to_memory(): Writes lighthouse calibrations to memory.

    """

    def __init__(self, crayzflie_instance: Crazyflie, calibs: dict[int, LighthouseBsCalibration]):
        # TODO: Refactor the lh0_rotation matrix so we can pass in both rotation matrices
        print()
        print()
        print('Configuring lighthouse')
        print()
        print()
        self._calibs_on_cf = []
        self.cf = crayzflie_instance
        self._calibs = calibs
        self._read_write_event = Event()
        self.lh_helper = LighthouseMemHelper(self.cf)
        self.lh_rotation_matrices = []
        self._read_write_event.clear()

        # * Old code that I'm worried to throw away until it passes tests and runs experimentally.

        #  Write lighthouse geometries to memory, output results to console.
        # self.write_lh_geos_to_memory()
        # self.read_lh_geos_from_memory()
        # #  Check if calibs have been written to memory. If not, write them.
        # If they are there, read them out
        # try:
        #     self.read_lh_calibs_from_memory()
        # except:
        #     self.write_lh_calibs_to_memory()
        #     self.read_lh_calibs_from_memory()
        # print(); print();
        # print('Lighthouse configuration complete')
        # print(); print()

    def write_lh_geos_to_memory(self, lh_config):
        """
        Writes lighthouse geometries to memory.

        Args:
            lh_config: The lighthouse configuration to write.
        """
        try:
            self.lh_helper.write_geos(lh_config, self._lh_geo_data_written_callback)
            self._read_write_event.wait()
            self._read_write_event.clear()

        except Exception as e:
            print(f"Error writing lighthouse data to memory: {e}")

    def write_lh_calibs_to_memory(self):
        """
        Writes lighthouse calibrations to memory.
        """
        try:
            self.lh_helper.write_calibs(self._calibs, self._lh_calib_data_written_callback)
            self._read_write_event.wait()
            self._read_write_event.clear()
        except Exception as e:
            print(f"Error writing lighthouse calibration to memory: {e}")

    def read_lh_geos_from_memory(self):
        """
        Reads lighthouse geometries from memory.
        """
        print("Reading lighthouse data from memory")
        self.lh_helper.read_all_geos(self._lh_geo_read_callback)
        self._read_write_event.wait()
        self._read_write_event.clear()

    def read_lh_calibs_from_memory(self):
        """
        Reads lighthouse calibrations from memory.
        """
        print("Reading lighthouse calibration from memory")
        self.lh_helper.read_all_calibs(self._lh_calib_read_callback)
        self._read_write_event.wait()
        self._read_write_event.clear()

    def _lh_geo_read_callback(self, geo_data):
        """
        Callback function for reading lighthouse geometries from memory.
        """
        print("Lighthouse data read")
        self._calibs_on_cf = True
        for id, data in geo_data.items():
            print('---- Geometry for base station', id + 1)
            data.dump()
            print()
        # print(geo_data)
        self._read_write_event.set()

    def _lh_calib_read_callback(self, calib_data):
        """
        Callback function for reading lighthouse calibrations from memory.
        """
        for id, data in calib_data.items():
            print('---- Calibration data for base station', id + 1)
            data.dump()
            print()
        self._read_write_event.set()

    def _lh_geo_data_written_callback(self, success):
        """
        Callback function for writing lighthouse geometries to memory.
        """
        if success:
            print('Lighthouse data correctly written to crazyflie')
        else:
            print('Writing crazyflie lighthouse data failed')
        self._read_write_event.set()

    def _lh_calib_data_written_callback(self, success):
        """
        Callback function for writing lighthouse calibrations to memory.
        """
        if success:
            print('Lighthouse calibration data correctly written to crazyflie')
        else:
            print('Writing crazyflie lighthouse calibration data failed')
        self._read_write_event.set()

    def update_rotation_matrices(self, rotation_matrices: list[list[list[float]]]):
        """
        Updates the rotation matrices for lighthouse configurations. Calls read and write functions
        to update the crazyflie memory.

        Args:
            rotation_matrices: The new rotation matrices to update.
        """
        self._read_write_event.clear()
        self.lh_rotation_matrices = rotation_matrices
        self.read_lh_geos_from_memory()
        self.write_lh_geos_to_memory() #FIXME: This has issues with the callback
        self.read_lh_geos_from_memory()

class CrazyfliePublisher(Node):

    """drl_pkg.crazyflie_publisher.crazyfliepublisher
    Publisher node for controlling the Crazyflie drone.

    This node initializes the necessary publishers, subscribers, and timers for controlling the
    Crazyflie drone. It also handles the connection to the Crazyflie and sends flight commands if
    in flight mode.

    Attributes:
        - _cf (Crazyflie): The Crazyflie instance.
        - _fly (bool): Determines if the Crazyflie is in testing mode.
        - _initial_orientation_quaternion (list): The initial orientation quaternion.
        - _initial_translation (list): The initial translation.
        - _lh1_ros2_pose_frame (str): The frame ID for the pose of the first lighthouse.
        - _lh2_ros2_pose_frame (str): The frame ID for the pose of the second lighthouse.
        - _lh_config_writer_initialized (bool): Determines if the lighthouse configuration writer is
            initialized.
        - _read_config_data (bool): Determines if the configuration data has been read.
        - _robot_config (dict): The configuration data for the robot.
        - _timer_lh_pose_update (Timer): The timer for updating the lighthouse pose.
        - laser_publisher (Publisher): The publisher for the laser scan data.
        - lh_pose_data (LighthouseData): The lighthouse pose data.
        - lh0_pose_listener (TransformListener): The listener for the pose of the first lighthouse.
        - lh1_pose_listener (TransformListener): The listener for the pose of the second lighthouse.
        - odom_publisher (Publisher): The publisher for the odometry data.
        - range_publisher (Publisher): The publisher for the range data.
        - ranges (list): The range data.
        - target_twist (Twist): The target twist.
        - tf_buffers (dict): The tf2 buffers.
        - tfbr (TransformBroadcaster): The tf2 broadcaster.
    
    Methods:
        - __init__(): Initializes a new instance of the CrazyfliePublisher class.
        - _connected(): Callback for initial connection with the Crazyflie.
        - sendHoverCommand(): Sends hover command to the Crazyflie.
        - cmd_vel_callback(twist: Twist): Callback for the command velocity.
        - publish_laserscan_data(): Publishes the laser scan data.
        - _range_log_error(logconf, msg): Callback for the log API when an error occurs.
        - _range_log_data(timestamp, data, logconf): Callback for the log API when data arrives.
        - _stab_log_error(logconf, msg): Callback for the log API when an error occurs.
        - _stab_log_data(timestamp, data, logconf): Callback for the log API when data arrives.
        - _lh_log_error(logconf, msg): Callback for the log API when an error occurs.
        - _lh_log_data(timestamp, data, logconf): Callback for the log API when data arrives.
        - _lh_geo_read_callback(geo_data): Callback function for reading lighthouse geometries
            from memory.
        - _lh_calib_read_callback(calib_data): Callback function for reading lighthouse
            calibrations from memory.
        - _lh_geo_data_written_callback(success): Callback function for writing lighthouse
            geometries to memory.
        - _lh_calib_data_written_callback(success): Callback function for writing lighthouse
            calibrations to memory.
        - write_lh_geos_to_memory(lh_config): Writes lighthouse geometries to memory.
        - write_lh_calibs_to_memory(): Writes lighthouse calibrations to memory.
        - read_lh_geos_from_memory(): Reads lighthouse geometries from memory.
        - read_lh_calibs_from_memory(): Reads lighthouse calibrations from memory.
        - update_rotation_matrices(rotation_matrices): Updates the rotation matrices for
            lighthouse configurations.
        - dict_to_lh_config(geos: dict, rotation_matrices: list[list[list[float]]]): Converts
        a dictionary of geometries and rotation matrices to a lighthouse configuration.
        - check_lh_frames(lh_tf2_frames): Checks the validity of the input list of tf2 frames.
        - check_pose_inputs(input_pose): Checks the validity of the input pose.
        - set_pose(input_pose: dict[int, Pose]): Sets the pose for each base station.
        - get_lh_config(): Returns the configuration of the Lighthouse base stations.
        - populate_frames_and_poses(lh_tf2_frames): Populates the local arrays `lh_frames` and
            `lh_poses` with the given `lh_tf2_frames`.
        - check_lh_frames(lh_tf2_frames): Check the validity of the input list of tf2 frames.
        

    Other Parameters:
        - config_file (str): The path to the configuration file.
        - fly (bool): Determines if the Crazyflie is in testing mode.
        - lh1_pose_frame (str): The frame ID for the pose of the first lighthouse.
        - lh2_pose_frame (str): The frame ID for the pose of the second lighthouse.
        - URI (str): The URI of the Crazyflie.
    Raises:
        Exception: If an error occurs while getting the parameters.
    """

    def __init__(self):

        # ! Name node
        super().__init__("crazyflie_publisher")
        self.get_logger().debug("Initializing CrazyfliePublisher")

        # ! Declare and getparameters
        self.declare_parameter('URI', rclpy.Parameter.Type.STRING)
        self.declare_parameter('fly', rclpy.Parameter.Type.BOOL,
            ParameterDescriptor(description = "Determines if the crazyflie is in testing mode"))
        #FUTURE_DEV: Refactor to take dynamic number of turtlebots
        self.declare_parameter(
            name='lh0_pose_frame',
            value='tb1/lighthouse_pose')  # value will only be used if parameter not set
        self.declare_parameter(
            name='lh1_pose_frame',
            value='tb2/lighthouse_pose') # value will only be used if parameter not set
        self.declare_parameter(
            name = 'initial_translation',
            value = [0.0, 0.0, 0.0]
        )
        self.declare_parameter(
            name = 'initial_orientation_quaternion',
            value = [0.0, 0.0, 0.0, 1.0]
        )
        try:
            self._fly = self.get_parameter('fly').value
            self.get_logger().info("Got fly parameter")
            self._link_uri = self.get_parameter('URI').value
            self.get_logger().info("Got URI parameter")
            self.lh1_ros2_pose_frame = self.get_parameter('lh0_pose_frame').value
            self.get_logger().info("Got lh0_pose_frame parameter")
            self.lh2_ros2_pose_frame = self.get_parameter('lh1_pose_frame').value
            self.get_logger().info("Got lh1_pose_frame parameter")
            self._initial_translation = self.get_parameter('initial_translation').value
            self.get_logger().info("Got initial_translation parameter")
            self._initial_orientation_quaternion =self.get_parameter(
                'initial_orientation_quaternion').value
            self.get_logger().info("Got initial_orientation_quaternion parameter")
        except Exception as e:
            self.get_logger().fatal(f"Error getting paramater value: {e}")

        # ! Initialize class members, subscribers, and publishers
        self.ranges= [0.0, 0.0, 0.0, 0.0, 0.0]
        self.tf_buffers = {0: Buffer(), 1: Buffer()}
        self.lh_pose_data = LighthouseData([self.lh1_ros2_pose_frame, self.lh2_ros2_pose_frame])
        self._read_config_data = False
        self._robot_config = None
        self._lh_config_writer_initialized = False


        # Initialize publishers and tf2 broadcasters
        self.range_publisher = self.create_publisher(Range, "/zrange", 10)
        self.laser_publisher = self.create_publisher(LaserScan, "/scan", 10)
        self.odom_publisher = self.create_publisher(Odometry,  "/odom", 10)
        self.tfbr = TransformBroadcaster(self)

        # Create subscribers and listeners
        self.create_subscription(Twist,  "/cmd_vel", self.cmd_vel_callback, 1)
        self.lh0_pose_listener = TransformListener(self.tf_buffers[0], self)
        self.lh1_pose_listener = TransformListener(self.tf_buffers[1], self)

        # Handle crazyflie connection
        self._cf = Crazyflie(rw_cache='./cache')
        self._cf.connected.add_callback(self._connected)
        self._cf.disconnected.add_callback(self._disconnected)
        self._cf.connection_failed.add_callback(self._connection_failed)
        self._cf.connection_lost.add_callback(self._connection_lost)


        # ! Start workflow
        self._cf.open_link(self._link_uri)
        self._set_initial_position()
        self.create_timer(1.0/30.0, self.publish_laserscan_data)
        # Create timer for pose listener
        self._timer_lh_pose_update = self.create_timer(2.5, self._on_timer_lh_pose_callback)
        self._init_lh_config_writer()


        # Send flight commands if in flight mode
        # ! Flight loop
        if self._fly == True:
            timer_period = 0.1  # seconds
            self.create_timer(timer_period, self.sendHoverCommand)
            self.hover = {'x': 0.0, 'y': 0.0, 'z': 0.0, 'yaw': 0.0, 'height': 0.3}
            self._cf.commander.send_hover_setpoint(
                self.hover['x'], self.hover['y'], self.hover['yaw'],
                self.hover['height'])
        self._cf.param.request_update_of_all_params()

    def _connected(self):
        """
        Callback for initial connection with the crazyflie. Sets the loggging configurations, logging callbacks, the TOC, and starts loggers if successful.
        """
        self._lg_stab = LogConfig(name='Stabilizer', period_in_ms=100)
        self._lg_stab.add_variable('stateEstimate.x', 'float')
        self._lg_stab.add_variable('stateEstimate.y', 'float')
        self._lg_stab.add_variable('stateEstimate.z', 'float')
        self._lg_stab.add_variable('stabilizer.roll', 'float')
        self._lg_stab.add_variable('stabilizer.pitch', 'float')
        self._lg_stab.add_variable('stabilizer.yaw', 'float')

        self._lg_range = LogConfig(name='Range', period_in_ms=100)
        self._lg_range.add_variable('range.zrange', 'uint16_t')
        self._lg_range.add_variable('range.front', 'uint16_t')
        self._lg_range.add_variable('range.right', 'uint16_t')
        self._lg_range.add_variable('range.left', 'uint16_t')
        self._lg_range.add_variable('range.back', 'uint16_t')

        self._lh_pose = LogConfig(name='Lighthouse', period_in_ms=100)
        self._lh_pose.add_variable('lighthouse.x', 'float')
        self._lh_pose.add_variable('lighthouse.y', 'float')
        self._lh_pose.add_variable('lighthouse.z', 'float')

        try:
            self._cf.log.add_config(self._lg_stab)
            self._lg_stab.data_received_cb.add_callback(self._stab_log_data)
            self._lg_stab.error_cb.add_callback(self._stab_log_error)
            self._lg_stab.start()
            self._cf.log.add_config(self._lg_range)
            self._lg_range.data_received_cb.add_callback(self._range_log_data)
            self._lg_range.error_cb.add_callback(self._range_log_error)
            self._lg_range.start()
            self._cf.log.add_config(self._lh_pose)
            self._lh_pose.data_received_cb.add_callback(self._lh_log_data)
            self._lh_pose.error_cb.add_callback(self._lh_log_error)
            self._lh_pose.start()

        except KeyError as e:
            self.get_logger.fatal('Could not start log configuration,'
                  '{} not found in TOC'.format(str(e)))
        except AttributeError:
            self.get_logger.fatal('Could not add Stabilizer log config, bad configuration.')

        # except Exception as e:
            # self.get_logger().fatal(f"Error reading lighthouse geometries from config file: {e}")

    def sendHoverCommand(self):
        hover_height =  self.hover['height'] + self.hover['z']*0.1
        self._cf.commander.send_hover_setpoint(
            self.hover['x'], self.hover['y'], self.hover['yaw'],
            hover_height)
        self.hover['height'] = hover_height

    def cmd_vel_callback(self, twist: Twist):
        self.target_twist = twist

        self.hover['x'] = twist.linear.x
        self.hover['y'] = twist.linear.y
        self.hover['z'] = twist.linear.z
        self.hover['yaw'] = -1* math.degrees(twist.angular.z)

    def publish_laserscan_data(self):

        try:
            msg = LaserScan()
            msg.header.stamp = self.get_clock().now().to_msg()
            msg.header.frame_id = 'base_link'
            msg.range_min = 0.01
            msg.range_max = 3.49
            msg.ranges = self.ranges
            msg.angle_min = 0.5 * 2*pi
            msg.angle_max =  -0.5 * 2*pi
            msg.angle_increment = -1.0*pi/2
            self.laser_publisher.publish(msg)
        except Exception as e:
            self.get_logger().warning(f"Error in laser scan data, not published to tf2: {e}")


    def _range_log_error(self, logconf, msg):
        """Callback from the log API when an error occurs"""
        print('Error when logging %s: %s' % (logconf.name, msg))
        self.get_logger().debug('Error when logging %s: %s' % (logconf.name, msg))

    def _range_log_data(self, timestamp, data, logconf):
        """Callback from a the log API when data arrives"""
        print(data)

        try:
            t_range = TransformStamped()
            q = tf_transformations.quaternion_from_euler(0, radians(90), 0)
            t_range.header.stamp = self.get_clock().now().to_msg()
            t_range.header.frame_id = 'base_link'
            t_range.child_frame_id = 'crazyflie_flowdeck'
            t_range.transform.rotation.x = q[0]
            t_range.transform.rotation.y = q[1]
            t_range.transform.rotation.z = q[2]
            t_range.transform.rotation.w = q[3]
            self.tfbr.sendTransform(t_range)
        except Exception as e:
            self.get_logger().warning(f"Error in range transform, not published to tf2: {e}")

        zrange = float(data.get('range.zrange'))/1000.0
        msg = Range()
        msg.header.stamp = self.get_clock().now().to_msg()
        msg.header.frame_id = 'crazyflie_flowdeck'
        msg.field_of_view = radians(4.7)
        msg.radiation_type = Range().INFRARED
        msg.min_range = 0.01
        msg.max_range = 3.5
        msg.range = zrange
        ##self.range_publisher.publish(msg)

        max_range = 3.49
        front_range = float(data.get('range.front'))/1000.0
        left_range = float(data.get('range.left'))/1000.0
        back_range = float(data.get('range.back'))/1000.0
        right_range = float(data.get('range.right'))/1000.0
        if front_range > max_range:
            front_range = float("inf")
        if left_range > max_range:
            left_range = float("inf")
        if right_range > max_range:
            right_range = float("inf")
        if back_range > max_range:
            back_range = float("inf")  
        self.ranges = [back_range, left_range, front_range, right_range, back_range]

    def _stab_log_error(self, logconf, msg):
        """Callback from the log API when an error occurs"""
        print('Error when logging %s: %s' % (logconf.name, msg))

    def _stab_log_data(self, timestamp, data, logconf):
        """Callback from a the log API when data arrives"""

        # for name, value in data.items():
        #     print(f'{name}: {value:3.3f} ', end='')
        # print()
        print('stab_data', data)

        # Get odometry values from crazyflie stability logger
        try: 
            x = data.get('stateEstimate.x')
            y = data.get('stateEstimate.y')
            z = data.get('stateEstimate.z')
            roll = radians(data.get('stabilizer.roll'))
            pitch = radians(-1.0 * data.get('stabilizer.pitch'))
            yaw = radians(data.get('stabilizer.yaw'))

            # Create odometry message and publish to ROS2
            odom_msg = Odometry()
            odom_msg.pose.pose.position.x = x
            odom_msg.pose.pose.position.y = y
            odom_msg.pose.pose.position.z = z
            q = tf_transformations.quaternion_from_euler(roll, pitch, yaw)
            odom_msg.pose.pose.orientation.x = q[0]
            odom_msg.pose.pose.orientation.y = q[1]
            odom_msg.pose.pose.orientation.z = q[2]
            odom_msg.pose.pose.orientation.w = q[3]
            self.odom_publisher.publish(odom_msg)
        except Exception as e:
            self.get_logger().warning(f"Error in publishing odom message: {e}")


        # Create tf2 transforms and send to tf2
        try:
            q_base = tf_transformations.quaternion_from_euler(0, 0, yaw)
            t_base = TransformStamped()
            t_base.header.stamp = self.get_clock().now().to_msg()
            t_base.header.frame_id = 'odom'
            t_base.child_frame_id = 'base_footprint'
            t_base.transform.translation.x = x
            t_base.transform.translation.y = y
            t_base.transform.translation.z = 0.0
            t_base.transform.rotation.x = q_base[0]
            t_base.transform.rotation.y = q_base[1]
            t_base.transform.rotation.z = q_base[2]
            t_base.transform.rotation.w = q_base[3]
            self.tfbr.sendTransform(t_base)
        except Exception as e:
            self.get_logger().warning(f"Error in publishing base_footprint transform: {e}")

        # Publish t_cf to tf2
        try:
            # Create t_cf message, assigned values from the crazyflie stability logger
            t_cf = TransformStamped()
            q_cf = tf_transformations.quaternion_from_euler(roll, pitch, 0)
            t_cf.header.stamp = self.get_clock().now().to_msg()
            t_cf.header.frame_id = 'base_footprint'
            t_cf.child_frame_id = 'base_link'
            t_cf.transform.translation.x = 0.0
            t_cf.transform.translation.y = 0.0
            t_cf.transform.translation.z = z
            t_cf.transform.rotation.x = q_cf[0]
            t_cf.transform.rotation.y = q_cf[1]
            t_cf.transform.rotation.z = q_cf[2]
            t_cf.transform.rotation.w = q_cf[3]
            self.tfbr.sendTransform(t_cf)
        except Exception as e:
            self.get_logger().warning(f"Error in base_link transform publisher: {e}")
    
    def _lh_log_error(self, logconf, msg):
        """Callback from the log API when an error occurs"""
        print('Error when logging %s: %s' % (logconf.name, msg))

    def _lh_log_data(self, timestamp, data, logconf):
        """Callback from a the log API when LH data arrives"""
        # print to console

        try:
            print(data)

            # Send to tf2
            t_lh = TransformStamped()
            t_lh.header.frame_id = 'base_link'
            t_lh.child_frame_id = 'lighthouse'

            x = data.get('lighthouse.x')
            y = data.get('lighthouse.y')
            z = data.get('lighthouse.z')
            q = tf_transformations.quaternion_from_euler(0, 0, 0)
            t_lh.header.stamp = self.get_clock().now().to_msg()
            t_lh.child_frame_id = 'lighthouse_link'
            t_lh.transform.translation.x = x
            t_lh.transform.translation.y = y
            t_lh.transform.translation.z = z
            t_lh.transform.rotation.x = q[0]
            t_lh.transform.rotation.y = q[1]
            t_lh.transform.rotation.z = q[2]
            t_lh.transform.rotation.w = q[3]
            self.tfbr.sendTransform(t_lh)
        except:
            self.get_logger().warning("Error in LH log data, not published to tf2")
            self.get_logger().warning("May need to recalibrate kalman filter values for lighthouse")
            print("Error in LH log data, not published to tf2")

    def _init_lh_config_writer(self):
        """
        Initializes the LighthouseConfigWriter class with the necessary data. Reads from
        self.lh_pose_data

        Members:
        - self.lh_config_writer
        """
        # TODO: Confirm that we are getting correct data output in the lab. 
        calibs = {0: calib1, 1: calib0}
        self.lh_config_writer = LighthouseConfigWriter(self._cf, calibs)
        self._lh_config_writer_initialized = True

    def _on_timer_lh_pose_callback(self):
        transforms = []
        try:
            i = 0
            for bs, buffer in self.tf_buffers.items():
                global_frame = 'map'
                des_frame = self.lh_pose_data.lh_frames[i]
                now = rclpy.time.Time()
                trans = buffer.lookup_transform(
                    des_frame,
                    global_frame,
                    now)
                transforms.append(trans)
        except TransformException as ex:
            self.get_logger().warning(
                f'Could not transform {des_frame} to {global_frame}: {ex}')
            # TODO: Run this with the following being published:
            """
            ros2 run tf2_ros static_transform_publisher --x x --y y --z z --yaw yaw --pitch pitch --roll roll --frame-id frame_id --child-frame-id child_frame_id
            """
            return

        # Update lighthouse data with new pose
        for i in range(len(transforms)):
            self.lh_pose_data.lh_poses[i].position = Point(
                x = transforms[i].transform.translation.x,
                y = transforms[i].transform.translation.y,
                z = transforms[i].transform.translation.z)
            self.lh_pose_data.lh_poses[i].orientation = Quaternion(
                x = transforms[i].transform.rotation.x,
                y = transforms[i].transform.rotation.y,
                z = transforms[i].transform.rotation.z,
                w = transforms[i].transform.rotation.w)

        print(f"lh_pose_data: {self.lh_pose_data.lh_poses}")
        # Update lighthouse data in memory
        lh_config = self.lh_pose_data.get_lh_config()
        self.lh_config_writer.write_lh_geos_to_memory(lh_config)
        self.lh_config_writer.read_lh_geos_from_memory()

        # if self._lh_initialized is True:
        #     try:
        #         lh0_pose = self._lh0_buffer.lookup_transform(
        #             self._lh0_pose_frame,
        #             'map',
        #             rclpy.time.Time())
        #         lh1_pose = self._lh1_buffer.lookup_transform(
        #             self._lh1_pose_frame,
        #             'map',
        #             rclpy.time.Time())
        #     except Exception as e:
        #         self.get_logger().warning(f"Error in lh0_pose_listener_callback: {e}")
        #         return
        #     x0 = lh0_pose.transform.translation.x
        #     y0 = lh0_pose.transform.translation.y
        #     z0 = lh0_pose.transform.translation.z
        #     x1 = lh1_pose.transform.translation.x
        #     y1 = lh1_pose.transform.translation.y
        #     z1 = lh1_pose.transform.translation.z
        #     qx0 = lh0_pose.transform.rotation.x
        #     qy0 = lh0_pose.transform.rotation.y
        #     qz0 = lh0_pose.transform.rotation.z
        #     qw0 = lh0_pose.transform.rotation.w
        #     qx1 = lh1_pose.transform.rotation.x
        #     qy1 = lh1_pose.transform.rotation.y
        #     qz1 = lh1_pose.transform.rotation.z
        #     qw1 = lh1_pose.transform.rotation.w
        #     temp_matrix_0= tf_transformations.quaternion_matrix([qx0, qy0, qz0, qw0])
        #     temp_matrix_1 = tf_transformations.quaternion_matrix([qx1, qy1, qz1, qw1])
        #     print(f"Temp matrix 0: {temp_matrix_0}")
        #     rotation_matrices = [
        #         temp_matrix_0[:3, :3],
        #         temp_matrix_1[:3, :3]]
        #     print(f"Rotation matrices: {rotation_matrices}")
        #     self.lh_config_writer.update_rotation_matrices(rotation_matrices)
        #     print();
        #     # Update lighthouse pose

    # ! These are fine
    def _set_initial_position(self):
        # self._reset_position_estimator()
        self.get_logger().info('Resetting cf position estimator')
        self._cf.param.set_value('kalman.initialX', self._initial_translation[0])
        self._cf.param.set_value('kalman.initialY', self._initial_translation[1])
        self._cf.param.set_value('kalman.initialZ', self._initial_translation[2])
        # self._reset_position_estimator()
        time.sleep(0.1)

    def _reset_position_estimator(self):
        self._cf.param.set_value('kalman.resetEstimation', '1')
        time.sleep(0.1)
        self._cf.param.set_value('kalman.resetEstimation', '0')

    def _disconnected():
        """
        Callback to print that the crazyflie has been disconnected."""
        print('disconnected')

    def _connection_failed(self, link_uri, msg):
        print('connection_failed')

    def _connection_lost(self, link_uri, msg):
        print('connection_lost')

def main(args=None):
    cflib.crtp.init_drivers()
    rclpy.init(args=args)
    crazyflie_publisher = CrazyfliePublisher()
    rclpy.spin(crazyflie_publisher)
    crazyflie_publisher.destroy_node()
    rclpy.shutdown



if __name__ == '__main__':
    main()



# For debugging as a normal python file
"""
def main():
    ls = launch.LaunchService()
    ld = generate_launch_description()
    ls.include_launch_description(ld)
    return ls.run()


if __name__ == '__main__':
    main()
"""