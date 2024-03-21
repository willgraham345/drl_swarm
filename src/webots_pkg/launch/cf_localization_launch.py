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
    # simple_mapper_node = launch_ros.actions.Node(
    #     package='webots_pkg',
    #     executable='simple_mapper')
    
    foxglove_websocket = IncludeLaunchDescription(
        XMLLaunchDescriptionSource(
            [os.path.join(get_package_share_directory('foxglove_bridge'), 'launch', 'foxglove_bridge_launch.xml')]
        )
    )
    params_file = CONFIG_FILE_PATH

    # TODO: Change this into a cf_publisher launch file
    # TODO: Createa a tb_publisher launch file
    static_publisher_cmds = []
    with open(params_file, 'r') as file:
        config = yaml.safe_load(file)
        for cf in config['robots']['crazyflies']:
            cf_name = cf['name']
            initial_translation = cf['translation']
            print(f"initial_translation: {initial_translation}")
            print(f"First element of translation: f{initial_translation[0]}")
            cf_static_base_link_publisher = launch_ros.actions.Node(
                package = 'tf2_ros',
                executable = 'static_transform_publisher',
                output = 'screen',
                arguments = [str(initial_translation[0]), str(initial_translation[1]), str(initial_translation[2]), '0', '0', '0', 'world', 'cf1/base_link']
            )
            static_publisher_cmds.append(cf_static_base_link_publisher)
        for tb in config['robots']['turtlebots']:
            initial_translation = tb['translation']
            print(f"initial_translation: {initial_translation}")
            print(f"First element of translation: f{initial_translation[0]}")
            tb_static_base_link_publisher = launch_ros.actions.Node(
                package = 'tf2_ros',
                executable = 'static_transform_publisher',
                output = 'screen',
                arguments = [str(initial_translation[0]), str(initial_translation[1]), str(initial_translation[2]), '0', '0', '0', 'world', str(tb['name'])+'/base_link']
            )
            tb_static_lighthouse_publisher = launch_ros.actions.Node(
                package = 'tf2_ros',
                executable = 'static_transform_publisher',
                output = 'screen',
                arguments = [str(0), str(0), str(0), '0', '0', '0', str(tb['name'])+'/base_link', str(tb['name'])+'/lighthouse_pose']
            )
            static_publisher_cmds.append(tb_static_base_link_publisher)
            static_publisher_cmds.append(tb_static_lighthouse_publisher)

    print(f"cf name: {cf_name}")
    crazyflie_node = launch_ros.actions.Node(
        package='webots_pkg',
        executable='cf_publisher',
        namespace=str(cf_name),
        parameters = [
            {
            'fly': False,
            'URI': 'radio://0/80/2M/E7E7E7E7E7',
            'config_file': params_file,
            # lh0 pose frame and lh1 pose frame are left empty, as they are not used in the simulation
            }
        ],
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
    ld.add_action(rviz)

    for cmd in static_publisher_cmds:
        ld.add_action(cmd)

    return ld

if __name__ == '__main__':
    generate_launch_description()