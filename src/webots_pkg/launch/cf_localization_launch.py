import launch_ros
import yaml
import os
from launch import LaunchDescription
from launch_xml.launch_description_sources import XMLLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory
from launch.actions import IncludeLaunchDescription


# MACROS used in generating the launch description
PACKAGE_DIR = get_package_share_directory('webots_pkg')
CONFIG_FILE_PATH = os.path.abspath(os.path.join(PACKAGE_DIR, 'config', 'experiment_config.yaml'))

def generate_launch_description():
    """
    Creates a launch description for testing the cf_publisher node with fly set to False. Can be used to test the localization of a local Crazyflie.

    Usage:
        ros2 launch webots_pkg cf_localization_launch.py > output.log
        ros2 launch webots_pkg cf_localization_launch.py
    Returns:
        A LaunchDescription object containing the actions to be executed.
    """
    
    foxglove_websocket = IncludeLaunchDescription(
        XMLLaunchDescriptionSource(
            [os.path.join(get_package_share_directory('foxglove_bridge'), 'launch', 'foxglove_bridge_launch.xml')]
        )
    )
    params_file = CONFIG_FILE_PATH


    crazyflie_node = launch_ros.actions.Node(
        package='webots_pkg',
        executable='cf_publisher',
        parameters = [
            {
            'fly': False,
            'URI': 'radio://0/80/2M/E7E7E7E7E7',
            'config_file': params_file,
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

    # Launch rviz2 
    rviz = launch_ros.actions.Node(
        package='rviz2',
        executable='rviz2',
        output='screen',
    )


    ld = LaunchDescription()
    ld.add_action(crazyflie_node)
    ld.add_action(foxglove_websocket)
    ld.add_action(static_tf_publisher)
    ld.add_action(rviz)

    return ld

if __name__ == '__main__':
    generate_launch_description()