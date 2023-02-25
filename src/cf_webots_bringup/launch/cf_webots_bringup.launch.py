# Launch files are abnormal python files
from launch import LaunchDescription
import os
from ament_index_python.packages import get_package_share_directory
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource

def generate_launch_description(): 
    ld = LaunchDescription()

    # Define simulation node so we can launch webots from here
    pkg_share = get_package_share_directory('crazyflie_ros2_simulation')

    simulation_node = IncludeLaunchDescription(
            PythonLaunchDescriptionSource(
                os.path.join(pkg_share, 'launch', 'robot_launch.py')
            )
        )
    
    ld.add_action(simulation_node)
    return ld