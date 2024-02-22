import launch
import launch_ros
import os
import yaml
from launch import LaunchDescription

from launch_xml.launch_description_sources import XMLLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory
from launch.actions import IncludeLaunchDescription, ExecuteProcess
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import Command, LaunchConfiguration
from launch.actions import DeclareLaunchArgument


PACKAGE_DIR = get_package_share_directory('webots_pkg')
CONFIG_FILE_PATH = (os.path.join(PACKAGE_DIR, 'config', 'experiment_config.yaml'))

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
    params_file = CONFIG_FILE_PATH
    print(f'params_file: {params_file}')


    crazyflie_node = launch_ros.actions.Node(
        package='webots_pkg',
        executable='cf_publisher',
        parameters = [
            {'fly': True,
             'URI': 'radio://0/80/2M/E7E7E7E7E7',
             'config_file': CONFIG_FILE_PATH,
            }
        ],
        )

    with open(params_file, 'r') as file:
        config = yaml.safe_load(file)
        for cf in config['robots']['crazyflies']:
            if cf['name'] == 'cf1':
                initial_translation = [float(x) for x in cf['translation']]

    static_tf_publisher = launch_ros.actions.Node(
        package = 'tf2_ros',
        executable = 'static_transform_publisher',
        output = 'screen',
        arguments = [str(initial_translation[0]), str(initial_translation[1]), str(initial_translation[2]), '0', '0', '0', 'world', 'odom']
    )

    teleop_twist_node = ExecuteProcess(
        cmd=['gnome-terminal', '--', 'ros2', 'run', 'teleop_twist_keyboard', 'teleop_twist_keyboard'],
        output='screen'
    )

    ld = LaunchDescription()
    ld.add_action(crazyflie_node)
    ld.add_action(foxglove_websocket)
    ld.add_action(static_tf_publisher)
    ld.add_action(teleop_twist_node)

    return ld


if __name__ == 'main':
    generate_launch_description()