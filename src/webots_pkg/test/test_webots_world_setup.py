#!/usr/bin/env python
"""Test the `webots_ros2_turtlebot` package."""

# Launch the test locally: launch_test src/webots_ros2/webots_ros2_tests/test/test_webots_world_setup.py

import os
import pytest
import rclpy
from geometry_msgs.msg import PointStamped, Twist
from sensor_msgs.msg import LaserScan
from launch import LaunchDescription
import launch_testing.actions
from ament_index_python.packages import get_package_share_directory
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.actions import IncludeLaunchDescription
from webots_ros2_tests.utils import TestWebots, initialize_webots_test


'''
TODO:
Build a new launch file
See if I can pass the swarm object as a parameter to the launch file (rewrite)

'''

@pytest.mark.rostest
def generate_test_description():
    initialize_webots_test()

    turtlebot_webots = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(get_package_share_directory('webots_pkg'), 'launch', 'nav2_launch.py')
        )
    )

    return LaunchDescription([
        turtlebot_webots,
        launch_testing.actions.ReadyToTest(),
    ])


class TestCrazyflie(TestWebots):
    @classmethod
    def setUpClass(cls):
        rclpy.init()

    @classmethod
    def tearDownClass(cls):
        rclpy.shutdown()

    def setUp(self):
        self.__node = rclpy.create_node('crazyflie_driver_tester')
        self.wait_for_clock(self.__node, messages_to_receive=20)

    def testMovement(self):
        publisher = self.__node.create_publisher(Twist, '/cmd_vel', 1)

        def on_position_message_received(message):
            twist_message = Twist()
            twist_message.linear.x = 0.1
            publisher.publish(twist_message)

            return message.point.x > 6.7

        self.wait_for_messages(self.__node, PointStamped, '/TurtleBot3Burger/gps', condition=on_position_message_received)

    def testLidar(self):
        def on_message_received(message):
            # There should be some unreachable points and some above 0.1m
            number_of_infinities = 0
            number_of_reachables = 0
            for value in message.ranges:
                if value == float('inf'):
                    number_of_infinities += 1
                elif value > 0.1:
                    number_of_reachables += 1
            return number_of_infinities > 0 and number_of_reachables > 0

        self.wait_for_messages(self.__node, LaserScan, '/scan', condition=on_message_received)

    def tearDown(self):
        self.__node.destroy_node()