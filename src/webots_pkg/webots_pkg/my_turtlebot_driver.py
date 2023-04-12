import rclpy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
from math import cos, sin, degrees, radians, pi

HALF_DISTANCE_BETWEEN_WHEELS = 0.045
WHEEL_RADIUS = 0.025
# USE THIS!!!!
# https://cyberbotics.com/doc/reference/lidar?tab-language=python
class MyTurtlebotDriver:
    def init(self, webots_node, properties):
        self.__robot = webots_node.robot
        self.timestep = int(self.__robot.getBasicTimeStep())
        self._robot_name = self.__robot.getName()
        self.__left_motor = self.__robot.getDevice('left wheel motor')
        self.__right_motor = self.__robot.getDevice('right wheel motor')

        self.lidar = self.__robot.getDevice("LDS-01")
        self.lidar.enable(self.timestep)
        self.laser_publisher = self.node.create_publisher(LaserScan, 'scan', 10)


        self.__left_motor.setPosition(float('inf'))
        self.__left_motor.setVelocity(0)

        self.__right_motor.setPosition(float('inf'))
        self.__right_motor.setVelocity(0)

        self.__target_twist = Twist()

        rclpy.init(args=None)
        self.__namespace = str(self._robot_name)
        self.tb_driver = rclpy.create_node('my_turtlebot_driver',
                                namespace=self.__namespace,
                                allow_undeclared_parameters=True,
                                automatically_declare_parameters_from_overrides=True)
        self.tb_driver.create_subscription(Twist, '/{}/cmd_vel'.format(self.__namespace), self.__cmd_vel_callback, 1)

    def __cmd_vel_callback(self, twist):
        self.__target_twist = twist

    def step(self):
        rclpy.spin_once(self.tb_driver, timeout_sec=0)

        forward_speed = self.__target_twist.linear.x
        angular_speed = self.__target_twist.angular.z

        command_motor_left = (forward_speed - angular_speed * HALF_DISTANCE_BETWEEN_WHEELS) / WHEEL_RADIUS
        command_motor_right = (forward_speed + angular_speed * HALF_DISTANCE_BETWEEN_WHEELS) / WHEEL_RADIUS

        self.__left_motor.setVelocity(command_motor_left)
        self.__right_motor.setVelocity(command_motor_right)

        self.publish_lidar()

    def publish_lidar(self):
        ranges = self.lidar.getLayerRangeImage(0)
        msg = LaserScan()
        msg.header.stamp = self.__node.get_clock().now().to_msg()
        msg.header.frame_id = 'base_link_rotated' #THIS IS PROBABLY NOT RIGHT!!!! ACTUALLY A LOT OF THESE MAY BE INACURATE IDK
        msg.angle_min = -0.5 * pi
        msg.angle_max = 0.5 * pi
        msg.angle_increment = pi / (self.lidar.getHorizontalResolution() - 1)
        #msg.scan_time = self.lidar.getSamplingPeriod() / 1000.0
        msg.range_min = self.lidar.getMinRange() 
        msg.range_max = self.lidar.getMaxRange()
        msg.ranges = ranges
        self.laser_publisher.publish(msg)
        #self.__node.get_logger().info(str(ranges))
