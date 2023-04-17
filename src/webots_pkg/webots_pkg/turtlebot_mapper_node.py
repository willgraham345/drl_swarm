#!/usr/bin/env python3

import rclpy
from rclpy.node import Node
from sensor_msgs.msg import LaserScan
from nav_msgs.msg import OccupancyGrid, MapMetaData
import numpy as np
import math
import logging


class MapMaker(Node):

    def __init__(self):
        super().__init__('map_maker')
        self.tb1_scan_sub = self.create_subscription(LaserScan, '/tb1/LDS_01', self.tb1_scan_callback, 10)
        self.tb2_scan_sub = self.create_subscription(LaserScan, '/tb2/LDS_01', self.tb2_scan_callback, 10)
        self.map_pub = self.create_publisher(OccupancyGrid, '/map', 10)
        self.tb1_scan = None
        self.tb2_scan = None
        self.resolution = 0.05  # in meters
        self.width = 500  # in cells
        self.height = 500  # in cells

        #Logger
        self.logger = logging.getLogger('MapMaker')
        self.logger.setLevel(logging.INFO)
        formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
        stream_handler = logging.StreamHandler()
        stream_handler.setLevel(logging.INFO)
        stream_handler.setFormatter(formatter)
        self.logger.addHandler(stream_handler)

    def tb1_scan_callback(self, scan):
        self.tb1_scan = scan

    def tb2_scan_callback(self, scan):
        self.tb2_scan = scan

    def create_map(self):
        #elf.logger.info('Generating map.')
        if self.tb1_scan is not None and self.tb2_scan is not None:
            tb1_angles = np.arange(self.tb1_scan.angle_min, self.tb1_scan.angle_max, self.tb1_scan.angle_increment)
            tb2_angles = np.arange(self.tb2_scan.angle_min, self.tb2_scan.angle_max, self.tb2_scan.angle_increment)
            tb1_data = np.array(self.tb1_scan.ranges)
            tb2_data = np.array(self.tb2_scan.ranges)
            tb1_data[tb1_data > 5.0] = 5.0  # cap the maximum range
            tb2_data[tb2_data > 5.0] = 5.0  # cap the maximum range
            tb1_x = np.multiply(np.cos(tb1_angles), tb1_data)  # convert to x-coordinate
            tb1_y = np.multiply(np.sin(tb1_angles), tb1_data)  # convert to y-coordinate
            tb2_x = np.multiply(np.cos(tb2_angles), tb2_data)  # convert to x-coordinate
            tb2_y = np.multiply(np.sin(tb2_angles), tb2_data)  # convert to y-coordinate
            map_data = np.zeros((self.height, self.width), dtype=np.int8)
            for i in range(len(tb1_x)):
                x = int(round((tb1_x[i] + 12.5) / self.resolution))
                y = int(round((tb1_y[i] + 12.5) / self.resolution))
                if x >= 0 and x < self.width and y >= 0 and y < self.height:
                    map_data[y][x] = 100  # mark as occupied
            for i in range(len(tb2_x)):
                x = int(round((tb2_x[i] + 12.5) / self.resolution))
                y = int(round((tb2_y[i] + 12.5) / self.resolution))
                if x >= 0 and x < self.width and y >= 0 and y < self.height:
                    map_data[y][x] = 100  # mark as occupied
            map_msg = OccupancyGrid()
            map_msg.header.frame_id = "map"
            map_msg.info.resolution = self.resolution
            map_msg.info.width = self.width
            map_msg.info.height = self.height
            map_msg.info.origin.position.x = -12.5
            map_msg.info.origin.position.y = -12.5
            map_msg.info.origin.position.z = 0.0
            map_msg.data = map_data.flatten().tolist()
            self.map_pub.publish(map_msg)

    def run(self):
        while rclpy.ok():
            self.create_map()
            rclpy.spin_once(self)

def main(args=None):
    rclpy.init(args=args)
    node = MapMaker()
    node.run()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
