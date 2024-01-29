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
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.substitutions import LaunchConfiguration
from launch.actions import DeclareLaunchArgument, LogInfo

from webots_ros2_driver.webots_launcher import WebotsLauncher
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



world_files = 'apartment.wbt'

package_dir = get_package_share_directory('webots_pkg')


def define_swarm():
    """
    Defines the swarm configuration
    """
    cf1 = cf(CF1_NAME, CF1_URI, CF1_TRANSLATION, CF1_ORIENTATION)
    cf2 = cf(CF2_NAME, CF2_URI, CF2_TRANSLATION, CF2_ORIENTATION)

    tb1 = tb(TB1_NAME, TB1_TRANSLATION, TB1_ORIENTATION)
    tb2 = tb(TB2_NAME, TB2_TRANSLATION, TB2_ORIENTATION)

    swarm = Swarm([tb1, tb2], [cf1, cf2])
    return swarm

def get_cf_driver(cf):
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
            {'robot_description': robot_description,
             'use_sim_time': True,}
        ]
    )
    return crazyflie_driver


def tb_launcher(tb):
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
    event_handler = launch.actions.RegisterEventHandler(
        event_handler=launch.event_handlers.OnProcessExit(
            target_action=webots,
            on_exit=[launch.actions.EmitEvent(event=launch.events.Shutdown())],
        )
    )


    #Development here
    swarm = define_swarm()
    robot_controllers = []


    for cf in swarm.crazyflies:
        print("cf = ", cf)
        robot_state_publisher = Node(
            package='robot_state_publisher',
            executable='robot_state_publisher',
            output='screen',
            namespace=cf.name,
            parameters=[{
                'robot_description': '<robot name=""><link name=""/></robot>'
            }],
        )
        robot_controllers.append(robot_state_publisher)
        robot_controllers.append(handle_initial_frame_tf(cf))
        for node in get_cf_driver(cf):
            robot_controllers.append(node)
        
    
    for tb in swarm.turtlebots:
        print("tb = ", tb)
        print("tb.name = ", tb.name)
        robot_state_publisher = Node(
            package='robot_state_publisher',
            executable='robot_state_publisher',
            output='screen',
            namespace=tb.name,
            parameters=[{
                'robot_description': '<robot name=""><link name=""/></robot>',
            }],
        )
        robot_controllers.append(robot_state_publisher)
        robot_controllers.append(handle_initial_frame_tf(tb))

        tb_nodes = tb_launcher(tb)
        robot_controllers.append(tb_nodes) #Temporary fix, go back to for loop commented below



    return LaunchDescription([
        DeclareLaunchArgument(
            'world',
            default_value='apartment.wbt',
            description='The world file name to be launched, from within the worlds folder'
        ),
        webots,
        webots._supervisor,
        launch_handler,
        robot_controllers,
        event_handler,
    ])