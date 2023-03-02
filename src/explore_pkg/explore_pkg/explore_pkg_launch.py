# Launch files are abnormal python files
from launch import LaunchDescription
import os
import sys
import importlib.util
from ament_index_python.packages import get_package_share_directory
from webots_ros2_driver.webots_launcher import Ros2SupervisorLauncher
from webots_ros2_driver.webots_launcher import WebotsLauncher
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource


# Weird crap we have to do to make swarm_classes import properly
file_path  = os.path.dirname(__file__)
sys.path.insert(0, os.path.join(os.path.dirname(__file__))) 
from swarm_classes import *


"""
Notes/TODO:
- Not sure if we should use flying_height. We could use a collision checker but that might be lesslightweight
- Not sure how the turtlebots communicate via wifi/internet. That needs work.
"""



cf1 = {
    'radio_address': "0xE7E7E7E7E7", 
    'start_position': [0, 0, 0.5],
    'name': "cf1",
    'flying_height': 1.0,
}

cf2 = {
    'radio_address': "0xE7E7E7E7E8", 
    'start_position': [1, 1, 0.5],
    'name': "cf2",
    'flying_height': 1.5,

}

tb1 = {
    'start_position': [0, 0, 0.5],
    'ROS2_address': 'ROS_Master_address',
}
swarm = [[cf1, cf2], 
        [tb1]]


def generate_launch_description(): 
    ld = LaunchDescription()
    return ld