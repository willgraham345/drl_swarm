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

from math import atan2, pi, sqrt, exp


class potentialField(Node): # MODIFY NAME
    def __init__(self):
        super().__init__("potential_field") # MODIFY NAME
        #self.cf_frame = self.declare_parameter('cf_frame', 'cf1').get_parameter_value().string_value
        #self.tf_buffer = Buffer()
        #self.tf_listener = TransformListener(self.tf_buffer, self)
        self.create_subscription(Odometry,  "tb1/odom", self.tb1_odom_callback, 1)
        self.create_subscription(Odometry,  "tb2/odom", self.tb2_odom_callback, 1)
        self.create_subscription(Odometry,  "cf1/odom", self.cf1_odom_callback, 1)
        
        self.tb1_control_publisher = self.create_publisher(Twist, '/tb1/cmd_vel', 10)
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
        if th > pi:
            th = th-2*pi
        self.pose_tb1 = [odom.pose.pose.position.x, odom.pose.pose.position.y, th]
    def tb2_odom_callback(self, odom):
        self.odom_tb2 = odom
        th = 2 * atan2(odom.pose.pose.orientation.z,odom.pose.pose.orientation.w)
        if th > pi:
            th = th-2*pi
        self.pose_tb2 = [odom.pose.pose.position.x, odom.pose.pose.position.y, th]
    def cf1_odom_callback(self, odom):
        self.odom_cf1 = odom
        th = 2 * atan2(odom.pose.pose.orientation.z,odom.pose.pose.orientation.w)
        self.pose_cf1 = [odom.pose.pose.position.x - 1.5, odom.pose.pose.position.y - 1.5, th]
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
            #print(self.pose_tb1)
            #control turtlebot 1
            #print("cf:",self.pose_cf1, "\ttb1:",self.pose_tb1)#, "tb2:",self.pose_tb2,)
            # tx_rel = self.pose_tb2[0]-self.pose_tb1[0]
            # ty_rel = self.pose_tb2[1]-self.pose_tb1[1]
            # cx_rel = self.pose_cf1[0]-self.pose_tb1[0]
            # cy_rel = self.pose_cf1[1]-self.pose_tb1[1]
            # #print(sqrt(tx_rel**2+ty_rel**2), sqrt(cx_rel**2+cy_rel**2))
            # cf_dirc = atan2(cy_rel,cx_rel)
            # tb_dirc = atan2(ty_rel,tx_rel)
            #print(cf_dirc*180/pi,tb_dirc*180/pi,self.pose_tb1[2]*180/pi)
            
            epsilon = 5.0
            tsig = .3
            cGain = 10
            #Gradient field movment
            x = self.pose_tb1[0]
            y = self.pose_tb1[1]
            tx = self.pose_tb2[0]
            ty = self.pose_tb2[1]
            cx = self.pose_cf1[0]
            cy = self.pose_cf1[1]
            #print(sqrt((x-cx)**2+(y-cy)**2))
            gradt_const = 10/tsig**2*exp(-1/2*((x-tx)**2+(y-ty)**2)/tsig**2)
            if x-cx == 0 and y-cy == 0:
                gradc_const = 0
            else:
                gradc_const = -cGain/sqrt((x-cx)**2+(y-cy)**2)
            grad_x = gradc_const*(x-cx)+gradt_const*(x-tx)
            grad_y = gradc_const*(y-cy)+gradt_const*(y-ty)
            #print(grad_x,grad_y)
            grad_dirc = atan2(grad_y,grad_x)
            grad_mag = sqrt(grad_x**2+grad_y**2)
            surf = 10*exp(-1/2*((x-tx)**2+(y-ty)**2)/tsig**2)+sqrt((x-cx)**2+(y-cy)**2)
            print(surf,grad_mag,grad_dirc*180/pi)




            interval = 5*pi/180
            #print(interval)
            twist = Twist()
            if grad_mag < 1:
                twist.linear.x = 0.0
                twist.angular.z = 0.0
            elif grad_dirc +interval > self.pose_tb1[2] and grad_dirc -interval < self.pose_tb1[2]:
                twist.linear.x = 1.0
                twist.angular.z = 0.0
            else:
                #print(cf_dirc-self.pose_tb1[2])
                if grad_dirc < self.pose_tb1[2] - 5*pi/6 or (grad_dirc > self.pose_tb1[2] and grad_dirc < self.pose_tb1[2] + 7*pi/6):
                    correctionDirection = 1
                else:
                    correctionDirection = -1
                twist.angular.z = epsilon * correctionDirection
                twist.angular.x = 0.0
            #printdes*180/pi,self.pose_tb1[2]*180/pi)
            self.tb1_control_publisher.publish(twist)
            #self.dispGrad()






            rclpy.spin_once(self)

    def dispGrad(self):
        epsilon = 5.0
        tsig = .4
        cGain = 1
        #Gradient field movment
        # x = self.pose_tb1[0]
        # y = self.pose_tb1[1]
        tx = self.pose_tb2[0]
        ty = self.pose_tb2[1]
        cx = self.pose_cf1[0]
        cy = self.pose_cf1[1]
        #print(sqrt((x-cx)**2+(y-cy)**2))
        print(cx,cy)
        print("\t",end="")
        for i in range(20):
            x = -i/4
            print(x,": ", end="")
        print("")
        for i in range(20):
            x = -i/4
            for j in range(20):
                y = -j/4
                # if x==0:
                #     print("\t",y,":", end="")
                # gradt_const = -10/tsig**2*exp(-1/2*((x-tx)**2+(y-ty)**2)/tsig**2)
                # if x-cx == 0 and y-cy == 0:
                #     gradc_const = 0
                # else:
                #     gradc_const = -cGain/sqrt((x-cx)**2+(y-cy)**2)
                # grad_x = gradc_const*(x-cx)#+gradt_const*(x-tx)
                # grad_y = gradc_const*(y-cy)#+gradt_const*(y-ty)
                # #print(grad_x,grad_y)
                # grad_dirc = atan2(grad_x,grad_y)
                # grad_mag = sqrt(grad_x**2+grad_y**2)
                # print("\t",int(grad_dirc*180/pi), end="")
                surf = 10*exp(-1/2*((x-tx)**2+(y-ty)**2)/tsig**2)+sqrt((x-cx)**2+(y-cy)**2)
                print("\t",int(10*surf), end="")
            print(" endln")
                # interval = 5*pi/180
                # #print(interval)
                # twist = Twist()
                # if grad_dirc +interval > self.pose_tb1[2] and grad_dirc -interval < self.pose_tb1[2]:
                #     twist.linear.x = 1.0
                #     twist.angular.z = 0.0
                # else:
                #     #print(cf_dirc-self.pose_tb1[2])
                #     if grad_dirc < self.pose_tb1[2] - 5*pi/6 or (grad_dirc > self.pose_tb1[2] and grad_dirc < self.pose_tb1[2] + 7*pi/6):
                #         correctionDirection = 1
                #     else:
                #         correctionDirection = -1
                #     twist.angular.z = epsilon * correctionDirection
                #     twist.angular.x = 0.0
                # #printdes*180/pi,self.pose_tb1[2]*180/pi)
                #self.tb1_control_publisher.publish(twist)

    

def main(args=None):
    rclpy.init(args=None)
    node = potentialField()
    #rclpy.spin(node)
    node.run()
    rclpy.shutdown()
    

if __name__ == "__main__":
    main()