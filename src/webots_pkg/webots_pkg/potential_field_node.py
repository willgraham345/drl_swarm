import math

from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry

import rclpy
from rclpy.node import Node

from tf2_ros import TransformException
from tf2_ros.buffer import Buffer
from tf2_ros.transform_listener import TransformListener

from turtlesim.srv import Spawn
import array

from math import atan2


class potentialField(Node): # MODIFY NAME
    def __init__(self):
        super().__init__("potential_field") # MODIFY NAME
        #self.cf_frame = self.declare_parameter('cf_frame', 'cf1').get_parameter_value().string_value
        #self.tf_buffer = Buffer()
        #self.tf_listener = TransformListener(self.tf_buffer, self)
        self.create_subscription(Odometry,  "tb1/odom", self.tb1_odom_callback, 1)
        self.create_subscription(Odometry,  "tb2/odom", self.tb2_odom_callback, 1)
        self.create_subscription(Odometry,  "cf1/odom", self.cf1_odom_callback, 1)
        
        #self.tb1_control_publisher = self.tb_driver.create_publisher(Twist, '/tb1/cmd_vel', 10)
        #print("hello")
        self.odom_tb1 = Odometry()
        self.odom_tb2 = Odometry()
        self.odom_cf1 = Odometry()
        self.pose_tb1 = [0,0,0]
        self.pose_tb2 = [0,0,0]
        self.pose_cf1 = [0,0,0]

    def tb1_odom_callback(self, odom):
        self.odom_tb1 = odom
        th = 2 * atan2(odom.pose.pose.orientation.z,odom.pose.pose.orientation.w)
        self.pose_tb1 = [odom.pose.pose.position.x, odom.pose.pose.position.y, th]
        

    def tb2_odom_callback(self, odom):
        self.odom_tb2 = odom
        th = 2 * atan2(odom.pose.pose.orientation.z,odom.pose.pose.orientation.w)
        self.pose_tb2 = [odom.pose.pose.position.x, odom.pose.pose.position.y, th]
    def cf1_odom_callback(self, odom):
        self.odom_cf1 = odom
        th = 2 * atan2(odom.pose.pose.orientation.z,odom.pose.pose.orientation.w)
        self.pose_cf1 = [odom.pose.pose.position.x, odom.pose.pose.position.y, th]
        #print("got odom cf1")


    # def step(self):
    #     # rclpy.spin_once(self, timeout_sec=0)
    #     self.tb1_odom_callback()
    #     print("hello")#self.odom_tb1.pose.pose.position.y)
    #     #self.get_logger().info('MyPlugin is running')
    #     # self.get_logger().info('MyPlugin initialized')

    def run(self):
        while rclpy.ok():
            #print("running", self.odom_tb1.pose.pose.orientation.z,self.odom_tb1.pose.pose.orientation.w)
            print(self.pose_tb1)
            #control turtlebot 1
            tx_rel = self.pose_tb2[0]-self.pose_tb1[0]
            ty_rel = self.pose_tb2[1]-self.pose_tb1[1]
            tx_rel = self.pose_cf1[0]-self.pose_tb1[0]
            ty_rel = self.pose_cf1[1]-self.pose_tb1[1]








            rclpy.spin_once(self)


def main(args=None):
    rclpy.init(args=None)
    node = potentialField()
    #rclpy.spin(node)
    node.run()
    rclpy.shutdown()
    

if __name__ == "__main__":
    main()