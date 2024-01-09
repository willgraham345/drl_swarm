#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  


"""
This file is used to test the viability of webots_world_launch.py. 

Author: Will Graham
"""

import os
import pytest
import launch
from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription, TimerAction
import launch_pytest
import launch_testing
from launch_pytest.tools import process as process_tools
from ament_index_python.packages import get_package_share_directory
from webots_ros2_driver.webots_launcher import Ros2SupervisorLauncher,WebotsLauncher
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import PathJoinSubstitution

def test_webots_world_launch():
    # Wait for the processes to start
    # process_tools.assert_output()
    package_dir = get_package_share_directory('webots_pkg')

    world_node = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            PathJoinSubstitution([package_dir, 'launch', 'webots_world_launch.py']),
        ),
        launch_arguments={
            'world': 'apartment.wbt'
        }.items(),
    )
    assert world_node.__condition_context__.is_active()