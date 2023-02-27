# Launch files are abnormal python files
from launch import LaunchDescription
import os
from ament_index_python.packages import get_package_share_directory
from webots_ros2_driver.webots_launcher import Ros2SupervisorLauncher
from webots_ros2_driver.webots_launcher import WebotsLauncher

from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource

def generate_launch_description(): 
    ld = LaunchDescription()

    # This the Webots supervisor that lets ROS2 have complete perception of everything
    ros2_supervisor = Ros2SupervisorLauncher()
    # package_dir represents the source directory for the weobts file. 
    package_dir = get_package_share_directory('crazyflie_ros2_simulation')


    webots = WebotsLauncher(
        world=os.path.join(package_dir, 'worlds', 'crazyflie_apartment.wbt')
    )

    # Define simulation node so we can launch webots from here
    cfsim_dir = get_package_share_directory('crazyflie_ros2_simulation')

    simulation_node = IncludeLaunchDescription(
            PythonLaunchDescriptionSource(
                os.path.join(cfsim_dir, 'launch', 'robot_launch.py')
            )
        )
    bringup_dir = get_package_share_directory('nav2_bringup')

    ld.add_action(simulation_node)
    return ld