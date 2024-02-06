import rclpy
from math import cos, sin, pi, atan2
from geometry_msgs.msg import Twist
from geometry_msgs.msg import TransformStamped
from sensor_msgs.msg import LaserScan
from nav_msgs.msg import Odometry
from tf2_ros import TransformBroadcaster

HALF_DISTANCE_BETWEEN_WHEELS = 0.045
WHEEL_RADIUS = 0.025
# USE THIS!!!!
# https://cyberbotics.com/doc/reference/lidar?tab-language=python
class MyTurtlebotDriver():
    """
    This class is a driver for the Turtlebot3 robot.
    :param webots_node: the instance of the WebotsNode class
    :type webots_node: WebotsNode
    :param properties: the properties of the robot
    :type properties: dict
    :return: the instance of the MyTurtlebotDriver class
    :rtype: MyTurtlebotDriver
    """
    def init(self, webots_node, properties):
        self.__robot = webots_node.robot
        self.timestep = int(self.__robot.getBasicTimeStep())
        self._robot_name = self.__robot.getName()
        self.__left_motor = self.__robot.getDevice('left wheel motor')
        self.__right_motor = self.__robot.getDevice('right wheel motor')
        # self.__gps = self.__robot.getGPS('gps')
        # self.__gps.enable(self.timestep)
        #self.__ort = self.__robot.getQuaternion()
        # self.__gps.enable(self.timestep)
        self.__imu = self.__robot.getDevice('accelerometer')
        self.__imu .enable(self.timestep)
        # self.__gyro = self.__robot.getDevice('gyro')
        # self.__gyro.enable(self.timestep)
        self.__compass = self.__robot.getDevice('compass')
        self.__compass.enable(self.timestep)

        self.lidar = self.__robot.getDevice("LDS-01")
        self.lidar.enable(self.timestep)

        self.__left_motor.setPosition(float('inf'))
        self.__left_motor.setVelocity(0)

        self.__right_motor.setPosition(float('inf'))
        self.__right_motor.setVelocity(0)

        self.__target_twist = Twist()


        # Initialize ROS2 nodes and log to debug console
        rclpy.init(args=None)
        self.__namespace = str(self._robot_name)
        self.tb_driver = rclpy.create_node(
            node_name = 'my_turtlebot_driver',
            namespace=self.__namespace,
            allow_undeclared_parameters=True,
            automatically_declare_parameters_from_overrides=True)
        self.tb_driver.get_logger().debug(f'Turtlebot driver node created for {self.__namespace}')
        self.tb_driver.create_subscription(
            msg_type = Twist,
            topic = '/{}/cmd_vel'.format(self.__namespace),
            callback=self.__cmd_vel_callback,
            qos_profile = 1)
        self.tb_driver.get_logger().debug(f'Turtlebot driver subscribed to /{self.__namespace}/cmd_vel')
        self.laser_publisher = self.tb_driver.create_publisher(
            msg_type = LaserScan,
            topic = '/{}/scan'.format(self.__namespace), 
            qos_profile = 10)
        self.tb_driver.get_logger().debug(f'Turtlebot driver created /{self.__namespace}/scan publisher')
        self.odom_publisher = self.tb_driver.create_publisher(
            msg_type = Odometry,
            topic = '/{}/odom'.format(self.__namespace),
            qos_profile = 10)
        self.tb_driver.get_logger().debug(f'Turtlebot driver created /{self.__namespace}/odom publisher')
        self.tfbr = TransformBroadcaster(
            node = self.tb_driver)
        self.tb_driver.get_logger().debug(f'Turtlebot driver created TransformBroadcaster')



    def __cmd_vel_callback(self, twist):
        self.__target_twist = twist


    def publish_lidar(self):
        """
        """
        #FIXME: Fix this
        # Webots API on using the Lidar functions
        # https://cyberbotics.com/doc/reference/lidar?tab-language=python

        # ranges = self.lidar.getLayerRangeImage(0)
        # msg = LaserScan()
        # msg.header.stamp = self.tb_driver.get_clock().now().to_msg()
        # msg.header.frame_id = '{}/base_link'.format(self.__namespace)
        # msg.angle_min = -self.lidar.getFov()/2
        # msg.angle_max = self.lidar.getFov()/2
        # msg.angle_increment = 2*pi / (self.lidar.getHorizontalResolution() - 1)
        # msg.range_min = self.lidar.getMinRange() 
        # msg.range_max = self.lidar.getMaxRange()
        # msg.ranges = ranges
        # self.laser_publisher.publish(msg)
        pass

    def _publish_gps(self, gps_vals,heading):
        # Get position and orientation from the robot
        # position = self.__robot.getPosition()
        # orientation = self.__robot.getOrientation()
        # Create and publish the Odometry message
        odom = Odometry()
        odom.header.stamp = self.tb_driver.get_clock().now().to_msg()
        odom.header.frame_id = '/odom'
        odom.child_frame_id = '{}/base_link'.format(self.__namespace)
        odom.pose.pose.position.x = gps_vals[0]
        odom.pose.pose.position.y = gps_vals[1]
        odom.pose.pose.position.z = gps_vals[2]

        #quaternion = tf2_ros.transformations.quaternion_from_euler(0.0, 0.0, yaw)
        yaw = -atan2(heading[1],heading[0])+pi/2
        #if self.__namespace =="tb1":
            #print(self.__compass.getValues())
            #print(yaw*180/pi)
        odom.pose.pose.orientation.z = sin(yaw / 2.0)
        odom.pose.pose.orientation.w = cos(yaw / 2.0)
        # odom.pose.pose.orientation.x = orientation[0]
        # odom.pose.pose.orientation.y = orientation[1]
        # odom.pose.pose.orientation.z = orientation[2]
        # odom.pose.pose.orientation.w = orientation[3]
        self.odom_publisher.publish(odom)

        # Create a transform message
        transform = TransformStamped()
        transform.header.stamp = self.tb_driver.get_clock().now().to_msg()
        transform.header.frame_id = 'odom'
        transform.child_frame_id = '{}/base_link'.format(self.__namespace)
        transform.transform.translation.x = gps_vals[0]
        transform.transform.translation.y = gps_vals[1]
        transform.transform.translation.z = gps_vals[2]
        transform.transform.rotation.x = 0.0
        transform.transform.rotation.y = 0.0
        transform.transform.rotation.z = sin(yaw / 2.0)
        transform.transform.rotation.w = cos(yaw / 2.0)

        # Publish the transform message
        #self.tf_publisher.publish(transform)
        self.tfbr.sendTransform(transform)

    def step(self):
        rclpy.spin_once(self.tb_driver, timeout_sec=0)
        try: 
            self.__robot.step(self.timestep)
        except Exception as e:
            print(e)
            print("Error in step")

        forward_speed = self.__target_twist.linear.x
        angular_speed = self.__target_twist.angular.z

        command_motor_left = (forward_speed - angular_speed * HALF_DISTANCE_BETWEEN_WHEELS) / WHEEL_RADIUS
        command_motor_right = (forward_speed + angular_speed * HALF_DISTANCE_BETWEEN_WHEELS) / WHEEL_RADIUS

        self.__left_motor.setVelocity(command_motor_left)
        self.__right_motor.setVelocity(command_motor_right)
        #FIXME: GPS node isn't connected
        # self._publish_gps(self.__gps.getValues(),self.__compass.getValues())#,self.__ort)
        
        
        # print(gps_values)
        # wasn't working, so I comented this out.
        self.publish_lidar()
        # self.__publish_odom()


    # def pose_callback(self, msg):
    #     # Get position and orientation from the message
    #     x = msg.pose.pose.position.x
    #     y = msg.pose.pose.position.y
    #     z = msg.pose.pose.position.z
    #     qx = msg.pose.pose.orientation.x
    #     qy = msg.pose.pose.orientation.y
    #     qz = msg.pose.pose.orientation.z
    #     qw = msg.pose.pose.orientation.w

    #     # Create and publish the Odometry message
    #     odom = Odometry()
    #     odom.header.stamp = self.get_clock().now().to_msg()
    #     odom.header.frame_id = '/{}/odom'.format(self.__namespace)
    #     odom.child_frame_id = '/{}base_link'.format(self.__namespace)
    #     odom.pose.pose.position.x = x
    #     odom.pose.pose.position.y = y
    #     odom.pose.pose.position.z = z
    #     odom.pose.pose.orientation.x = qx
    #     odom.pose.pose.orientation.y = qy
    #     odom.pose.pose.orientation.z = qz
    #     odom.pose.pose.orientation.w = qw
    #     self.odom_publisher.publish(odom)
