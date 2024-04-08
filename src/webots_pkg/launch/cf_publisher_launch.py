import launch
import launch_ros
import yaml
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
    swarm_config_yaml_arg = DeclareLaunchArgument(
        'swarm_config_yaml',
        default_value=str(CONFIG_FILE_PATH),
        description='Full path to the experiment configuration file to use'
    )
    namespace_arg = DeclareLaunchArgument(
        'namespace',
        default_value='',
        description='Namespace to apply to the nodes'
    )
    lh0_pose_frame_arg = DeclareLaunchArgument(
        'lh0_pose_frame',
        default_value='tb1/lighthouse_pose',
        description='Frame ID for the first lighthouse pose'
    )
    lh1_pose_frame_arg = DeclareLaunchArgument(
        'lh1_pose_frame',
        default_value='tb2/lighthouse_pose',
        description='Frame ID for the second lighthouse pose'
    )
    fly_arg = DeclareLaunchArgument(
        'fly',
        default_value='False',
        description='Whether to start the Crazyflie in flight mode'
    )
    URI_arg = DeclareLaunchArgument(
        'URI',
        default_value='radio://0/80/2M/E7E7E7E7E7',
        description='URI of the Crazyflie'
    )
    declare_cmds = [
        swarm_config_yaml_arg,
        namespace_arg,
        lh0_pose_frame_arg,
        lh1_pose_frame_arg,
        fly_arg,
        URI_arg
    ]
    swarm_config_yaml = LaunchConfiguration('swarm_config_yaml')
    namespace = LaunchConfiguration('namespace')
    lh0_pose_frame = LaunchConfiguration('lh0_pose_frame')
    lh1_pose_frame = LaunchConfiguration('lh1_pose_frame')
    fly = LaunchConfiguration('fly')
    URI = LaunchConfiguration('URI')
    print(f"swarm_config_yaml: {swarm_config_yaml}")
    print(f"namespace: {namespace}")
    # Declare and set launch arguments

    cf_instance_cmds = []
    with open(CONFIG_FILE_PATH, 'r') as file:
        config = yaml.safe_load(file)
        try:
            for cf in config['robots']['crazyflies']:
                cf_name = cf['name']
                initial_translation = cf['translation']
                initial_orientation = cf['orientation']
                print(f"initial_translation: {initial_translation}")
                print(f"First element of translation: f{initial_translation[0]}")
        except:
            print("No crazyflies found in the configuration file. Exiting.")
        try:
            for tb in config['robots']['turtlebots']:
                tb_name = tb['name']
                initial_translation = tb['translation']
                initial_orientation = tb['orientation']
                print(f"initial_translation: {initial_translation}")
                print(f"First element of translation: f{initial_translation[0]}")
        except:
            print("No turtlebots found in the configuration file. Exiting.")

    cf_static_base_link_publisher = launch_ros.actions.Node(
        package = 'tf2_ros',
        executable = 'static_transform_publisher',
        output = 'screen',
        arguments = [
            str(initial_translation[0]),
            str(initial_translation[1]),
            str(initial_translation[2]),
            '0',
            '0',
            '0',
            'map', 'cf1/base_link']
    )
    # tb0_static_base_link_publisher = launch_ros.actions.Node(
    #     package = 'tf2_ros',
    #     executable = 'static_transform_publisher',
    #     output = 'screen',
    #     arguments = [
    #         str(initial_translation[0]),
    #         str(initial_translation[1]),
    #         str(initial_translation[2]),
    #         '0',
    #         '0',
    #         '0',
    #         'map', 'tb1/base_link']
    # )
    # tb0_base_link_to_lh = launch_ros.actions.Node(
    #     package = 'tf2_ros',
    #     executable = 'static_transform_publisher',
    #     output = 'screen',
    #     arguments = [
    #         '3',
    #         '4',
    #         '5',
    #         '0',
    #         '0',
    #         '0',
    #         'tb1/base_link', 'tb1/lighthouse_pose']
    # )
    # tb1_static_base_link_publisher = launch_ros.actions.Node(
    #     package = 'tf2_ros',
    #     executable = 'static_transform_publisher',
    #     output = 'screen',
    #     arguments = [
    #         str(initial_translation[0]),
    #         str(initial_translation[1]),
    #         str(initial_translation[2]),
    #         '0',
    #         '0',
    #         '0',
    #         'map', 'tb2/base_link']
    # )
    # tb1_base_link_to_lh = launch_ros.actions.Node(
    #     package = 'tf2_ros',
    #     executable = 'static_transform_publisher',
    #     output = 'screen',
    #     arguments = [
    #         '0',
    #         '0',
    #         '0',
    #         '0',
    #         '0',
    #         '0',
    #         'tb1/base_link', 'tb1/lighthouse_pose']
    # )
    # transform_cmds = []
    # transform_cmds.append(tb0_static_base_link_publisher)
    # transform_cmds.append(tb0_base_link_to_lh)
    # transform_cmds.append(tb1_static_base_link_publisher)
    # transform_cmds.append(tb1_base_link_to_lh)

    cf_instance_cmds.append(cf_static_base_link_publisher)
    crazyflie_node = launch_ros.actions.Node(
        package='webots_pkg',
        executable='cf_publisher',
        namespace=str(cf_name),
        parameters = [
            {
            'fly': False,
            'URI': 'radio://0/80/2M/E7E7E7E7E7',
            'lh0_pose_frame': 'tb1/lighthouse_pose',
            'lh1_pose_frame': 'tb2/lighthouse_pose',
            'initial_translation': initial_translation,
            'initial_orientation': [0, 0, 0, 1],
            }
        ],
    )
    cf_instance_cmds.append(crazyflie_node)
   

    record_cmds = []
    foxglove_websocket = IncludeLaunchDescription(
        XMLLaunchDescriptionSource(
            [os.path.join(get_package_share_directory('foxglove_bridge'), 'launch', 'foxglove_bridge_launch.xml')]
        )
    )
    record_cmds.append(foxglove_websocket)


    ld = LaunchDescription()
    for declaration in declare_cmds:
        ld.add_action(declaration)
    for record in record_cmds:
        ld.add_action(record)
    for command in cf_instance_cmds:
        ld.add_action(command)
    # for transform in transform_cmds:
    #     ld.add_action(transform)

    return ld

if __name__ == '__main__':
    generate_launch_description()