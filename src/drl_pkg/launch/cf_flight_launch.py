import launch_ros
import os
import yaml
from launch import LaunchDescription

from launch_xml.launch_description_sources import XMLLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory
from launch.actions import IncludeLaunchDescription, ExecuteProcess



def generate_launch_description():
    """
    Ros2 launch function to test flying a cf_publisher node with the `fly` node parameter set to `True`. This essentially runs the `drl_pkg.crazyflie_publisher.CrazyfliePublisher`. 

    Usage:
        >>> ros2 launch drl_pkg cf_flight_launch.py
        # With ros arguments (Parameters):
        >>> ros2 run drl_pkg cf_publisher --ros-args --fly:=True

    Args:
        params_file (:obj:`str`, optional): The path to the experiment configuration file. Defaults to 'config/experiment_config.yaml'.

    Returns:
        :obj:`foxglove_websocket` node
        :obj:`crazyflie_node`: Included `cf_publisher_launch` LaunchDescription with parameters as: Fly = True, URI = 'radio://0/80/2M/E7E7E7E7E7', config_file = params_file.
        :obj:`static_tf_publisher`: Publishes a static transform between the world and odom frames for the crazyflie.
        :obj:`teleop_twist_node`: Launches the teleop_twist_keyboard node for manual control.

    """   
    PACKAGE_DIR = get_package_share_directory('drl_pkg')
    CONFIG_FILE_PATH = (os.path.join(PACKAGE_DIR, 'config', 'experiment_config.yaml'))
    foxglove_websocket = IncludeLaunchDescription(
        XMLLaunchDescriptionSource(
            [os.path.join(get_package_share_directory('foxglove_bridge'), 'launch', 'foxglove_bridge_launch.xml')]
        )
    )
    params_file = CONFIG_FILE_PATH
    print(f'params_file: {params_file}')


    # Check to make sure other parameters are correctly set. 
    crazyflie_node = launch_ros.actions.Node(
        package='drl_pkg',
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

    # Publish a static transform between the world and odom frames
    static_tf_publisher = launch_ros.actions.Node(
        package = 'tf2_ros',
        executable = 'static_transform_publisher',
        output = 'screen',
        arguments = [str(initial_translation[0]), str(initial_translation[1]), str(initial_translation[2]), '0', '0', '0', 'world', 'odom']
    )

    # Launch the teleop_twist_keyboard node for manual control
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
