"""
The file that defines the cf_publisher executable within the ROS 2 system.
Responsible for all crazyflie communication, control, and publishing into Ros2. Acts as
a wrapper for each individual Crazyflie within ROS 2.
"""

import os
from threading import Event
import time
import math
from math import pi
import yaml
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
from cflib.crazyflie.syncCrazyflie import SyncCrazyflie
from cflib.crazyflie.log import LogConfig
from cflib.crazyflie.mem import LighthouseMemHelper
from cflib.crazyflie.mem import LighthouseBsGeometry, LighthouseBsCalibration
from cflib.utils import uri_helper


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


def read_lighthouse_config(lighthouse_config_file):
    """
    Reads the lighthouse configuration file and returns the data as a dictionary.

    Returns:
        dict: A dictionary containing the lighthouse configuration data.
    """
    with open(lighthouse_config_file, "r") as file:
        lighthouse_config = yaml.safe_load(file)
    bs1geo = LighthouseBsGeometry()
    bs2geo = LighthouseBsGeometry()
    bs1calib = LighthouseBsCalibration()
    bs2calib = LighthouseBsCalibration()
    bs1geo.origin = lighthouse_config["geos"][0]["origin"]
    bs1geo.rotation_matrix = lighthouse_config["geos"][0]["rotation"]
    bs1geo.valid = True
    bs2geo.origin = lighthouse_config["geos"][1]["origin"]
    bs2geo.rotation_matrix = lighthouse_config["geos"][1]["rotation"]
    bs2geo.valid = True
    bs1calib.sweeps[0].phase = lighthouse_config["calibs"][0][
        "sweeps"
    ][0]["phase"]
    bs1calib.sweeps[0].tilt = lighthouse_config["calibs"][0][
        "sweeps"
    ][0]["tilt"]
    bs1calib.sweeps[0].curve = lighthouse_config["calibs"][0][
        "sweeps"
    ][0]["curve"]
    bs1calib.sweeps[0].gibmag = lighthouse_config["calibs"][0][
        "sweeps"
    ][0]["gibmag"]
    bs1calib.sweeps[0].gibphase = lighthouse_config["calibs"][0][
        "sweeps"
    ][0]["gibphase"]
    bs1calib.sweeps[0].ogeemag = lighthouse_config["calibs"][0][
        "sweeps"
    ][0]["ogeemag"]
    bs1calib.sweeps[0].ogeephase = lighthouse_config["calibs"][0][
        "sweeps"
    ][0]["ogeephase"]
    bs1calib.sweeps[1].phase = lighthouse_config["calibs"][0][
        "sweeps"
    ][1]["phase"]
    bs1calib.sweeps[1].tilt = lighthouse_config["calibs"][0][
        "sweeps"
    ][1]["tilt"]
    bs1calib.sweeps[1].curve = lighthouse_config["calibs"][0][
        "sweeps"
    ][1]["curve"]
    bs1calib.sweeps[1].gibmag = lighthouse_config["calibs"][0][
        "sweeps"
    ][1]["gibmag"]
    bs1calib.sweeps[1].gibphase = lighthouse_config["calibs"][0][
        "sweeps"
    ][1]["gibphase"]
    bs1calib.sweeps[1].ogeemag = lighthouse_config["calibs"][0][
        "sweeps"
    ][1]["ogeemag"]
    bs1calib.sweeps[1].ogeephase = lighthouse_config["calibs"][0][
        "sweeps"
    ][1]["ogeephase"]
    bs1calib.uid = lighthouse_config["calibs"][0]["uid"]
    bs1calib.valid = True
    bs2calib.sweeps[0].phase = lighthouse_config["calibs"][1][
        "sweeps"
    ][0]["phase"]
    bs2calib.sweeps[0].tilt = lighthouse_config["calibs"][1][
        "sweeps"
    ][0]["tilt"]
    bs2calib.sweeps[0].curve = lighthouse_config["calibs"][1][
        "sweeps"
    ][0]["curve"]
    bs2calib.sweeps[0].gibmag = lighthouse_config["calibs"][1][
        "sweeps"
    ][0]["gibmag"]
    bs2calib.sweeps[0].gibphase = lighthouse_config["calibs"][1][
        "sweeps"
    ][0]["gibphase"]
    bs2calib.sweeps[0].ogeemag = lighthouse_config["calibs"][1][
        "sweeps"
    ][0]["ogeemag"]
    bs2calib.sweeps[0].ogeephase = lighthouse_config["calibs"][1][
        "sweeps"
    ][0]["ogeephase"]
    bs2calib.sweeps[1].phase = lighthouse_config["calibs"][1][
        "sweeps"
    ][1]["phase"]
    bs2calib.sweeps[1].tilt = lighthouse_config["calibs"][1][
        "sweeps"
    ][1]["tilt"]
    bs2calib.sweeps[1].curve = lighthouse_config["calibs"][1][
        "sweeps"
    ][1]["curve"]
    bs2calib.sweeps[1].gibmag = lighthouse_config["calibs"][1][
        "sweeps"
    ][1]["gibmag"]
    bs2calib.sweeps[1].gibphase = lighthouse_config["calibs"][1][
        "sweeps"
    ][1]["gibphase"]
    bs2calib.sweeps[1].ogeemag = lighthouse_config["calibs"][1][
        "sweeps"
    ][1]["ogeemag"]
    bs2calib.sweeps[1].ogeephase = lighthouse_config["calibs"][1][
        "sweeps"
    ][1]["ogeephase"]
    bs2calib.uid = lighthouse_config["calibs"][1]["uid"]
    bs2calib.valid = True
    geo_dict = {0: bs1geo, 1: bs2geo}
    calib_dict = {0: bs1calib, 1: bs2calib}
    return geo_dict, calib_dict


class LighthousePoseReader():
    """
    Ros2 node that reads the pose of lighthouses, and formats origin and rotation matrices as
    LighthouseBsGeometry objects. Related classes include the LighthouseConfigManager,
    and the CrazyfliePublisher.

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
        # Declare members
        self.lh_frames = {}
        self.lh_poses = {}
        # FUTURE_DEV: Refactor to take dynamic number of lighthouse frames
        self.tf_buffers = {0: Buffer(), 1: Buffer()}
        self.lh_listeners = {}

        # Check validity of input
        self.check_lh_frame_validity(lh_tf2_frames)

        # Initialize frames and poses
        self.init_frames_buffers_and_poses(lh_tf2_frames)
        self.has_geo_data = False

    def check_lh_frame_validity(self, lh_tf2_frames):
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

    def init_frames_buffers_and_poses(self, lh_tf2_frames):
        """
        Populates the local arrays `lh_frames` and `lh_poses` with the given `lh_tf2_frames` values.
        Calls the `check_lh_frame_validity` method to check the validity of the input list. Also

        of tf2 frames.

        Args:
            lh_tf2_frames (list): A list of tf2 frames.

        Returns:
            None
        """
        for i, frame in enumerate(lh_tf2_frames):
            self.lh_frames[i] = frame
            self.lh_poses[i] = Pose(
                position=Point(x=0.0, y=0.0, z=0.0),
                orientation=Quaternion(x=0.0, y=0.0, z=0.0, w=1.0),
            )

        self.lh0_pose_listener = TransformListener(self.tf_buffers[0], self)
        self.lh1_pose_listener = TransformListener(self.tf_buffers[1], self)

    def check_pose_input_validity(self, input_pose):
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

    # def set_pose(self, input_pose: dict[int, Pose]):
    #     """
    #     Sets the pose for each base station. Not used in initialization process, but set as a
    #     helper
    #     method for the LighthouseConfigManager.

    #     Args:
    #         input_pose (dict[int, Pose]): A dictionary mapping base station IDs to Pose objects.

    #     Returns:
    #         None
    #     """
    #     self.check_pose_input_validity(input_pose)
    #     for bs, pose in input_pose.items():
    #         self.lh_poses[bs] = pose

    def get_lh_geo_data(self):
        """
        Returns the configuration of the Lighthouse base stations.

        Returns:
            dict: A dictionary containing the configuration of each base station.
                The keys are the base station IDs and the values are instances of
                LighthouseBsGeometry.
        
        TODO: Needs testing
        """
        lh_geo = {}
        for bs, pose in self.lh_poses.items():
            bs_geo = LighthouseBsGeometry()
            bs_geo.origin = [pose.position.x, pose.position.y, pose.position.z]
            temp_rot_matrix = tf_transformations.quaternion_matrix(
                [
                    pose.orientation.x,
                    pose.orientation.y,
                    pose.orientation.z,
                    pose.orientation.w,
                ]
            )
            bs_geo.rotation_matrix = temp_rot_matrix[:3, :3]
            bs_geo.valid = True
            lh_geo[bs] = bs_geo
        return lh_geo


class LighthouseConfigManager:
    """
    Class that writes lighthouse configurations to crazyflie memory. This was created instead of
    using the Bitcraze WriteMem class as it does not require a synchronous crazyflie instance. The
    class can be used to write lighthouse geometries and calibrations to memory, as well as read
    them from memory.
    """

    def __init__(
        self,
        sync_crayzflie_instance: Crazyflie,
        uri: str,
        geos: dict[int, LighthouseBsGeometry],
        calibs: dict[int, LighthouseBsCalibration],
    ):
        self._event = Event()
        self.scf = sync_crayzflie_instance
        uri = uri_helper.uri_from_env(default=uri)
        self.helper = LighthouseMemHelper(self.scf.cf)
        self.calibs = calibs
        self._initial_geos = geos
        self.calib_dict = calibs
        self.geo_dict = geos

        self.read_mem()

    def read_mem(self):
        """
        Reads memory from lighthouse configuration memory.

        Has threading waits to ensure that the data is read before proceeding.
        """
        print("------ Reading lighthouse config memory ------")
        self.helper.read_all_geos(self._geo_read_ready)
        self._event.wait()

        self._event.clear()

        self.helper.read_all_calibs(self._calib_read_ready)
        self._event.wait()

    def _geo_read_ready(self, geo_data):
        for id, data in geo_data.items():
            print("---- Geometry for base station", id + 1)
            data.dump()
            print()
        self._event.set()

    def _calib_read_ready(self, calib_data):
        for id, data in calib_data.items():
            print("---- Calibration data for base station", id + 1)
            data.dump()
            print()
        self._event.set()

    def write_mem(self):
        """
        Writes the lighthouse configuration memory.

        This method writes the geos and calibs dictionaries to the lighthouse configuration
        memory. It waits for the write operation to complete before proceeding.

        Parameters:
            None

        Returns:
            None
        """
        print("------ Writing lighthouse config memory ------")
        self.helper.write_geos(self.geo_dict, self._data_written)
        self._event.wait()

        self._event.clear()

        self.helper.write_calibs(self.calib_dict, self._data_written)
        self._event.wait()

    def _data_written(self, success):
        if success:
            print("Data written")
        else:
            print("Write failed")

        self._event.set()



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
        - _init_lh_config_manager(): Initializes the lighthouse configuration manager.
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
        self.declare_parameter("URI", rclpy.Parameter.Type.STRING)
        self.declare_parameter(
            "fly",
            rclpy.Parameter.Type.BOOL,
            ParameterDescriptor(
                description="Determines if the crazyflie is in testing mode"
            ),
        )
        # FUTURE_DEV: Refactor to take dynamic number of turtlebots
        self.declare_parameter(
            name="lh0_pose_frame", value="tb1/lighthouse_pose"
        )  # value will only be used if parameter not set
        self.declare_parameter(
            name="lh1_pose_frame", value="tb2/lighthouse_pose"
        )  # value will only be used if parameter not set
        self.declare_parameter(name="initial_translation", value=[0.0, 0.0, 0.0])
        self.declare_parameter(
            name="initial_orientation_quaternion", value=[0.0, 0.0, 0.0, 1.0]
        )
        self.declare_parameter(
            name="lighthouse_config_file",
            descriptor = ParameterDescriptor(
                description = "Path to the lighthouse configuration file"
            ),
        )
        try:
            self._fly = self.get_parameter("fly").value
            self.get_logger().info("Got fly parameter")
            self._link_uri = self.get_parameter("URI").value
            self.get_logger().info("Got URI parameter")
            self.lh1_ros2_pose_frame = self.get_parameter("lh0_pose_frame").value
            self.get_logger().info("Got lh0_pose_frame parameter")
            self.lh2_ros2_pose_frame = self.get_parameter("lh1_pose_frame").value
            self.get_logger().info("Got lh1_pose_frame parameter")
            self._initial_translation = self.get_parameter("initial_translation").value
            self.get_logger().info("Got initial_translation parameter")
            self._initial_orientation_quaternion = self.get_parameter(
                "initial_orientation_quaternion"
            ).value
            self._lighthouse_config_file = self.get_parameter("lighthouse_config_file").value
            self.get_logger().info("Got initial_orientation_quaternion parameter")
            print("Parameters loaded correctly :)")
        except Exception as e:
            self.get_logger().fatal(f"Error getting paramater value: {e}")
            # print("Error getting paramater value: ", e)
            # """
            if VS_CODE_DEBUGGING:
                # Here for debugging purposes
                print("Handled error for debugging")
                self._fly = False
                self._link_uri = 'radio://0/80/2M/E7E7E7E7E7'
                self.lh1_ros2_pose_frame = "tb1/lighthouse_pose"
                self.lh2_ros2_pose_frame = "tb2/lighthouse_pose"
                self._initial_translation = [0.0, 0.0, 0.0]
                self._initial_orientation_quaternion = [0.0, 0.0, 0.0, 1.0]
                self._lighthouse_config_file = lighthouse_config_file_for_debugging
                print("Got parameters from debugging stuff")
                # """

        # ! Class Members
        # Initialize publishers and tf2 broadcasters
        self.range_publisher = self.create_publisher(Range, "/zrange", 10)
        self.laser_publisher = self.create_publisher(LaserScan, "/scan", 10)
        self.odom_publisher = self.create_publisher(Odometry, "/odom", 10)
        self.tfbr = TransformBroadcaster(self)
        self.create_subscription(Twist, "/cmd_vel", self.cmd_vel_callback, 1)


        # Start setting up the pose reading for each lighthouse
        self.lh_tf2_frames = {0: self.lh1_ros2_pose_frame, 1: self.lh2_ros2_pose_frame}
        self.lh_poses = {}
        self.tf_buffers = {0: Buffer(), 1: Buffer()}
        self.lh_listeners = {}
        self.target_twist = {}
        self.lh_config_manager = None

        # ! Crazyflie instantiation
        self.ranges = [0.0, 0.0, 0.0, 0.0, 0.0]
        self._read_config_data = False
        self._robot_config = None
        self.lh_config_initialized = False
        self._cf = Crazyflie(rw_cache='./cache')
        self._cf.connected.add_callback(self._connected)
        self._cf.disconnected.add_callback(self._disconnected)
        self._cf.connection_failed.add_callback(self._connection_failed)
        self._cf.connection_lost.add_callback(self._connection_lost)

        # ! Crazyflie connection, inits, and timers
        self._cf.open_link(self._link_uri)
        self._scf = SyncCrazyflie(self._link_uri, cf=self._cf) #Needed for LighthouseConfigManager
        self._set_initial_position()
        self.create_timer(1.0 / 30.0, self._publish_laserscan_data)

        #FIXME: Lighthouse stuff that should be double checked and fixed
        # Read in lighthouse geometries and calibrations from file
        self._init_lh_config_manager()
        self._timer_lh_pose_update = self.create_timer(
            2.5, self._on_timer_lh_pose_callback
        )

        # Send flight commands if in flight mode
        # ! Flight loop
        if self._fly == True:
            timer_period = 0.1  # seconds
            self.create_timer(timer_period, self.send_crazyflie_hover_setpoint_commands)
            self.hover = {'x': 0.0, 'y': 0.0, 'z': 0.0, 'yaw': 0.0, 'height': 0.3}
            self._cf.commander.send_hover_setpoint(
                self.hover['x'],
                self.hover['y'],
                self.hover['yaw'],
                self.hover['height'],
            )
        self._cf.param.request_update_of_all_params()

    def _connected(self, link_uri):
        """
        Callback for initial connection with the crazyflie. Sets the loggging configurations,
        logging callbacks, the TOC, and starts loggers if successful.
        """
        self._lg_stab = LogConfig(name="Stabilizer", period_in_ms=100)
        self._lg_stab.add_variable("stateEstimate.x", "float")
        self._lg_stab.add_variable("stateEstimate.y", "float")
        self._lg_stab.add_variable("stateEstimate.z", "float")
        self._lg_stab.add_variable("stabilizer.roll", "float")
        self._lg_stab.add_variable("stabilizer.pitch", "float")
        self._lg_stab.add_variable("stabilizer.yaw", "float")

        self._lg_range = LogConfig(name="Range", period_in_ms=100)
        self._lg_range.add_variable("range.zrange", "uint16_t")
        self._lg_range.add_variable("range.front", "uint16_t")
        self._lg_range.add_variable("range.right", "uint16_t")
        self._lg_range.add_variable("range.left", "uint16_t")
        self._lg_range.add_variable("range.back", "uint16_t")

        self._lh_pose = LogConfig(name="Lighthouse", period_in_ms=100)
        self._lh_pose.add_variable("lighthouse.x", "float")
        self._lh_pose.add_variable("lighthouse.y", "float")
        self._lh_pose.add_variable("lighthouse.z", "float")

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
            self.get_logger.fatal(
                "Could not start log configuration," "{} not found in TOC".format(
                    str(e)
                )
            )
        except AttributeError:
            self.get_logger.fatal(
                "Could not add Stabilizer log config, bad configuration."
            )

        # except Exception as e:
        # self.get_logger().fatal(f"Error reading lighthouse geometries from config file: {e}")

    def send_crazyflie_hover_setpoint_commands(self):
        """
        The internal function that updates hovering/flying setpoints and commands to the Crazyflie
        based on the target twist.
        """

        hover_height = self.hover["height"] + self.hover["z"] * 0.1
        self._cf.commander.send_hover_setpoint(
            self.hover["x"], self.hover["y"], self.hover["yaw"], hover_height
        )
        self.hover["height"] = hover_height

    def cmd_vel_callback(self, twist: Twist):
        """
        Callback function for receiving cmd_vel messages.

        This function is called whenever a new cmd_vel message is received.
        It updates the target twist and hover values based on the received twist message.

        :param twist: The Twist message containing the linear and angular velocities.
        :type twist: Twist
        """
        self.target_twist = twist

        self.hover["x"] = twist.linear.x
        self.hover["y"] = twist.linear.y
        self.hover["z"] = twist.linear.z
        self.hover["yaw"] = -1 * math.degrees(twist.angular.z)

    def _publish_laserscan_data(self):
        """
        Publishes laserscan data from Crazyflie to Ros2. Called at a fixed rate.
        """
        try:
            msg = LaserScan()
            msg.header.stamp = self.get_clock().now().to_msg()
            msg.header.frame_id = "base_link"
            msg.range_min = 0.01
            msg.range_max = 3.49
            msg.ranges = self.ranges
            msg.angle_min = 0.5 * 2 * pi
            msg.angle_max = -0.5 * 2 * pi
            msg.angle_increment = -1.0 * pi / 2
            self.laser_publisher.publish(msg)
        except Exception as e:
            self.get_logger().warning(
                f"Error in laser scan data, not published to tf2: {e}"
            )

    def _range_log_error(self, logconf, msg):
        """Callback from the log API when an error occurs"""
        print("Error when logging %s: %s" % (logconf.name, msg))
        self.get_logger().debug("Error when logging %s: %s" % (logconf.name, msg))

    def _range_log_data(self, timestamp, data, logconf):
        """Callback from a the log API when data arrives"""
        print(data)

        try:
            t_range = TransformStamped()
            q = tf_transformations.quaternion_from_euler(0, radians(90), 0)
            t_range.header.stamp = self.get_clock().now().to_msg()
            t_range.header.frame_id = "base_link"
            t_range.child_frame_id = "crazyflie_flowdeck"
            t_range.transform.rotation.x = q[0]
            t_range.transform.rotation.y = q[1]
            t_range.transform.rotation.z = q[2]
            t_range.transform.rotation.w = q[3]
            self.tfbr.sendTransform(t_range)
        except Exception as e:
            self.get_logger().warning(
                f"Error in range transform, not published to tf2: {e}"
            )

        zrange = float(data.get("range.zrange")) / 1000.0
        msg = Range()
        msg.header.stamp = self.get_clock().now().to_msg()
        msg.header.frame_id = "crazyflie_flowdeck"
        msg.field_of_view = radians(4.7)
        # msg.radiation_type = Range().INFRARED #FIXME: This is not defined in the Range message
        msg.min_range = 0.01
        msg.max_range = 3.5
        msg.range = zrange
        ##self.range_publisher.publish(msg)

        max_range = 3.49
        front_range = float(data.get("range.front")) / 1000.0
        left_range = float(data.get("range.left")) / 1000.0
        back_range = float(data.get("range.back")) / 1000.0
        right_range = float(data.get("range.right")) / 1000.0
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
        print("Error when logging %s: %s" % (logconf.name, msg))

    def _stab_log_data(self, timestamp, data, logconf):
        """Callback from a the log API when data arrives"""

        # for name, value in data.items():
        #     print(f'{name}: {value:3.3f} ', end='')
        # print()
        print("stab_data", data)

        # Get odometry values from crazyflie stability logger
        try:
            x = data.get("stateEstimate.x")
            y = data.get("stateEstimate.y")
            z = data.get("stateEstimate.z")
            roll = radians(data.get("stabilizer.roll"))
            pitch = radians(-1.0 * data.get("stabilizer.pitch"))
            yaw = radians(data.get("stabilizer.yaw"))

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
            t_base.header.frame_id = "odom"
            t_base.child_frame_id = "base_footprint"
            t_base.transform.translation.x = x
            t_base.transform.translation.y = y
            t_base.transform.translation.z = 0.0
            t_base.transform.rotation.x = q_base[0]
            t_base.transform.rotation.y = q_base[1]
            t_base.transform.rotation.z = q_base[2]
            t_base.transform.rotation.w = q_base[3]
            self.tfbr.sendTransform(t_base)
        except Exception as e:
            self.get_logger().warning(
                f"Error in publishing base_footprint transform: {e}"
            )

        # Publish t_cf to tf2
        try:
            # Create t_cf message, assigned values from the crazyflie stability logger
            t_cf = TransformStamped()
            q_cf = tf_transformations.quaternion_from_euler(roll, pitch, 0)
            t_cf.header.stamp = self.get_clock().now().to_msg()
            t_cf.header.frame_id = "base_footprint"
            t_cf.child_frame_id = "base_link"
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
        print("Error when logging %s: %s" % (logconf.name, msg))

    def _lh_log_data(self, timestamp, data, logconf):
        """Callback from a the log API when LH data arrives"""
        # print to console

        try:
            print(data)

            # Send to tf2
            t_lh = TransformStamped()
            t_lh.header.frame_id = "base_link"
            t_lh.child_frame_id = "lighthouse"

            x = data.get("lighthouse.x")
            y = data.get("lighthouse.y")
            z = data.get("lighthouse.z")
            q = tf_transformations.quaternion_from_euler(0, 0, 0)
            t_lh.header.stamp = self.get_clock().now().to_msg()
            t_lh.child_frame_id = "lighthouse_link"
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
            self.get_logger().warning(
                "May need to recalibrate kalman filter values for lighthouse"
            )
            print("Error in LH log data, not published to tf2")

    def _init_lh_config_manager(self):
        """
        Initializes the LighthouseConfigWriter class with the necessary data. Reads from
        self.lh_pose_data

        Members:
        - self.lh_config_writer

        TODO: Start here for work
            1. Create LH config manager
            2. Read memory to see if there is a configuration values on cf
            3. If there is, save those as the configs
            4. Set initialization flag to true
            5. Read/handle lighthouse poses (could be done with the _on_tier_lh_pose_callback)
        """

        for _, frame in self.lh_tf2_frames.items():
            if not isinstance(frame, str):
                raise ValueError("lh_tf2_frames must be a list of strings")
        if self.lh_tf2_frames[0] == self.lh_tf2_frames[1]:
            raise ValueError("lh_tf2_frames must contain unique strings")

        geo_dict, calib_dict = read_lighthouse_config(self._lighthouse_config_file)
        self.lh_config_manager = LighthouseConfigManager(
            self._scf,
            self._link_uri,
            geo_dict,
            calib_dict
        )
        self.lh_config_initialized = True

    def _on_timer_lh_pose_callback(self):
        # FIXME: Not implemented, or tested
        transforms = []
        try:
            i = 0
            for _, buffer in self.tf_buffers.items():
                global_frame = "map"
                des_frame = self.lh_tf2_frames.lh_frames[i]
                now = rclpy.time.Time()
                trans = buffer.lookup_transform(des_frame, global_frame, now)
                transforms.append(trans)
        except Exception as ex:
            self.get_logger().warning(
                f"Could not transform {des_frame} to {global_frame}: {ex}"
            )
            # TODO: Run this with the following being published:
            """
            ros2 run tf2_ros static_transform_publisher --x x --y y --z z --yaw yaw --pitch pitch --roll roll --frame-id frame_id --child-frame-id child_frame_id
            """
            return

        # Update lighthouse data with new pose
        for i in range(len(transforms)):
            self.lh_pose_reader.lh_poses[i].position = Point(
                x=transforms[i].transform.translation.x,
                y=transforms[i].transform.translation.y,
                z=transforms[i].transform.translation.z,
            )
            self.lh_pose_reader.lh_poses[i].orientation = Quaternion(
                x=transforms[i].transform.rotation.x,
                y=transforms[i].transform.rotation.y,
                z=transforms[i].transform.rotation.z,
                w=transforms[i].transform.rotation.w,
            )

        print(f"lh_pose_data: {self.lh_pose_reader.lh_poses}")
        # Update lighthouse data in memory
        lh_config = self.lh_pose_reader.get_lh_geo_data()
        self.lh_config_manager.write_lh_geos_to_memory(lh_config)
        self.lh_config_manager.read_lh_geos_from_memory()

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
        self.get_logger().info("Resetting cf position estimator")
        self._cf.param.set_value("kalman.initialX", self._initial_translation[0])
        self._cf.param.set_value("kalman.initialY", self._initial_translation[1])
        self._cf.param.set_value("kalman.initialZ", self._initial_translation[2])
        # self._reset_position_estimator()
        time.sleep(0.1)

    def _reset_position_estimator(self):
        self._cf.param.set_value("kalman.resetEstimation", "1")
        time.sleep(0.1)
        self._cf.param.set_value("kalman.resetEstimation", "0")

    def _disconnected():
        """
        Callback to print that the crazyflie has been disconnected."""
        print("disconnected")

    def _connection_failed(self, link_uri, msg):
        print("connection_failed")

    def _connection_lost(self, link_uri, msg):
        print("connection_lost")


def main(args=None):
    cflib.crtp.init_drivers()
    rclpy.init(args=args)
    crazyflie_publisher = CrazyfliePublisher()
    rclpy.spin(crazyflie_publisher)
    crazyflie_publisher.destroy_node()
    rclpy.shutdown




# For debugging as a normal python file
"""
def main():
    ls = launch.LaunchService()
    ld = generate_launch_description()
    ls.include_launch_description(ld)
    return ls.run()

"""

if __name__ == '__main__':
    # Set debugging variables to true if working in vscode rather than Ros2
    VS_CODE_DEBUGGING = True
    lighthouse_config_file_for_debugging = os.path.abspath(os.path.join(
        os.path.dirname(__file__), "..", "config", "lighthouse_config.yaml"
    ))
    main()
