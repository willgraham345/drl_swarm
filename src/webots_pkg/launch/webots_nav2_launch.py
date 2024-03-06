#!/usr/bin/env python3
#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  


"""
This file launches a single instance of a webots_world file specified in the launch configuration

Usage: ros2 launch webots_pkg webots_world_launch.py world:=<world_name>

Author: Will Graham
"""


import os
import sys
import pathlib
import logging
import yaml
from launch import LaunchDescription
import launch
from launch.actions import (
    DeclareLaunchArgument,
    LogInfo,
    ExecuteProcess,
    GroupAction,
    IncludeLaunchDescription,
    LogInfo,
)
from launch.substitutions import LaunchConfiguration, TextSubstitution
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch_xml.launch_description_sources import XMLLaunchDescriptionSource

from ament_index_python.packages import get_package_share_directory
from webots_ros2_driver.webots_launcher import WebotsLauncher
from webots_ros2_driver.webots_controller import WebotsController
from webots_ros2_driver.webots_launcher import Ros2SupervisorLauncher
from launch_ros.actions import Node
from webots_ros2_driver.utils import controller_url_prefix
from webots_ros2_driver.webots_launcher import WebotsLauncher
from webots_ros2_driver.webots_controller import WebotsController
from launch.substitutions.path_join_substitution import PathJoinSubstitution

from nav2_common.launch import ParseMultiRobotPose

DIR_PATH = os.path.dirname(__file__)

WORLD_FILES = 'apartment.wbt'

PACKAGE_DIR = get_package_share_directory('webots_pkg')
ROBOT_CONFIG_FILE_PATH = os.path.abspath(os.path.join(PACKAGE_DIR, 'config', 'webots_config.yaml'))

def generate_launch_description():
    """
    launch multiple robots within webots from the given launch arguments

    Args:
        robot: dict of robot name, x, y, yaw, and controller

    Returns:
        LaunchDescription: The launch description for the webots world
    """
    ########## ! Simulation and foxglove arguments from webots_world_launch.py ########## 
    world = LaunchConfiguration('world')
    webots = WebotsLauncher(
        world=PathJoinSubstitution([PACKAGE_DIR, 'worlds', 'configured_worlds', world]),
        ros2_supervisor=True
    )
    
    foxglove_websocket = IncludeLaunchDescription(
        XMLLaunchDescriptionSource(
            [os.path.join(get_package_share_directory('foxglove_bridge'), 'launch', 'foxglove_bridge_launch.xml')]
        )
    )
    launch_handler = launch.actions.RegisterEventHandler(
        event_handler=launch.event_handlers.OnProcessStart(
            target_action=webots,
            on_start=[
                LogInfo(msg='Webots sim has started, spawning can now be performed!')
            ]
        )
    )
    event_handler = launch.actions.RegisterEventHandler(
        event_handler=launch.event_handlers.OnProcessExit(
            target_action=webots,
            on_exit=[launch.actions.EmitEvent(event=launch.events.Shutdown())],
        )
    )
    print("Starting rviz configuration")
    ########## ! End of Simulation and foxglove arguments from webots_world_launch.py ##########
    

    ########## ! Start of nav2  ##########
    # Get nav2 bringup directory and launch directory
    bringup_dir = get_package_share_directory('nav2_bringup')
    nav2_launch_dir = os.path.join(bringup_dir, 'launch')
    print(); print();
    print("Starting nav2 launch")
    print(); print();
    
    # TODO: Debug rviz launch after the nav2 launch is up and running
    rviz_cmd= IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(bringup_dir, 'launch', 'rviz_launch.py')),
        launch_arguments={
            'rviz_config': os.path.join(bringup_dir, 'rviz', 'nav2_default_view.rviz')
            }.items()
    )
    # TODO: Add launch arguments for nav2
    # * params_file: Full path to the ROS2 parameters file to use for all launched nodes
    # * map: Full path to the map file to be used for localization and planning
    params_file = LaunchConfiguration('params_file')
    rviz_config_file = LaunchConfiguration('rviz_config')

    declare_params_file_cmd= DeclareLaunchArgument(
        'params_file',
        default_value=os.path.join(bringup_dir, 'params', 'nav2_params.yaml'), # ! Wrong, but included for now
        description = 'Full path to the ROS2 parameters file to use for all launched nodes',
    )

    # TODO: Figure out how the ParseMultiRobotPose class works
    robots_list = ParseMultiRobotPose('robots').value() #? No idea how this works yet
    # TODO: Modify simulation configuration to match ParseMultiRobotPose class
    bringup_cmd_group = []
    
    print(); print();
    print(f'robots_list: {robots_list}')
    print(); print();
    

    for robot_name in robots_list:
        init_pose = robots_list[robot_name]
        # TODO: Fix this include launch description
        IncludeLaunchDescription(
            PythonLaunchDescriptionSource(os.path.join(nav2_launch_dir, 'bringup_launch.py')),
            # TODO: launch arguements for nav2
            launch_arguments={
                'use_sim_time': 'True',
                'autostart': 'True',
                'params_file': params_file,
                'map': LaunchConfiguration('map'),
                'namespace': robot_name,
                'use_namespace': 'True',
                'initial_pose_x': TextSubstitution(text=str(init_pose[0])),
                'initial_pose_y': TextSubstitution(text=str(init_pose[1])),
                'initial_pose_yaw': TextSubstitution(text=str(init_pose[2])),
                'robot_name': TextSubstitution(text=robot_name),
                }.items()
        )

   
    # TODO: bringup_cmd_group initialization (see the multi robot launch file)
    ld = LaunchDescription([
        DeclareLaunchArgument(
            'world',
            default_value='apartment.wbt',
            description='The world file name to be launched, from within the worlds folder'
        ),
        webots,
        webots._supervisor,
        foxglove_websocket,
        rviz_cmd,
        launch_handler,
        event_handler,

    ])
    for cmd in bringup_cmd_group:
        ld.add_action(cmd)

    return ld