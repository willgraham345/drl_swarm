import rclpy
from rclpy.node import Node
import sys
import math

import time
import tf_transformations
from sensor_msgs.msg import Range
from nav_msgs.msg import Odometry, OccupancyGrid
from geometry_msgs.msg import Twist
from visualization_msgs.msg import MarkerArray, Marker

import numpy as np

# Change this path to your crazyflie-firmware folder
sys.path.append('/home/will/drl_swarm/src/mrs_pkg/resource')
# import graph_search

class CrazyflieControllerNode(Node):
    """
    This class is a ROS2 node that controls the crazyflie in the webots simulation. Works hand in hand with the graph_search.py file to plan a path to the goal. Deprecated in favor of Nav2 platform.

    Args:
        Node (rclpy.node.Node): ROS2 node.

    Attributes:
        cmd_vel_publisher_ (rclpy.publisher.Publisher): Publisher for commanding velocity.
        odom_subscriber_ (rclpy.subscription.Subscription): Subscriber for odometry data.
        map_subscriber_ (rclpy.subscription.Subscription): Subscriber for occupancy grid map.
        marker_publisher_ (rclpy.publisher.Publisher): Publisher for visualization marker.
        range_subscriber_ (rclpy.subscription.Subscription): Subscriber for front range sensor data.
        range_right_subscriber_ (rclpy.subscription.Subscription): Subscriber for right range sensor data.
        range_back_subscriber_ (rclpy.subscription.Subscription): Subscriber for back range sensor data.
        range_left_subscriber_ (rclpy.subscription.Subscription): Subscriber for left range sensor data.
        occ_grid (int): Occupancy grid data.
        occ_grid_origin (numpy.array): Origin of the occupancy grid.
        occ_grid_cpm (float): Conversion factor from cells per meter to occupancy grid.
        resolution (float): Resolution of the occupancy grid.
        x (float): X position from odometry.
        y (float): Y position from odometry.
        z (float): Z position from odometry.
        roll (float): Roll angle from odometry.
        pitch (float): Pitch angle from odometry.
        yaw (float): Yaw angle from odometry.
        vr (float): Linear velocity.
        wr (float): Angular velocity.
        kx (float): Proportional gain for x error.
        ky (float): Proportional gain for y error.
        kt (float): Proportional gain for theta error.
        iters (int): Iteration count.
        yaw_init (float): Initial yaw angle.
        xlim (float): X limit for velocity.
        ylim (float): Y limit for velocity.
        tlim (float): Theta limit for velocity.
        theta_err_old (float): Previous theta error.
        x_err_old (float): Previous x error.
        y_err_old (float): Previous y error.
        past_time (float): Previous time.
        goal (list): Goal position.
        path (list): Path to the goal.
        path_complete (bool): Flag indicating if the path is complete.
        old_goal (list): Previous goal position.
    """

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
        self.range_subscriber_ = self.create_subscription(
            Range, '/cf1/range_front', self.range_callback, 10)
        self.range_right_subscriber_ = self.create_subscription(
            Range, '/cf1/range_right', self.range_callback_right, 10)
        self.range_back_subscriber_ = self.create_subscription(
            Range, '/cf1/range_back', self.range_callback_back, 10)
        self.range_left_subscriber_ = self.create_subscription(
            Range, '/cf1/range_left', self.range_callback_left, 10)
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
        self.kx = 1.5
        self.ky = 1.5
        self.kt = 1.0
        self.iters = 0
        self.yaw_init = 0.0
        self.xlim = 0.5
        self.ylim = 0.5
        self.tlim = 2.0
        self.theta_err_old = 0.0
        self.x_err_old = 0.0
        self.y_err_old = 0.0
        self.past_time = 0.0

        # path planning variables
        self.goal = [-2,-2]
        self.path = []
        self.path_complete = True
        self.old_goal = [0, 0]

    def odom_callback(self, odom: Odometry):
        """
        Callback function for odometry data in ros node.

        Args:
            odom (Odometry): Odometry data.
        
        Returns:
            None
        """

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
        if len(self.path) > 1 and goal_dist > 0.3:

            dt =  time.time() - self.past_time

            distance = self.check_distance([self.y,self.x],self.path[0])

            xlimit = self.xlim
            ylimit = self.ylim
            tlimit = self.tlim

            if distance < self.resolution:
                # move along the path 
                self.path = self.path[1:]
                # self.get_logger().info('moving')
                # self.get_logger().info(str(len(self.path)))
                if len(self.path) < 12:
                    ratio = 1/(12-len(self.path))
                    xlimit = ratio * self.xlim
                    ylimit = ratio * self.ylim
                    # tlimit = ratio * self.tlim
                
            # get error states
            x_err = self.path[0][1] - self.x
            y_err = self.path[0][0] - self.y
            if len(self.path) > 1:
                theta_des = math.atan2((self.path[1][1]-self.path[0][1]),(self.path[1][0]-self.path[0][0]))
                # theta_des = math.atan2(y_err, x_err)
                theta_err = theta_des - self.yaw
            else:
                theta_err = 0.0

            if np.abs(theta_err - 2*np.pi) < theta_err:
                theta_err = theta_err - 2*np.pi

            # self.get_logger().info(str(theta_err))

            if np.abs(theta_err) > 0.3:
                xlimit = 0.0
                ylimit = 0.0

            # self.get_logger().info(str([self.x, self.y]))

            # simple controller
            x_cmd = self.kx * (x_err) + self.kx/5 * (x_err - self.x_err_old)/dt
            y_cmd = self.ky * (y_err) + self.ky/5 * (y_err - self.y_err_old)/dt
            z_rot_cmd = self.kt * (theta_err) + self.kt/5 * (theta_err - self.theta_err_old)/dt

            self.past_time = time.time()
            # update 
            self.x_err_old = x_err
            self.y_err_old = y_err
            self.theta_err_old = theta_err

            # # transform into robot frame
            rot_array = np.array([np.cos(self.yaw), np.sin(self.yaw), 0, -np.sin(self.yaw), np.cos(self.yaw), 0, 0, 0, 1])
            rot_matrix = rot_array.reshape((3,3))
            state_array = np.array([x_err, y_err, theta_err])
            state_matrix = state_array.reshape((3,1))
            err_transform = rot_matrix @ state_matrix
            x_cmd = self.kt*err_transform[0]
            y_cmd = self.ky*err_transform[1]
            # z_rot_cmd = self.kt*err_transform[2]
            # # self.get_logger().info(str(err_transform))

            # # determine commands
            # v_cmd = self.vr * np.cos(err_transform[2]) + self.kx * err_transform[0]
            # w_cmd = self.wr + self.vr * (self.ky * err_transform[1] + self.kt * np.sin(err_transform[2]))
            # x_cmd = v_cmd * np.cos(self.yaw)
            # y_cmd = v_cmd * np.sin(self.yaw)
            # z_rot_cmd = w_cmd
            # convert = np.linalg.inv(rot_matrix) @ np.array([x_cmd, y_cmd, z_rot_cmd]).reshape(3,1)

            # limit the velocities
            x_cmd = self.limit_velocity(x_cmd,xlimit)
            y_cmd = self.limit_velocity(y_cmd,ylimit)
            z_rot_cmd = self.limit_velocity(z_rot_cmd,tlimit)

            # self.get_logger().info(str(x_cmd))
            # self.get_logger().info(str(y_cmd))
            # self.get_logger().info(str(z_rot_cmd))

        else:
            x_cmd = 0.0
            y_cmd = 0.0
            z_rot_cmd = 0.0

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
        """
        Callback function for map data in ros node.

        Args:
            msg (OccupancyGrid): Occupancy grid data.
        Returns:
            None
        """

        # # get the data
        self.occ_grid = np.array(msg.data).reshape((msg.info.height, msg.info.width))
        self.occ_grid_origin = np.array((msg.info.origin.position.x, msg.info.origin.position.y))
        self.occ_grid_cpm = 1 / msg.info.resolution
        self.resolution = msg.info.resolution

        if self.path_complete:
            self.path_complete = False
            break_flag = False
            rows,cols = np.shape(self.occ_grid)
            # print(self.occ_grid)
            # self.get_logger().info(str([rows,cols]))
            for row in range(0,rows):
                for col in range(0,cols):
                    check = self.occ_grid[row,col]
                    neighbors = self.check_near([row,col])
                    if check == -1 and 0 in neighbors:
                        counts = 0
                        distance = self.check_distance([self.x,self.y],np.array([row,col])/self.occ_grid_cpm + self.occ_grid_origin)
                        for n in neighbors:
                            if n == 0:
                                counts += 1
                        # distance = self.check_distance([self.x,self.y],np.array([row,col])/self.occ_grid_cpm + self.occ_grid_origin)
                        if all(np.array([row,col]) != self.old_goal) and counts > 2 and distance > 1.2:
                            self.get_logger().info(str(distance))
                            break_flag = True
                            self.goal = np.array([row,col])
                            self.get_logger().info('found one')
                        break
                if break_flag:
                    break
                else:
                    cmd = Twist()
                    cmd.linear.x=0.0
                    cmd.linear.y=0.0
                    cmd.angular.z=0.25
                    self.cmd_vel_publisher_.publish(cmd)

            marker = self.get_marker()
            self.marker_publisher_.publish(marker)

            self.path = np.array(self.find_path())/self.occ_grid_cpm + self.occ_grid_origin

            # z = np.zeros(np.shape(self.path))
            # self.path = np.append(self.path, z,1)

            # self.get_logger().info(str(self.path))

    def find_path(self):
        '''
        finds the path to the goal using the bfs algorithm

        Returns:
            path (list): path to the goal
        '''

        # self.get_logger().info('origin: ' + str(self.occ_grid_origin))

        start = np.rint((np.array([self.y, self.x]) - self.occ_grid_origin) * self.occ_grid_cpm)

        # self.get_logger().info(str(self.check_distance(self.goal,start)))
        
        g = graph_search.GridMap(start, self.goal, -50, 150, self.occ_grid)
        res = graph_search.bfs(g.init_pos, g.transition, g.is_goal, graph_search._ACTIONS)

        self.old_goal = self.goal

        # if len(res[0][0]) < 2:
        cmd = Twist()
        cmd.linear.x=0.0
        cmd.linear.y=0.0
        cmd.angular.z=0.0
        self.cmd_vel_publisher_.publish(cmd)
        # self.get_logger().info(str(res[0][0]))
        g.display_map(res[0][0])

        return res[0][0]
    
    def check_distance(self, pt1, pt2):
        '''
        checks the distance between two points

        Args:
            pt1 (list): point 1
            pt2 (list): point 2

        Returns:
            ans (float): distance between two points
        '''
        ans = np.sqrt((pt1[0]-pt2[0])**2 + (pt1[1]-pt2[1])**2)
        return ans
    
    def check_near(self, coords):
        '''
        checks the neighbors of a cell

        Args:
            coords (list): coordinates of the cell
        
        Returns:
            neighbors (list): list of neighbors
        '''

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
        '''
        Publishes marker array to visualize the path

        Returns:
            None
        '''
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
        '''
        Updates the planner

        Returns:
            None
        '''

        # send command to the drone
        cmd = Twist()
        cmd.linear.x=0.0
        cmd.linear.y=0.0
        cmd.angular.z=1.0
        self.cmd_vel_publisher_.publish(cmd)

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
    
    def range_callback(self, msg: Range):

        if msg.range < 0.2:

            cmd = Twist()
            cmd.linear.x=0.0
            cmd.linear.y=0.05
            cmd.angular.z=0.0
            self.cmd_vel_publisher_.publish(cmd)
            

    def range_callback_right(self, msg: Range):

        if msg.range < 0.2:

            cmd = Twist()
            cmd.linear.x=-0.05
            cmd.linear.y=0.0
            cmd.angular.z=0.0
            self.cmd_vel_publisher_.publish(cmd)
            
    
    def range_callback_left(self, msg: Range):

        if msg.range < 0.2:

            cmd = Twist()
            cmd.linear.x=0.05
            cmd.linear.y=0.0
            cmd.angular.z=0.0
            self.cmd_vel_publisher_.publish(cmd)
            

    def range_callback_back(self, msg: Range):

        if msg.range < 0.2:

            cmd = Twist()
            cmd.linear.x=0.0
            cmd.linear.y=-0.05
            cmd.angular.z=0.0
            self.cmd_vel_publisher_.publish(cmd)
            

def main(args=None):
    rclpy.init(args=args)
    node = CrazyflieControllerNode()
    rclpy.spin(node)
    rclpy.shutdown()
