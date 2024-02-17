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
import launch
import logging
import yaml
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.substitutions import LaunchConfiguration
from launch.actions import DeclareLaunchArgument, LogInfo, IncludeLaunchDescription 
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch_xml.launch_description_sources import XMLLaunchDescriptionSource

from webots_ros2_driver.webots_launcher import WebotsLauncher
from webots_ros2_driver.webots_controller import WebotsController
from webots_ros2_driver.webots_launcher import Ros2SupervisorLauncher
from launch_ros.actions import Node
from webots_ros2_driver.utils import controller_url_prefix
from webots_ros2_driver.webots_launcher import WebotsLauncher
from webots_ros2_driver.webots_controller import WebotsController
from launch.substitutions.path_join_substitution import PathJoinSubstitution

DIR_PATH = os.path.dirname(__file__)


def generate_launch_description():
    """
    Launches the webots world and the ros2 supervisor
    """
    pkg_share = get_package_share_directory('webots_pkg')
    bringup_dir = get_package_share_directory('nav2_bringup')
    launch_dir = os.path.join(bringup_dir, 'launch')

    bringup_cmd = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(launch_dir, 'bringup_launch.py')
        ),
        launch_arguments = {
            "slam": "True",
            "use_sim_time": "True",
            "params_file": os.path.join(pkg_share, 'params', 'sim_nav2_params.yaml'),
            "autostart": "true",
        },
    )
    # Declare launch arguments for substitution
    rviz_cmd = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(pkg_share, 'launch', 'rviz_launch.py')
        ),
        launch_arguments = {
            'rviz_config': os.path.join(bringup_dir, 'rviz', 'nav2_default_view.rviz')}.items()
    )
    world_launch_description = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(pkg_share, 'launch', 'webots_world_launch.py')
        ),
    )
    ld = LaunchDescription()
    ld.add_action(bringup_cmd)
    ld.add_action(world_launch_description)
    ld.add_action(rviz_cmd)

