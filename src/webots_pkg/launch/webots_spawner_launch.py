#!/usr/bin/env python
# Launch the test locally: launch_test src/webots_pkg/test/test_webots_world_launch.py
import os
import rclpy
import pathlib
import launch
from launch import LaunchDescription
import launch.actions
import launch_testing
import launch_testing.actions
from launch_ros.actions import Node

from ament_index_python.packages import get_package_share_directory
from launch.substitutions.path_join_substitution import PathJoinSubstitution
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.actions import IncludeLaunchDescription

from webots_ros2_driver.webots_launcher import WebotsLauncher, Ros2SupervisorLauncher
from webots_ros2_driver.urdf_spawner import URDFSpawner, get_webots_driver_node


def generate_launch_description():
    package_dir = get_package_share_directory('webots_pkg')
    urdf_path_cf = os.path.join(package_dir, 'resource', 'crazyflie.urdf')
    urdf_path_tb = os.path.join(package_dir, 'resource', 'turtlebot.urdf')


    robot_description_cf = pathlib.Path(urdf_path_cf).read_text()
    robot_description_tb = pathlib.Path(urdf_path_tb).read_text()

    spawn_URDF_cf = URDFSpawner(
        name = "cf1",
        urdf_path = urdf_path_cf,
        translation = '0 0 .015',
        rotation = '0 0 0 1',
    )

    driver_cf = Node(
        package = 'webots_ros2_driver',
        executable = 'driver',
        output = 'screen',
        additional_env = {'WEBOTS_ROBOT_NAME': 'cf1'},
        parameters = [{
            'use_sim_time': True,
            'robot_description': robot_description_cf,
        }],
    )
    
    webots_simulation = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(package_dir, 'launch', 'webots_world_launch.py')
        )
    )


    return LaunchDescription([
        # webots_simulation, # This is the webots world launch
        spawn_URDF_cf,
        launch.actions.RegisterEventHandler(
            event_handler = launch.event_handlers.OnProcessIO(
                target_action = spawn_URDF_cf,
                on_stdout=lambda event: get_webots_driver_node(event, driver_cf),
            )
        ),

        launch.actions.RegisterEventHandler(
            event_handler=launch.event_handlers.OnProcessExit(
                target_action=driver_cf,
                on_exit=[launch.actions.EmitEvent(event=launch.events.Shutdown())],
            )
        ),
    ])  