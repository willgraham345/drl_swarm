#!/usr/bin/env python
# Launch the test locally: python3 -m pytest webots_pkg/test/test_webots_world_launch.py
# Apparently this can work, havent had much luck: colcon test --packages-select webots_pkg --event-handlers console_cohesion+
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

@launch_pytest.fixture
def launch_description():
    # define a launch process
    package_dir = get_package_share_directory('webots_pkg')
    ld = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(package_dir, 'launch', 'webots_world_launch.py')
        ),
        # launch_arguments={}.items(),
    )
    return LaunchDescription([
        ld,
    ])


@pytest.mark.launch_test
def test_case():
    # Wait for the processes to start
    # process_tools.assert_output()