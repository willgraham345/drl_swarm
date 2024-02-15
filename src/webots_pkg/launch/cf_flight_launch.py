import launch
import launch_ros
import os

from launch import LaunchDescription

from launch_xml.launch_description_sources import XMLLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import Command, LaunchConfiguration
from launch.actions import DeclareLaunchArgument


PACKAGE_DIR = get_package_share_directory('webots_pkg')
CONFIG_FILE_PATH = os.path.abspath(os.path.join(PACKAGE_DIR, 'config', 'experiment_config.yaml'))

def generate_launch_description():
    # pkg_share = get_package_share_directory('crazyflie_ros2_simple_mapper')


    # simple_mapper_node = launch_ros.actions.Node(
    #     package='webots_pkg',
    #     executable='simple_mapper')
    foxglove_websocket = IncludeLaunchDescription(
        XMLLaunchDescriptionSource(
            [os.path.join(get_package_share_directory('foxglove_bridge'), 'launch', 'foxglove_bridge_launch.xml')]
        )
    )
    # params_file = CONFIG_FILE_PATH
    # print(f'params_file: {params_file}')
    CONFIG_FILE_NAME = CONFIG_FILE_PATH


    crazyflie_node = launch_ros.actions.Node(
        package='webots_pkg',
        executable='cf_publisher',
        parameters = [
            {'fly': False,
             'URI': 'radio://0/80/2M/E7E7E7E7E7',
             'config_file': CONFIG_FILE_NAME,
            }
        ],
        )

    teleop_twist_node = launch_ros.actions.Node(
        package='teleop_twist_keyboard',
        node_executable="teleop_twist_keyboard",
        output='screen',
        prefix = 'xterm -e',
        node_name='teleop',
        )

    ld = LaunchDescription()
    ld.add_action(crazyflie_node)
    ld.add_action(foxglove_websocket)
    ld.add_action(teleop_twist_node)

    return ld


if __name__ == 'main':
    generate_launch_description()