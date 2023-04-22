import rclpy
from rclpy.node import Node
import sys
import math

from std_msgs.msg import String
from geometry_msgs.msg import Pose
import tf_transformations
from tf2_ros import TransformBroadcaster
from geometry_msgs.msg import TransformStamped
from sensor_msgs.msg import Range
from sensor_msgs.msg import LaserScan
from nav_msgs.msg import Odometry, OccupancyGrid
from geometry_msgs.msg import Twist
from visualization_msgs.msg import MarkerArray, Marker

import numpy as np

# Change this path to your crazyflie-firmware folder
sys.path.append('/home/luke/graph-search')
import graph_search

class CrazyflieControllerNode(Node):

    def __init__(self):
        super().__init__("crazyflie_controller")
        self.cmd_vel_publisher_ = self.create_publisher(
            Twist, '/cf1/cmd_vel', 10)
        self.odom_subscriber_ = self.create_subscription(
            Odometry, "/cf1/odom", self.odom_callback, 10)
        self.map_subscriber_ = self.create_subscription(
            OccupancyGrid, '/cf1/map', self.map_callback, 10)
        self.marker_publisher_ = self.create_publisher(
            Marker, '/vizualization_marker', 1)
        # self.timer_ = self.create_timer(0.25, self.publish_array)
        self.timer2_ = self.create_timer(4, self.update_planner)
        self.get_logger().info("Crazyflie Controller has been created")

        # controller variables
        self.occ_grid = 0
        self.occ_grid_origin = np.array([0,0])
        self.occ_grid_cpm = 1.0
        self.resolution = 0.0
        self.x = 0.0
        self.y = 0.0
        self.z = 0.0
        self.roll = 0.0
        self.pitch = 0.0
        self.yaw = 0.0
        self.vr = 0.25
        self.wr = 0.0
        self.kx = 0.5
        self.ky = 0.8 * 10**-3
        self.kt = 0.2
        self.iters = 0
        self.yaw_init = 0.0

        # path planning variables
        self.goal = [-2,-2]
        self.path = []
        self.path_complete = True
        self.old_goal = [0, 0]

    def odom_callback(self, odom: Odometry):

        # get odometry infor
        q = [0,0,0,0]
        self.x = odom.pose.pose.position.x
        self.y = odom.pose.pose.position.y
        self.z = odom.pose.pose.position.z
        q[0] = odom.pose.pose.orientation.x 
        q[1] = odom.pose.pose.orientation.y
        q[2] = odom.pose.pose.orientation.z
        q[3] = odom.pose.pose.orientation.w
        self.roll, self.pitch, self.yaw = tf_transformations.euler_from_quaternion(q)

        # help init orientation for controller 
        if self.iters == 0:
            self.yaw_init = self.yaw
        else:
            self.iters = 2

        self.iters+=1


        if not len(self.path) > 1:
            goal_dist = self.check_distance([self.x,self.y],np.array(self.goal)/self.occ_grid_cpm + self.occ_grid_origin)
        else:
            goal_dist = 100

        # generate the command
        if len(self.path) > 1 and goal_dist > 0.1:

            distance = self.check_distance([self.x,self.y],self.path[0])

            if distance < self.resolution:
                # move along the path 
                self.path = self.path[1:]
                self.get_logger().info('moving')
                self.get_logger().info(str(len(self.path)))
                
            # get error states
            x_err = self.path[0][0]
            y_err = self.path[0][1]
            theta_des = math.atan2((self.path[1][1]-self.path[0][1]),(self.path[1][0]-self.path[0][0])) + self.yaw_init
            theta_err = theta_des - self.yaw

            # simple controller
            x_cmd = self.kx * (x_err)
            y_cmd = self.ky * (y_err)
            z_rot_cmd = self.kt * (theta_err)

            # # transform into robot frame
            # rot_array = np.array([np.cos(self.yaw), np.sin(self.yaw), 0, -np.sin(self.yaw), np.cos(self.yaw), 0, 0, 0, 1])
            # rot_matrix = rot_array.reshape((3,3))
            # state_array = np.array([x_err, y_err, theta_err])
            # state_matrix = state_array.reshape((3,1))
            # err_transform = rot_matrix @ state_matrix
            # # self.get_logger().info(str(err_transform))

            # # determine commands
            # v_cmd = self.vr * np.cos(err_transform[2]) + self.kx * err_transform[0]
            # w_cmd = self.wr + self.vr * (self.ky * err_transform[1] + self.kt * np.sin(err_transform[2]))
            # x_cmd = v_cmd * np.cos(self.yaw)
            # y_cmd = v_cmd * np.sin(self.yaw)
            # z_rot_cmd = w_cmd
            # convert = np.linalg.inv(rot_matrix) @ np.array([x_cmd, y_cmd, z_rot_cmd]).reshape(3,1)

            # limit the velocities
            x_cmd = self.limit_velocity(x_cmd,0.5)
            y_cmd = self.limit_velocity(y_cmd,0.5)
            z_rot_cmd = self.limit_velocity(z_rot_cmd,0.5)

            # self.get_logger().info(str(x_cmd))
            # self.get_logger().info(str(y_cmd))
            # self.get_logger().info(str(z_rot_cmd))

        else:
            x_cmd = 0.0
            y_cmd = 0.0
            z_rot_cmd = 1.0

            # path complete
            self.path_complete = True
            self.path = []

        # send command to the drone
        cmd = Twist()
        cmd.linear.x=float(x_cmd)
        cmd.linear.y=float(y_cmd)
        cmd.angular.z=float(z_rot_cmd)
        self.cmd_vel_publisher_.publish(cmd)

    def map_callback(self, msg: OccupancyGrid):
        
        # # get the data
        self.occ_grid = np.array(msg.data).reshape((msg.info.height, msg.info.width))
        self.occ_grid_origin = np.array((msg.info.origin.position.x, msg.info.origin.position.y))
        self.occ_grid_cpm = 1 / msg.info.resolution
        self.resolution = msg.info.resolution

        if self.path_complete:
            self.path_complete = False
            break_flag = False
            rows,cols = np.shape(self.occ_grid)
            for row in range(0,rows):
                for col in range(0,cols):
                    check = self.occ_grid[row,col]
                    neighbors = self.check_near([row,col])
                    if check == -1 and 0 in neighbors:
                        counts = 0
                        for n in neighbors:
                            if n == 0:
                                counts += 1
                        distance = self.check_distance([self.x,self.y],np.array([row,col])/self.occ_grid_cpm + self.occ_grid_origin)
                        if all(np.array([row,col]) != self.old_goal) and counts > 1 and distance > 0.5:
                            break_flag = True
                            self.goal = np.array([row,col])
                            # self.get_logger().info('found one')
                        break
                if break_flag:
                    break

            marker = self.get_marker()
            self.marker_publisher_.publish(marker)

            self.path = np.array(self.find_path())/self.occ_grid_cpm + self.occ_grid_origin

            # z = np.zeros(np.shape(self.path))
            # self.path = np.append(self.path, z,1)

            # self.get_logger().info(str(self.path))

    def find_path(self):

        # self.get_logger().info('origin: ' + str(self.occ_grid_origin))
        start = np.rint((np.array([self.x, self.y]) - self.occ_grid_origin) * self.occ_grid_cpm)

        # self.get_logger().info(str(self.check_distance(self.goal,start)))
        
        g = graph_search.GridMap(start, self.goal, self.occ_grid)
        res = graph_search.bfs(g.init_pos, g.transition, g.is_goal, graph_search._ACTIONS_2)

        self.old_goal = self.goal

        g.display_map()

        return res[0][0]
    
    def check_distance(self, pt1, pt2):
        ans = np.sqrt((pt1[0]-pt2[0])**2 + (pt1[1]-pt2[1])**2)
        return ans
    
    def check_near(self, coords):

        if coords[0] > 0 and coords[1] > 0 and coords[0] < 199 and coords[1] < 199:
            neighbors = []
            neighbors.append(self.occ_grid[coords[0]+1,coords[1]+1])
            neighbors.append(self.occ_grid[coords[0]+1,coords[1]+0])
            neighbors.append(self.occ_grid[coords[0]+1,coords[1]-1])
            neighbors.append(self.occ_grid[coords[0]-1,coords[1]+1])
            neighbors.append(self.occ_grid[coords[0]+0,coords[1]+1])
            neighbors.append(self.occ_grid[coords[0]+0,coords[1]+0])
            neighbors.append(self.occ_grid[coords[0]-1,coords[1]-1])
            neighbors.append(self.occ_grid[coords[0]+0,coords[1]-1])
        else:
            neighbors = [-1, -1, -1, -1, -1, -1, -1, -1, -1]

        return neighbors
    
    def publish_array(self):
        if len(self.path) > 0:
            msg = MarkerArray()
            msg.markers.clear()
            marker = Marker()
            for elems in self.path:
                marker.pose.position.x = elems[0]
                marker.pose.position.y = elems[1]
                marker.pose.position.z = elems[2]
                marker.type = Marker.SPHERE
                marker.action = Marker.ADD
                msg.markers.append(marker)
                self.marker_publisher_.publish(msg)

    def update_planner(self):
        self.path_complete = True

    def limit_velocity(self, vel, limit):
        if vel > limit:
            vel = limit
        elif vel < -limit:
            vel = -limit
        else:
            vel = vel
        return vel
    
    def get_marker(self):
        marker = Marker()
        marker.header.frame_id = '\cf1\map'
        marker.id = 0
        marker.type = Marker.SPHERE
        marker.action = Marker.ADD
        convert = np.array(self.goal)/self.occ_grid_cpm + self.occ_grid_origin
        # self.get_logger().info(str(convert))
        marker.pose.position.x = float(convert[0])
        marker.pose.position.y = float(convert[1])
        marker.pose.position.z = self.z
        marker.pose.orientation.x = 0.0
        marker.pose.orientation.y = 0.0
        marker.pose.orientation.z = 0.0
        marker.pose.orientation.w = 0.0
        marker.scale.x = 3.0
        marker.scale.y = 3.0
        marker.scale.z = 3.0
        marker.color.r = 0.0
        marker.color.g = 1.0
        marker.color.b = 0.0
        marker.color.a = 1.0

        return marker

def main(args=None):
    rclpy.init(args=args)
    node = CrazyflieControllerNode()
    rclpy.spin(node)
    rclpy.shutdown()

