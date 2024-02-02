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
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.substitutions import LaunchConfiguration
from launch.actions import DeclareLaunchArgument, LogInfo

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

# Macros for swarm configuration
CF1_NAME = "cf1"
CF1_URI = ""
CF1_TRANSLATION = [-1, -1, 0.015]
CF1_ORIENTATION = [0, 0, 0, 1]

CF2_NAME = "cf2"
CF2_URI = ""
CF2_TRANSLATION = [-2, 2, 0.015]
CF2_ORIENTATION = [0, 0, 0, 1]


TB1_NAME = "tb1"
TB1_TRANSLATION = [0, 0, 0.015]
TB1_ORIENTATION = [0, 0, 0, 1]

TB2_NAME = "tb2"
TB2_TRANSLATION = [0, 0, 0.015]
TB2_ORIENTATION = [0, 0, 0, 1]



# Macros for swarm configuration
CF1_NAME = "cf1"
CF1_URI = ""
CF1_TRANSLATION = [-1, -1, 0.015]
CF1_ORIENTATION = [0, 0, 0, 1]

CF2_NAME = "cf2"
CF2_URI = ""
CF2_TRANSLATION = [-2, -2, 0.015]
CF2_ORIENTATION = [0, 0, 0, 1]


TB1_NAME = "tb1"
TB1_TRANSLATION = [-1.5, -1.5, 0.015]
TB1_ORIENTATION = [0, 0, 0, 1]

TB2_NAME = "tb2"
TB2_TRANSLATION = [-2.5, -2.5, 0.015]
TB2_ORIENTATION = [0, 0, 0, 1]



world_files = 'apartment.wbt'

package_dir = get_package_share_directory('webots_pkg')


def define_swarm():
    """
    Defines the swarm configuration
    """
    # cf1 = cf(CF1_NAME, CF1_URI, CF1_TRANSLATION, CF1_ORIENTATION)
    # cf2 = cf(CF2_NAME, CF2_URI, CF2_TRANSLATION, CF2_ORIENTATION)

    tb1 = tb(TB1_NAME, TB1_TRANSLATION, TB1_ORIENTATION)
    tb2 = tb(TB2_NAME, TB2_TRANSLATION, TB2_ORIENTATION)

    swarm = Swarm([tb1, tb2], [])
    # swarm = Swarm([tb1, tb2], [cf1, cf2])
    # swarm = Swarm([], [cf1, cf2])
    return swarm

def get_cf_driver(cf):
    robot_description = pathlib.Path(os.path.join(package_dir, 'resource', 'crazyflie.urdf'))

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
    robot_description = pathlib.Path(os.path.join(package_dir, 'resource', 'turtlebot.urdf'))

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
        world=PathJoinSubstitution([package_dir, 'worlds', 'configured_worlds', world]),
        ros2_supervisor=True
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
    swarm = define_swarm()
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
        webots,
        webots._supervisor,
        launch_handler,
        *swarm_nodes,
        event_handler,
    ])