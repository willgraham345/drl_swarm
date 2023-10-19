#!/usr/bin/env python
import os
import pathlib
from ament_index_python.packages import get_package_share_directory
import launch
from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
from launch.substitutions.path_join_substitution import PathJoinSubstitution
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch_ros.actions import Node
from launch.actions import IncludeLaunchDescription
from webots_ros2_driver.urdf_spawner import URDFSpawner, get_webots_driver_node


def generate_launch_description():
    package_dir = get_package_share_directory('webots_pkg')

    # Include webots_world_launch.py

    # TODO: Test if this thing works, and if I can get the supervisor from the launch file this way
    IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            PathJoinSubstitution([package_dir, 'launch', 'webots_world_launch.py']),
        ),
        launch_arguments={
            'world': 'apartment.wbt'
        }.items(),
    )


    # TODO: Test if I can ge the supervisor to launch the robot urdfs and drivers 
    urdf_path_cf = os.path.join(package_dir, 'resource', 'crazyflie.urdf')
    urdf_path_tb = os.path.join(package_dir, 'resource', 'turtlebot.urdf')


    robot_description_cf = pathlib.Path(urdf_path_cf).read_text()
    robot_description_tb = pathlib.Path(urdf_path_tb).read_text()

    spawn_URDF_cf = URDFSpawner(
        name = "cf1",
        urdf_path = urdf_path_cf,
        translation = '-1 -1 .015',
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
    ####### Old stuff, no longer needed #######
    # world = LaunchConfiguration('apartment.wbt')
    # webots = WebotsLauncher(
    #     world=PathJoinSubstitution([package_dir, 'worlds', world]),
    #     ros2_supervisor=True,
    # )


    return LaunchDescription([
        DeclareLaunchArgument(
            'apartment.wbt',
            default_value='apartment.wbt',
            description = 'Choose world file name from worlds folder'
        ),

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