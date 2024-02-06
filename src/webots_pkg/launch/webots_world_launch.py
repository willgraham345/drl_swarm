#!/usr/bin/env python3
#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  


"""
This file launches a single instance of a webots_world file specified in the launch configuration

Usage: ros2 launch webots_pkg webots_world_launch.py world:=<world_name>

Author: Will Graham
"""


import os
import sys
import pathlib
import launch
import logging
import yaml
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.substitutions import LaunchConfiguration
from launch.actions import DeclareLaunchArgument, LogInfo, IncludeLaunchDescription 
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch_xml.launch_description_sources import XMLLaunchDescriptionSource

from webots_ros2_driver.webots_launcher import WebotsLauncher
from webots_ros2_driver.webots_controller import WebotsController
from webots_ros2_driver.webots_launcher import Ros2SupervisorLauncher
from launch_ros.actions import Node
from webots_ros2_driver.utils import controller_url_prefix
from webots_ros2_driver.webots_launcher import WebotsLauncher
from webots_ros2_driver.webots_controller import WebotsController
from launch.substitutions.path_join_substitution import PathJoinSubstitution

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.swarm_classes import Swarm, cf, tb 
DIR_PATH = os.path.dirname(__file__)

WORLD_FILES = 'apartment.wbt'

PACKAGE_DIR = get_package_share_directory('webots_pkg')
CONFIG_FILE_PATH = os.path.abspath(os.path.join(PACKAGE_DIR, 'config', 'webots_config.yaml'))


def import_webots_swarm_config(config_file_path : str):
    with open(config_file_path, 'r') as file:
        config = yaml.safe_load(file)
    swarm = Swarm()
    
    for crazyflie in config['robots']['crazyflies']:
        Crazyflie = cf(crazyflie['name'], crazyflie['translation'])
        swarm.add_cf(Crazyflie)
    
    for turtlebot in config['robots']['turtlebots']:
        Turtlebot = tb(turtlebot['name'], turtlebot['translation'])
        swarm.add_tb(Turtlebot)
        
    return swarm 


def get_cf_driver(cf):
    robot_description = pathlib.Path(os.path.join(PACKAGE_DIR, 'resource', 'crazyflie.urdf'))

    crazyflie_driver = WebotsController(
        robot_name = cf.name,
        parameters = [
            {'robot_description': robot_description,
             'use_sim_time': True,
             'set_robot_state_publisher': False}, #default is False
        ],
        # remappings = 
    )
    logging.debug(f"crazyflie_driver = {crazyflie_driver}")
    logging.debug(f"robot_description = {robot_description}")
    return crazyflie_driver


def get_tb_driver(tb):
    robot_description = pathlib.Path(os.path.join(PACKAGE_DIR, 'resource', 'turtlebot.urdf'))

    turtlebot_driver = WebotsController(
        robot_name = tb.name,
        parameters = [
            {'robot_description': robot_description,
             'use_sim_time': True,
             'set_robot_state_publisher': False}, #default is False
        ],
        # remappings = 
    )
    logging.debug(f"turtlebot_driver = {turtlebot_driver}")
    logging.debug(f"robot_description = {robot_description}")
    return turtlebot_driver


def handle_initial_frame_tf(agent):
    # Get initial position and orientation
    pos = agent.start_position
    ori = agent.start_orientation
    # Create a launch action to handle the transform
    static_tf_publisher = Node(
        package='tf2_ros',
        executable='static_transform_publisher',
        output='screen',
        arguments=[str(pos[0]), str(pos[1]), str(pos[2]), str(ori[0]), str(ori[1]), str(ori[2]), 'map', f'{agent.name}/map'],
    )
    return static_tf_publisher


def generate_launch_description():
    """
    Launches the webots world and the ros2 supervisor
    """
    # Declare launch arguments for substitution
    world = LaunchConfiguration('world')
    webots = WebotsLauncher(
        world=PathJoinSubstitution([PACKAGE_DIR, 'worlds', 'configured_worlds', world]),
        ros2_supervisor=True
    )
    foxglove_websocket = IncludeLaunchDescription(
        XMLLaunchDescriptionSource(
            [os.path.join(get_package_share_directory('foxglove_bridge'), 'launch', 'foxglove_bridge_launch.xml')]
        )
    )
    launch_handler = launch.actions.RegisterEventHandler(
        event_handler=launch.event_handlers.OnProcessStart(
            target_action=webots,
            on_start=[
                LogInfo(msg='Webots sim has started, spawning can now be performed!')
            ]
        )
    )
    webots
    event_handler = launch.actions.RegisterEventHandler(
        event_handler=launch.event_handlers.OnProcessExit(
            target_action=webots,
            on_exit=[launch.actions.EmitEvent(event=launch.events.Shutdown())],
        )
    )


    #Development here
    swarm = import_webots_swarm_config(CONFIG_FILE_PATH)
    swarm_nodes = []


    for cf in swarm.crazyflies:
        # TODO: Confirm that the robot_state_publisher is publishing data to tf
        robot_state_publisher = Node(
            package='robot_state_publisher',
            executable='robot_state_publisher',
            output='screen',
            namespace=cf.name,
            parameters=[{
                'robot_description': '<robot name=""><link name=""/></robot>',
            }],
        )
        swarm_nodes.append(robot_state_publisher)
        swarm_nodes.append(get_cf_driver(cf))
        
    
    for tb in swarm.turtlebots:
        # TODO: Confirm that the robot_state_publisher is publishing data to tf
        robot_state_publisher = Node(
            package='robot_state_publisher',
            executable='robot_state_publisher',
            output='screen',
            namespace=tb.name,
            parameters=[{
                'robot_description': '<robot name=""><link name=""/></robot>',
            }],
        )
        swarm_nodes.append(robot_state_publisher)
        swarm_nodes.append(get_tb_driver(tb)) 


    print("swarm_nodes = ", swarm_nodes)
    return LaunchDescription([
        DeclareLaunchArgument(
            'world',
            default_value='apartment.wbt',
            description='The world file name to be launched, from within the worlds folder'
        ),
        foxglove_websocket,
        webots,
        webots._supervisor,
        launch_handler,
        *swarm_nodes,
        event_handler,
    ])