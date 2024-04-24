import os
import pathlib

from ament_index_python.packages import get_package_share_directory
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch_ros.actions import Node
from webots_ros2_driver.utils import controller_url_prefix


def get_cf_driver(cf):
    """
    Returns a Node object that launches the webots_ros2_driver for a given Crazyflie
    :param cf: Crazyflie object
    :type cf: Crazyflie
    
    :return crazyflie_driver: crazyflie_driver node object
    :rtype: launch_ros.actions.Node
    :return simple_mapper_node: simple_mapper_node object
    :rtype: launch_ros.actions.Node
    :return bringup_cmd: bringup_cmd object
    :rtype: launch.actions.IncludeLaunchDescription

    :todo:: Figure out why the crazyflie isn't launching
    :todo:: Look into implementing Crazyswarm2 into simulation
    """
    package_dir = get_package_share_directory('drl_pkg')
    nav2_bringup_dir = get_package_share_directory('nav2_bringup')
    nav2_launch_dir = os.path.join(nav2_bringup_dir, 'launch')

    robot_description = pathlib.Path(os.path.join(package_dir, 'resource', 'crazyflie.urdf')).read_text()
    crazyflie_driver = Node(
        package='webots_ros2_driver',
        executable='driver',
        output='screen',
        additional_env={
            'WEBOTS_ROBOT_NAME':cf.name,
            'WEBOTS_CONTROLLER_URL': controller_url_prefix() + cf.name,
            },
        parameters=[
            {'robot_description': robot_description},
        ]
    )
    simple_mapper_node = Node(
        package='drl_pkg',
        executable='simple_mapper',
        output='screen',
        namespace=cf.name,
    )
    bringup_cmd = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(nav2_launch_dir, 'bringup_launch.py')),
        launch_arguments={
                        'namespace': cf.name,
                        'use_namespace': 'True',
                        'slam': 'False',
                        'map': os.path.join(package_dir, 'map.yaml'),
                        'use_sim_time': 'true',
                        'params_file': os.path.join(package_dir,'params', 'nav2_params.yaml'),
                        'autostart': 'true',
                        'use_composition': 'true'
                        }.items()
    )

    return crazyflie_driver, simple_mapper_node # bringup_cmd


def tb_launcher(tb):
    """
    Returns a Node object that launches the webots_ros2_driver for a given Turtlebot
    :param tb: Turtlebot object
    :type tb: Turtlebot
    
    :return: turtlebot_driver node object
    :rtype: launch_ros.actions.Node

    :todo:: Add a controller to turtlebot for experimentation.
    """
    package_dir = get_package_share_directory('drl_pkg')
    nav2_bringup_dir = get_package_share_directory('nav2_bringup')

    robot_description = pathlib.Path(os.path.join(package_dir, 'resource', 'turtlebot.urdf')).read_text()
    print("robot_description = ", robot_description)
    print("tb.name = ", tb.name)
    turtlebot_driver = Node(
        package='webots_ros2_driver',
        executable='driver',
        output='screen',
        additional_env={
            'WEBOTS_ROBOT_NAME':tb.name,
            'WEBOTS_CONTROLLER_URL': controller_url_prefix() + tb.name,
            },
        parameters=[
            {'robot_description': robot_description},
        ]
    )
    return turtlebot_driver