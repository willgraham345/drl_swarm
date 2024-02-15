from threading import Event
import yaml
import rclpy
from rclpy.node import Node
from rcl_interfaces.msg import ParameterDescriptor

from std_msgs.msg import String
from geometry_msgs.msg import Pose
import tf_transformations
from tf2_ros import TransformBroadcaster
from geometry_msgs.msg import TransformStamped
from sensor_msgs.msg import Range
from sensor_msgs.msg import LaserScan
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist

import cflib.crtp  # noqa
from cflib.crazyflie import Crazyflie
from cflib.crazyflie.log import LogConfig
from cflib.utils import uri_helper
from cflib.crazyflie.mem import LighthouseMemHelper
from cflib.crazyflie.mem import LighthouseBsGeometry
from cflib.crazyflie.syncCrazyflie import SyncCrazyflie
from cflib.positioning.motion_commander import MotionCommander
from cflib.localization.lighthouse_types import LhCfPoseSample

import math

from math import pi

URI = uri_helper.uri_from_env(default='radio://0/80/2M/E7E7E7E7E7')
def radians(degrees):  
    return degrees * math.pi / 180.0

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


class CrazyfliePublisher(Node):
    """
    This class is a ROS2 node that publishes the position of the Crazyflie
    :param link_uri: The URI of the Crazyflie to connect to
    :type link_uri: str
    """

    def __init__(self):

        # Initialize the Node with the name "crazyflie_publisher"
        super().__init__("crazyflie_publisher") 
        self.get_logger().debug("Initializing CrazyfliePublisher")

        # Declare and get parameters
        self.declare_parameter('URI', rclpy.Parameter.Type.STRING)
        self.declare_parameter('fly', rclpy.Parameter.Type.BOOL,
            ParameterDescriptor(
                description = "Determines if the crazyflie is in testing mode")
        )
        self.declare_parameter('config_file', rclpy.Parameter.Type.STRING)
        self.lh_config = {}
        self.lh_rotation_matrix = ROTATION_MATRIX_NEG_90_PITCH
        try: 
            
            fly = self.get_parameter('fly').value
            self.get_logger().info("Got fly parameter")
            link_uri = self.get_parameter('URI').value
            self.get_logger().info("Got URI parameter")
            config_file = self.get_parameter('config_file').value
            self._config_file = config_file
            self.get_logger().info("Got config_file parameter")
        except Exception as e:
            self.get_logger().fatal(f"Error getting paramater value: {e}")


        # Initialize publishers and tf2 broadcasters
        self.range_publisher = self.create_publisher(Range, "/zrange", 10)
        self.laser_publisher = self.create_publisher(LaserScan, "/scan", 10)
        self.odom_publisher = self.create_publisher(Odometry,  "/odom", 10)
        self.tfbr = TransformBroadcaster(self)
    
        # Initialize subscribers
        self.create_subscription(Twist,  "/cmd_vel", self.cmd_vel_callback, 1)
        #TODO: Implement subscription to lighthouse node for up-to-date pose data



        # Handle crazyflie connection
        self._cf = Crazyflie(rw_cache='./cache')
        self._cf.connected.add_callback(self._connected)
        self._cf.disconnected.add_callback(self._disconnected)
        self._cf.connection_failed.add_callback(self._connection_failed)
        self._cf.connection_lost.add_callback(self._connection_lost)
        # Aded for lighthouse config
        self.lh_helper = None
        self._cf.open_link(link_uri)
        self._cf_event = Event()

        # Double check that crazyflie is connected
        if self._cf.is_connected() is None:
            self.get_logger().fatal("Crazyflie unable to connect")
            return


        # Initialize ranges and timer for the laser scan
        self.ranges= [0.0, 0.0, 0.0, 0.0, 0.0]
        self.create_timer(1.0/30.0, self.publish_laserscan_data)


        self._read_lh_geos_from_config()
        # Send flight commands if in flight mode
        if fly == True:
            timer_period = 0.1  # seconds
            self.create_timer(timer_period, self.sendHoverCommand)


            self.hover = {'x': 0.0, 'y': 0.0, 'z': 0.0, 'yaw': 0.0, 'height': 0.3}


            self._cf.commander.send_hover_setpoint(
                self.hover['x'], self.hover['y'], self.hover['yaw'],
                self.hover['height'])

    def _connected(self, link_uri):
        try:
            self.get_logger().info('Connected to cf!')
        except Exception as e:
            self.get_logger().fatal(f"Error connecting to cf: {e}")
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



    def sendHoverCommand(self):
        hover_height =  self.hover['height'] + self.hover['z']*0.1
        self._cf.commander.send_hover_setpoint(
            self.hover['x'], self.hover['y'], self.hover['yaw'],
            hover_height)
        self.hover['height'] = hover_height

    def cmd_vel_callback(self, twist):
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
        except:
            self.get_logger().warning("Error in laser scan data, not published to tf2")


    def _range_log_error(self, logconf, msg):
        """Callback from the log API when an error occurs"""
        print('Error when logging %s: %s' % (logconf.name, msg))
        self.get_logger().debug('Error when logging %s: %s' % (logconf.name, msg))

    def _range_log_data(self, timestamp, data, logconf):
        """Callback from a the log API when data arrives"""
        for name, value in data.items():
            print(f'{name}: {value:3.3f} ', end='')
        print()

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
        except:
            self.get_logger().warning("Error in range transform, not published to tf2")

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

        """for name, value in data.items():
            print(f'{name}: {value:3.3f} ', end='')
        print()"""

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

        t_odom = TransformStamped()
        t_odom.header.stamp = self.get_clock().now().to_msg()
        t_odom.header.frame_id = 'odom'
        t_odom.child_frame_id = 'base_footprint'
        q_odom = tf_transformations.quaternion_from_euler(0, 0, 0)
        t_odom.transform.translation.x = 0.0
        t_odom.transform.translation.y = 0.0
        t_odom.transform.translation.z = 0.1 # TODO: Figure out why this is off
        t_odom.transform.rotation.x = q_odom[0]
        t_odom.transform.rotation.y = q_odom[1]
        t_odom.transform.rotation.z = q_odom[2]
        t_odom.transform.rotation.w = q_odom[3]
    
        #self.tfbr.sendTransform(t_odom)

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
            for name, value in data.items():
                print(f'{name}: {value:3.3f} ', end='')
            print()

            # Send to tf2
            # TODO: Make sure this is working correctly
            t_lh = TransformStamped()
            q = tf_transformations.quaternion_from_euler(0, radians(90), 0)
            t_lh.header.stamp = self.get_clock().now().to_msg()
            t_lh.header.frame_id = 'base_link'
            t_lh.child_frame_id = 'lighthouse'
            self.tfbr.sendTransform(t_lh)

            x = data.get('lighthouse.x')
            y = data.get('lighthouse.y')
            z = data.get('lighthouse.z')
            q = tf_transformations.quaternion_from_euler(0, 0, 0)
            t_lh = TransformStamped()
            t_lh.header.stamp = self.get_clock().now().to_msg()
            t_lh.header.frame_id = 'lighthouse'
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
            self.get_logger().debug("Error in LH log data, not published to tf2")
    
    def _read_lh_geos_from_config(self):
        """
        Read lighthouse geometries from the given configuration parameter file and call lighthouse_config_writer.
        """
        self.get_logger().debug('Reading lighthouse geometries from config file')
        geos = {}
        basestation_number = 0
        with open(self._config_file, 'r') as file:
            config = yaml.safe_load(file)
            for tb in config['robots']['turtlebots']:
                geos[basestation_number] = tb['translation']
                self.get_logger().debug(f"tb['translation']: {tb['translation']}, type {type(tb['translation'])}")
                basestation_number += 1
        self.get_logger().debug(f"geos: {geos}, type: {type(geos)}")
        self.dict_to_lh_config(geos, self.lh_rotation_matrix, True)

    def dict_to_lh_config(self, geos: dict, rotation_matrix: list[list[float]], write_to_mem: bool = True):
        lh_config = {}
        for bs, origin in geos.items():
            bs_geo = LighthouseBsGeometry()
            bs_geo.origin = origin
            bs_geo.rotation_matrix = rotation_matrix
            self.get_logger().info(f"geo for bs {bs} origin: {bs_geo.origin} rotation matrix: {bs_geo.rotation_matrix}")
            self.get_logger().info(str(type(rotation_matrix)))
            bs_geo.valid = True
            self.lh_config[bs] = bs_geo
        if write_to_mem == True:
            self.get_logger().debug("Writing lighthouse config to memory")
            self._lighthouse_config_writer() 
        else:
            return lh_config
    
    def _lighthouse_config_writer(self):
        try:
            self.get_logger().debug("Writing lighthouse config to memory")
            self.get_logger().debug(f'Crazyflie type: {type(self._cf)}')
            lh_helper = LighthouseMemHelper(self._cf)
            self.get_logger().debug(f'Lighthouse helper type: {type(self.lh_helper)}')
            lh_helper.write_geos(self.lh_config, self._data_written)
            self.get_logger().debug("Lighthouse config written to memory")
            # self._cf_event.wait()
            # self._cf_event.clear()
        except Exception as e:
            self.get_logger().error(f"Error writing lighthouse config to memory: {e}")

    def _data_written(self, success):
        if success:
            print('Lighthouse data correctly written to crazyflie')
            self.get_logger().info('Lighthouse data correctly written to crazyflie')
        else:
            self.get_logger().error('Writing crazyflie lighthouse data failed')
            print('Write failed')

        self._cf_event.set()

    def _disconnected():
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
    rclpy.shutdown()
    



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