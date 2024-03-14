import launch
import launch_ros
import yaml
import os

from launch import LaunchDescription

from launch_xml.launch_description_sources import XMLLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory
from launch.actions import IncludeLaunchDescription, ExecuteProcess
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import Command, LaunchConfiguration
from launch.actions import DeclareLaunchArgument


PACKAGE_DIR = get_package_share_directory('webots_pkg')
CONFIG_FILE_PATH = os.path.abspath(os.path.join(PACKAGE_DIR, 'config', 'experiment_config.yaml'))

def generate_launch_description():
    # * Include launch description from  mocap_vicon_driver
    mocap_pkg_dir = get_package_share_directory('mocap_vicon_driver')

    vicon_driver_launch = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(mocap_pkg_dir, 'launch', 'mocap_vicon_driver_launch.py')
        )
    )
    
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

    # * Set lifecycle node to start
    start_vicon_publishing = ExecuteProcess(
        cmd = ['ros2', 'lifecycle', 'set', '/mocap_vicon_driver_node', 'activate'],
    )

    record_all_nodes = ExecuteProcess(
        cmd = ['ros2', 'bag', 'record', '-a', '--output',
               '/home/will/drl_swarm/data_analysis/rotation_matrix_testing/flipped_sensor_pos_config/90_pitch_90_yaw/rosbag'],
    )

    ld = LaunchDescription()
    ld.add_action(vicon_driver_launch)
    ld.add_action(crazyflie_node)
    ld.add_action(foxglove_websocket)
    ld.add_action(static_tf_publisher)
    ld.add_action(rviz)
    ld.add_action(start_vicon_publishing)
    ld.add_action(record_all_nodes)

    return ld

if __name__ == '__main__':
    generate_launch_description()