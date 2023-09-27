#!/usr/bin/env python
# Launch the test locally: pytthon3 -m pytest src/test/launch_pytest




import os
import rclpy
from launch import LaunchDescription
import launch.actions
import launch_testing
import launch_testing.actions
from ament_index_python.packages import get_package_share_directory
from launch.substitutions.path_join_substitution import PathJoinSubstitution
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.actions import IncludeLaunchDescription

from webots_ros2_driver.webots_launcher import WebotsLauncher, Ros2SupervisorLauncher
from webots_ros2_driver.urdf_spawner import URDFSpawner, get_webots_driver_node

import pytest
@pytest.mark.rostest
def generate_test_description():
    package_dir = get_package_share_directory('webots_pkg')


    webots_world = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(package_dir, 'launch', 'webots_world_launch.py')
        ),
        launch_arguments={}.items(),
    )

    webots_world = WebotsLauncher(
        world = PathJoinSubstitution([package_dir, 'worlds', 'apartment.wbt']),
    )
    
    ros2_supervisor = Ros2SupervisorLauncher()

    return LaunchDescription([
        webots_world,
        launch_testing,
        launch_testing.actions.ReadyToTest(),
    ])

class TestWebotsWorld(TestWebots):
    @classmethod
    def setUpClass(cls):
        rclpy.init()
    
    @classmethod
    def tearDownClass(cls):
        rclpy.shutdown()

    def setUp(self):
        self.__node = rclpy.create_node('webots_world_tester')
        self.wait_for_clock(self.__node, messages_to_receive=100)

    def testSpawningSwarm(self):
        package_dir = get_package_share_directory('webots_pkg')
        urdf_path_cf = os.path.join(package_dir, 'resource', 'crazyflie.urdf')
        urdf_path_tb = os.path.join(package_dir, 'resource', 'turtlebot.urdf')

        spawn_URDF_cf = URDFSpawner(
            name = "cf1",
            urdf = urdf_path_cf,
            translation = '0 0 1',
            rotation = '0 0 1 0',
        )