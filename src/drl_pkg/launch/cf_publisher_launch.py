import launch_ros
import yaml
import os

from launch import LaunchDescription

from launch_xml.launch_description_sources import XMLLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory
from launch.actions import IncludeLaunchDescription
from launch.substitutions import LaunchConfiguration
from launch.actions import DeclareLaunchArgument



def generate_launch_description():
    """
    A verbose example of launching the cf_publisher node with a variety of launch parameters
    set. Additionally, this will publish a static transform between the world and the base_link
    of the crazyflie. This also reads in starting position from the experiment configuration file
    and sets the initial position of the crazyflie to that value. This is useful for testing the
    localization of a crazyflie in use with two lighthouse basestations.

    Usage:
        >>> ros2 launch drl_pkg cf_publisher_launch.py`
        >>> ros2 run drl_pkg cf_publisher --ros-args --fly:=True`
        >>> ros2 run drl_pkg cf_publisher --ros-args --URI:=radio://0/90/2M/E7E7E7E7E8`

    Args:
        :obj:`swarm_config_yaml_arg` (:obj:`str`): The path to the experiment configuration file.
        Default is 'config/experiment_config.yaml'.
        :obj:`namespace_arg` (:obj:`str`): The namespace to apply to the nodes. Default is ''.
        :obj:`lh0_pose_frame_arg` (:obj:`str`): The frame ID for the first lighthouse pose. Default
        is 'tb1/lighthouse_pose'.
        :obj:`lh1_pose_frame_arg` (:obj:`str`): The frame ID for the second lighthouse pose.
        Default is 'tb2/lighthouse_pose'.
        :obj:`fly_arg` (:obj:`str`): Whether to start the Crazyflie in flight mode.
        Default is 'False'.
        :obj:`URI_arg` (:obj:`str`): The URI of the Crazyflie. Default is
        'radio://0/80/2M/E7E7E7E7E7'.

    Returns:
        ld (LaunchDescription): The launch description object, invoked by the Usage. 
    """
    pkg_dir = get_package_share_directory('drl_pkg')

    # * Define launch arguments and parameters
    default_swarm_config_file_path = os.path.abspath(os.path.join(
        pkg_dir,
        'config',
        'experiment_config.yaml')
        )
    default_lighthouse_config_file_path = os.path.abspath(os.path.join(pkg_dir,
        'config',
        'lighthouse_config.yaml')
        )
    swarm_config_yaml_arg = DeclareLaunchArgument(
        'swarm_config_yaml',
        default_value=str(default_swarm_config_file_path),
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
    lighthouse_config_file_arg = DeclareLaunchArgument(
        'lighthouse_config_file',
        default_value = default_lighthouse_config_file_path,
        description = 'Full path to the lighthouse configuration file to use'
    )
    print(f"lighthouse_config_file_arg: {default_lighthouse_config_file_path}")
    declare_cmds = [
        swarm_config_yaml_arg,
        namespace_arg,
        lh0_pose_frame_arg,
        lh1_pose_frame_arg,
        fly_arg,
        URI_arg,
        lighthouse_config_file_arg
    ]
    swarm_config_yaml = LaunchConfiguration("'swarm_config_yaml'")
    namespace = LaunchConfiguration("'namespace'")
    lh0_pose_frame = LaunchConfiguration("lh0_pose_frame")
    lh1_pose_frame = LaunchConfiguration("lh1_pose_frame")
    fly = LaunchConfiguration("fly")
    URI = LaunchConfiguration("URI")
    lighthouse_config_file = LaunchConfiguration("lighthouse_config_file")
    print(f"swarm_config_yaml: {swarm_config_yaml}")
    print(f"namespace: {namespace}")

    # * Read cf and tb initial positions from configuration file (default experiment_config.yaml)
    cf_instance_cmds = []
    cf_initial_translation = []
    with open(default_swarm_config_file_path, 'r') as file:
        config = yaml.safe_load(file)
        try:
            for cf in config['robots']['crazyflies']:
                cf_name = cf['name']
                initial_translation = cf['translation']
                initial_orientation = cf['orientation']
                print(f"initial_translation: {initial_translation}")
                print(f"First element of translation: f{initial_translation[0]}")
                cf_initial_translation = initial_translation
        except Exception as e:
            print("No crazyflies found in the configuration file. Exiting.")
            print(f"Error: {e}")
        try:
            for tb in config['robots']['turtlebots']:
                _ = tb['name']
                initial_translation = tb['translation']
                _ = tb['orientation']
                print(f"initial_translation: {initial_translation}")
                print(f"First element of translation: f{initial_translation[0]}")
        except Exception as e:
            print("No turtlebots found in the configuration file. Exiting.")


    # * Define transformations
    # Matches base_linnk from crazyflie to map (global)
    cf_static_base_link_publisher = launch_ros.actions.Node(
        package = 'tf2_ros',
        executable = 'static_transform_publisher',
        output = 'screen',
        arguments = [
            str(cf_initial_translation[0]),
            str(cf_initial_translation[1]),
            str(cf_initial_translation[2]),
            '0',
            '0',
            '0',
            'map', 'cf1/base_link']
    )
    cf_instance_cmds.append(cf_static_base_link_publisher)

    # * Define the cf_publisher node
    crazyflie_node = launch_ros.actions.Node(
        package='drl_pkg',
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
            'lighthouse_config_file': default_lighthouse_config_file_path,
            }
        ],
    )
    cf_instance_cmds.append(crazyflie_node)


    # * Set up recording commands
    record_cmds = []
    foxglove_websocket = IncludeLaunchDescription(
        XMLLaunchDescriptionSource(
            [os.path.join(
                get_package_share_directory('foxglove_bridge'),
                'launch',
                'foxglove_bridge_launch.xml')]
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

    return ld

if __name__ == "__main__":
    generate_launch_description()
    print("Launch description generated.")