import launch
import launch_ros
import os

from launch import LaunchDescription
from ament_index_python.packages import get_package_share_directory
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import Command, LaunchConfiguration
from launch.actions import DeclareLaunchArgument



def generate_launch_description():
    # pkg_share = get_package_share_directory('crazyflie_ros2_simple_mapper')


    # simple_mapper_node = launch_ros.actions.Node(
    #     package='webots_pkg',
    #     executable='simple_mapper')


    crazyflie_node = launch_ros.actions.Node(
        package='webots_pkg',
        executable='cf_publisher',
        parameters = [
            {'fly': False,
             'uri': 'radio://0/80/2M/E7E7E7E7E7',}
        ],
        )


    ld = LaunchDescription()
    ld.add_action(crazyflie_node)
    # ld.add_action(simple_mapper_node)

    return ld