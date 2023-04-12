import rclpy
from geometry_msgs.msg import Twist

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
