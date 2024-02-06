import rclpy
from rclpy.node import Node
from rosgraph_msgs.msg import Clock
from rclpy.time import Time
from std_msgs.msg import String
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseWithCovarianceStamped


from geometry_msgs.msg import Point, Pose, Quaternion, Twist, Vector3
from sensor_msgs.msg import LaserScan
from nav_msgs.msg import Odometry

from math import cos, sin, degrees, radians, pi
import sys
import tf_transformations
from tf2_ros import TransformBroadcaster
from geometry_msgs.msg import TransformStamped

# Change this path to your crazyflie-firmware folder
sys.path.append('/home/will/crazyflie-firmware/build')
import cffirmware


class CrazyflieWebotsDriver():
    def init(self, webots_node, properties):
        # Declare the robot name and fix the timestep
        self.__robot = webots_node.robot
        self.timestep = int(self.__robot.getBasicTimeStep())
        self._robot_name = self.__robot.getName()

        self.namespace = str(self._robot_name)

        ## Initialize motors
        self.__m1_motor = self.__robot.getDevice("m1_motor")
        self.__m1_motor.setPosition(float('inf'))
        self.__m1_motor.setVelocity(-1)
        self.__m2_motor = self.__robot.getDevice("m2_motor")
        self.__m2_motor.setPosition(float('inf'))
        self.__m2_motor.setVelocity(1)
        self.__m3_motor = self.__robot.getDevice("m3_motor")
        self.__m3_motor.setPosition(float('inf'))
        self.__m3_motor.setVelocity(-1)
        self.__m4_motor = self.__robot.getDevice("m4_motor")
        self.__m4_motor.setPosition(float('inf'))
        self.__m4_motor.setVelocity(1)

        self.target_twist = Twist()

        ## Initialize Sensors
        self.__imu = self.__robot.getDevice("inertial_unit")
        self.__imu.enable(self.timestep)
        self.__gps = self.__robot.getDevice("gps") #TODO: Remove this gps signal
        self.__gps.enable(self.timestep)
        self.__gyro = self.__robot.getDevice("gyro")
        self.__gyro.enable(self.timestep)
        self.range_front = self.__robot.getDevice("range_front")
        self.range_front.enable(self.timestep)
        self.range_left = self.__robot.getDevice("range_left")
        self.range_left.enable(self.timestep)
        self.range_back = self.__robot.getDevice("range_back")
        self.range_back.enable(self.timestep)
        self.range_right = self.__robot.getDevice("range_right")
        self.range_right.enable(self.timestep)

        ## Intialize Variables
        self.past_x_global = 0
        self.past_y_global = 0
        self.past_z_global = 0
        self.past_time = self.__robot.getTime()
        # self.__clock = Clock()
        # self.__node.create_subscription(Clock, 'clock', self.__clock_callback, 1)
        # self.__publisher = self.__node.create_publisher(Clock, 'custom_clock', 1)

        self.first_pos = True
        self.first_x_global = 0.0
        self.first_y_global = 0.0


        cffirmware.controllerPidInit()

        rclpy.init(args=None)
        self.__node = rclpy.create_node(
                            'cf_driver',
                            namespace=self.namespace,
                            allow_undeclared_parameters=True,
                            automatically_declare_parameters_from_overrides=True)

        msg_type = Twist()
        self.tfbr = TransformBroadcaster(self.__node)
        self.msg_laser = LaserScan()
        self.__node.create_timer(1.0/30.0, self.publish_laserscan_data)
        
        self.target_cmd_vel = msg_type
        # initialize webots driver node
        try:
            self.__node.create_subscription(Twist(),  '/{}/cmd_vel'.format(self.namespace), self.cmd_vel_callback, 1)
            self.laser_publisher = self.__node.create_publisher(LaserScan, '/{}/scan'.format(self.namespace), 10)
            self.odom_publisher = self.__node.create_publisher(Odometry, '/{}/odom'.format(self.namespace), 10)
            print("Created subscriber and publisher on Crazyflie")
        except Exception as e:
            print(e)
            print("Failed to create subscriber or publisher on Crazyflie")

    def publish_laserscan_data(self):

        front_range = self.range_front.getValue()/1000.0

        back_range = self.range_back.getValue()/1000.0
        left_range = self.range_left.getValue()/1000.0
        right_range = self.range_right.getValue()/1000.0
        max_range = 3.49
        if front_range > max_range:
            front_range = float("inf")
        if left_range > max_range:
            left_range = float("inf")
        if right_range > max_range:
            right_range = float("inf")
        if back_range > max_range:
            back_range = float("inf")  

        self.msg_laser = LaserScan()
        self.msg_laser.header.stamp = Time(seconds=self.__robot.getTime()).to_msg()
        self.msg_laser.header.frame_id = '{}/base_link'.format(self.namespace)
        self.msg_laser.range_min = 0.1
        self.msg_laser.range_max = max_range
        self.msg_laser.ranges = [back_range, left_range, front_range, right_range, back_range]
        self.msg_laser.angle_min = 0.5 * 2*pi
        self.msg_laser.angle_max =  -0.5 * 2*pi
        self.msg_laser.angle_increment = -1.0*pi/2
        self.laser_publisher.publish(self.msg_laser)

    def cmd_vel_callback(self, twist):
        self.target_twist = twist
    def publish_odometry(self, odom_msg): #TODO: Fix this publisher
        #
        # odom = Odometry()
        # odom.header.stamp = Time(seconds=self.robot.getTime()).to_msg()
        # odom.header.frame_id = 'odom'
        # odom.child_frame_id = 'base_link'
        # odom.pose.pose.position.x = x_global
        # odom.pose.pose.position.y = y_global
        # odom.pose.pose.position.z = 0.0

        # #odom.pose.pose.orientation.x = q_base[0]
        # #odom.pose.pose.orientation.y = q_base[1]
        # #odom.pose.pose.orientation.z = q_base[2]
        # #odom.pose.pose.orientation.w = q_base[3]
        # odom.pose.pose.orientation.z = sin(yaw / 2)
        # odom.pose.pose.orientation.w = cos(yaw / 2)

        # This commmented part is from crazychoir
        # odom = Odometry()
        # odom.header.stamp = Time(seconds=self.robot.getTime()).to_msg()
        # odom.header.frame_id = 'odom'
        # odom.child_frame_id = 'base_link'
        # odom.pose.pose.position.x = self.current_pose.position[0]
        # odom.pose.pose.position.y = self.current_pose.position[1]
        # odom.pose.pose.position.z = self.current_pose.position[2]

        # odom.twist.twist.linear.x = self.current_pose.velocity[0]
        # odom.twist.twist.linear.y = self.current_pose.velocity[1]
        # odom.twist.twist.linear.z = self.current_pose.velocity[2]

        # odom.pose.pose.orientation.x = self.current_pose.orientation[0]
        # odom.pose.pose.orientation.y = self.current_pose.orientation[1]
        # odom.pose.pose.orientation.z = self.current_pose.orientation[2]
        # odom.pose.pose.orientation.w = self.current_pose.orientation[3]

        # odom.twist.twist.angular.x = self.current_pose.angular[0]
        # odom.twist.twist.angular.y = self.current_pose.angular[1]
        # odom.twist.twist.angular.z = self.current_pose.angular[2]
        self.odom_publisher.publish(odom_msg)
    
    def step(self):
        rclpy.spin_once(self.__node, timeout_sec=0)
        try: 
            self.__robot.step(self.timestep)
        except Exception as e:
            print(e)
            print("Failed to step the robot")
        
        try:
            dt = self.__robot.getTime() - self.past_time
            ## Get measurements
        except:
            print("Failed to get timing measurements")

        self.__robot.step()

        if self.first_pos is True:
            self.first_x_global = self.__gps.getValues()[0]
            self.first_y_global = self.__gps.getValues()[1]
            self.first_pos = False

        dt = self.__robot.getTime() - self.past_time
        ## Get measurements
        roll = self.__imu.getRollPitchYaw()[0]
        pitch = self.__imu.getRollPitchYaw()[1]
        yaw = self.__imu.getRollPitchYaw()[2]
        roll_rate = self.__gyro.getValues()[0]
        pitch_rate = self.__gyro.getValues()[1]
        yaw_rate = self.__gyro.getValues()[2]
        x_global = self.__gps.getValues()[0] - self.first_x_global
        vx_global = (x_global - self.past_x_global)/dt
        y_global = self.__gps.getValues()[1]- self.first_y_global
        vy_global = (y_global - self.past_y_global)/dt
        z_global = self.__gps.getValues()[2]
        vz_global = (z_global - self.past_z_global)/dt


        q_base = tf_transformations.quaternion_from_euler(0, 0, yaw)
        
        q_base = tf_transformations.quaternion_from_euler(0, 0, yaw)
        odom_msg = Odometry()
        odom_msg.header.stamp = Time(seconds=self.__robot.getTime()).to_msg()
        odom_msg.header.frame_id = 'odom'
        odom_msg.child_frame_id = '{}/base_link'.format(self.namespace)
        odom_msg.pose.pose.position.x = x_global
        odom_msg.pose.pose.position.y = y_global
        odom_msg.pose.pose.position.z = z_global
        odom_msg.pose.pose.orientation.z = sin(yaw / 2)
        odom_msg.pose.pose.orientation.w = cos(yaw / 2)

        self.odom_publisher.publish(odom_msg)


        # Will's try at getting odometry to publish. I think we'll go down the transform route
        # odom_msg = Odometry()
        # odom_msg.header.stamp = Time(seconds=self.robot.getTime()).to_msg()
        # odom_msg.pose.pose = Pose(Point(x_global, y_global, 0.), )
        # self.publish_odometry(odom_msg)


        t_base = TransformStamped()
        t_base.header.stamp = Time(seconds=self.__robot.getTime()).to_msg()
        t_base.header.frame_id = 'odom'
        t_base.child_frame_id = '{}/base_link'.format(self.namespace)
        t_base.transform.translation.x = x_global
        t_base.transform.translation.y = y_global
        t_base.transform.translation.z = z_global
        #t_base.transform.rotation.x = q_base[0]
        #t_base.transform.rotation.y = q_base[1]
        #t_base.transform.rotation.z = q_base[2]
        #t_base.transform.rotation.w = q_base[3]
        t_base.transform.rotation.z = sin(yaw / 2)
        t_base.transform.rotation.w = cos(yaw / 2)
        self.tfbr.sendTransform(t_base)

        ## Put measurement in state estimate
        # oTODO: replace these with a EKF python binding
        state = cffirmware.state_t()
        state.attitude.roll = degrees(roll)
        state.attitude.pitch = -degrees(pitch)
        state.attitude.yaw = degrees(yaw)
        state.position.x = x_global
        state.position.y = y_global
        state.position.z = z_global
        state.velocity.x = vx_global
        state.velocity.y = vy_global
        state.velocity.z = vz_global
        
        # Put gyro in sensor data
        sensors = cffirmware.sensorData_t()
        sensors.gyro.x = degrees(roll_rate)
        sensors.gyro.y = degrees(pitch_rate)
        sensors.gyro.z = degrees(yaw_rate)
        yawDesired=0

        ## Fill in Setpoints
        setpoint = cffirmware.setpoint_t()
        setpoint.mode.z = cffirmware.modeAbs
        setpoint.position.z = 1.0
        setpoint.mode.yaw = cffirmware.modeVelocity
        # kTODO: find out why this multipication is necessary...
        setpoint.attitudeRate.yaw = degrees(self.target_twist.angular.z)*5
        setpoint.mode.x = cffirmware.modeVelocity
        setpoint.mode.y = cffirmware.modeVelocity
        setpoint.velocity.x = self.target_twist.linear.x
        setpoint.velocity.y = self.target_twist.linear.y
        setpoint.velocity_body = True

        ## Firmware PID bindings
        control = cffirmware.control_t()
        tick = 100 #this value makes sure that the position controller and attitude controller are always always initiated
        cffirmware.controllerPid(control, setpoint,sensors,state,tick)

        ## 
        cmd_roll = radians(control.roll)
        cmd_pitch = radians(control.pitch)
        cmd_yaw = -radians(control.yaw)
        cmd_thrust = control.thrust

        ## Motor mixing
        motorPower_m1 =  cmd_thrust - cmd_roll + cmd_pitch + cmd_yaw
        motorPower_m2 =  cmd_thrust - cmd_roll - cmd_pitch - cmd_yaw
        motorPower_m3 =  cmd_thrust + cmd_roll - cmd_pitch + cmd_yaw
        motorPower_m4 =  cmd_thrust + cmd_roll + cmd_pitch - cmd_yaw

        scaling = 1000 ##Todo, remove necessity of this scaling (SI units in firmware)
        self.__m1_motor.setVelocity(-motorPower_m1/scaling)
        self.__m2_motor.setVelocity(motorPower_m2/scaling)
        self.__m3_motor.setVelocity(-motorPower_m3/scaling)
        self.__m4_motor.setVelocity(motorPower_m4/scaling)

        self.past_time = self.__robot.getTime()
        self.past_x_global = x_global
        self.past_y_global = y_global
        self.past_z_global = z_global