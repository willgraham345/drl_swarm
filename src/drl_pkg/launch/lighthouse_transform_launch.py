import os

import launch_ros
import yaml
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription 
from launch.actions import IncludeLaunchDescription
from launch.substitutions import LaunchConfiguration
from launch_xml.launch_description_sources import XMLLaunchDescriptionSource


def generate_launch_description():
    

    transform_cmds = []
    launch_argument = LaunchConfiguration('launch_argument')
    """
    package_dir = get_package_share_directory('drl_pkg')
    config_file_path = os.path.abspath(os.path.join(package_dir, 'config', 'experiment_config.yaml'))
    starting_translations = []
    starting_orientations = []
    with open(config_file_path, 'r') as file:
        config = yaml.safe_load(file)
        try:
            for tb in config['robots']['turtlebots']:
                tb_name = tb['name']
                initial_translation = tb['translation']
                initial_orientation = tb['orientation']
                starting_translations.append(initial_translation)
                starting_orientations.append(initial_orientation)
        except:
            print("No turtlebots found in the configuration file. Exiting.")

    tb0_static_base_link_publisher = launch_ros.actions.Node(
        package = 'tf2_ros',
        executable = 'static_transform_publisher',
        output = 'screen',
        arguments = [
            str(starting_translations[0][0]),
            str(starting_translations[0][1]),
            str(starting_translations[0][2]),
            str(starting_orientations[0][0]),
            str(starting_orientations[0][1]),
            str(starting_orientations[0][2]),
            'map', 'tb1/base_link']
    )
    tb1_static_base_link_publisher = launch_ros.actions.Node(
        package = 'tf2_ros',
        executable = 'static_transform_publisher',
        output = 'screen',
        arguments = [
            str(starting_translations[1][0]),
            str(starting_translations[1][1]),
            str(starting_translations[1][2]),
            str(starting_orientations[0][0]),
            str(starting_orientations[0][1]),
            str(starting_orientations[0][2]),
            'map', 'tb2/base_link']
    )
    tb0_base_link_to_lh = launch_ros.actions.Node(
        package = 'tf2_ros',
        executable = 'static_transform_publisher',
        output = 'screen',
        arguments = [
            '0',
            '0',
            '0',
            '0',
            '-1.57',
            '3.14',
            'tb1/base_link', 'tb1/lighthouse_pose']
    )
    tb1_base_link_to_lh = launch_ros.actions.Node(
        package = 'tf2_ros',
        executable = 'static_transform_publisher',
        output = 'screen',
        arguments = [
            '0',
            '0',
            '0',
            '0',
            '-1.57',
            '3.14',
            'tb2/base_link', 'tb2/lighthouse_pose']
    )
    transform_cmds = []
    transform_cmds.append(tb0_static_base_link_publisher)
    transform_cmds.append(tb0_base_link_to_lh)
    transform_cmds.append(tb1_static_base_link_publisher)
    transform_cmds.append(tb1_base_link_to_lh)
    """

    foxglove_websocket = IncludeLaunchDescription(
        XMLLaunchDescriptionSource(
            [os.path.join(get_package_share_directory('foxglove_bridge'),
            'launch',
            'foxglove_bridge_launch.xml')]
        )
    )

    ld = LaunchDescription()
    for transform in transform_cmds:
        ld.add_action(transform)
    ld.add_action(foxglove_websocket)

    return ld
