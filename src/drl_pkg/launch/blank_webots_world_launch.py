#!/usr/bin/env python3
#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  


"""
This file launches a single instance of a webots_world file specified in the launch configuration. There may be some broken dependencies as there are active branches of development. Be sure to check the launch parameters before assuming the entire file is broken. 

Usage: ros2 launch drl_pkg webots_world_launch.py world:=<world_name>

Author: Will Graham
"""


import os
import sys
from launch import LaunchDescription
import launch
from launch.actions import (
    DeclareLaunchArgument,
    ExecuteProcess,
    GroupAction,
    IncludeLaunchDescription,
    LogInfo,
)
from launch.conditions import IfCondition
from launch.substitutions import LaunchConfiguration, TextSubstitution
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch_xml.launch_description_sources import XMLLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory
from webots_ros2_driver.webots_launcher import WebotsLauncher
from launch_ros.actions import Node
from launch.substitutions.path_join_substitution import PathJoinSubstitution


# MACROS
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from drl_pkg.swarm_classes import tb 
from config.config_readers import import_yaml_as_swarm

def generate_launch_description():
    """
    Launches a single instance of a webots world file specified in the launch configuration. This was the starting point for the multi-robot launch file attempted in the nav2_launch.py file. I'd like to 

    Args:
        robot: dict of robot name, x, y, yaw, and controller

    """
    # Macro config
    base_world_file = 'apartment.wbt'
    package_dir = get_package_share_directory('drl_pkg')
    robot_config_file_path = os.path.abspath(
        os.path.join(package_dir,
        'config',
        'webots_config_no_cf.yaml'))
    ########## ! "Macro" config ##########
    bringup_dir = get_package_share_directory('nav2_bringup')
    launch_dir = os.path.join(bringup_dir, 'launch')

    # Set configuration
    swarm = import_yaml_as_swarm(robot_config_file_path)
    world = LaunchConfiguration('world')
    # Full path of the map file to be used for localization and planning
    map_yaml_file = LaunchConfiguration('map')
    # Whether to autostart the nav2 stack
    autostart = LaunchConfiguration('autostart')
    # Full path to the ROS2 parameters file to use for all launched nodes
    params_file = LaunchConfiguration('params_file')
    # Whether to use the robot state publisher
    use_robot_state_pub = LaunchConfiguration('use_robot_state_pub')
    rviz_config_file = LaunchConfiguration('rviz_config')

    # Simulation and foxglove settings
    rviz_config_file = LaunchConfiguration('rviz_config')
    use_rviz = LaunchConfiguration('use_rviz')
    log_settings = LaunchConfiguration('log_settings', default='true')


    # Definine nodes for webots and foxglove
    webots = WebotsLauncher(
        world=PathJoinSubstitution([package_dir, 'worlds', 'configured_worlds', world]),
        ros2_supervisor=True
    )
    foxglove_websocket = IncludeLaunchDescription(
        XMLLaunchDescriptionSource(
            [os.path.join(get_package_share_directory('foxglove_bridge'),
                          'launch',
                          'foxglove_bridge_launch.xml')]
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
    event_handler = launch.actions.RegisterEventHandler(
        event_handler=launch.event_handlers.OnProcessExit(
            target_action=webots,
            on_exit=[launch.actions.EmitEvent(event=launch.events.Shutdown())],
        )
    )

    # Define commands for launching Nav2 instances
    robots = swarm.get_robots_dict_list() #tested and working
    nav_instances_cmds = []
    for robot in robots:
        params_file = LaunchConfiguration(f"{robot['name']}_params_file")
        group = GroupAction(
            [
                IncludeLaunchDescription(
                    PythonLaunchDescriptionSource(
                        os.path.join(launch_dir, 'rviz_launch.py')
                    ),
                    condition=IfCondition(use_rviz),
                    launch_arguments={
                        'namespace': TextSubstitution(text=robot['name']),
                        'use_namespace': 'True',
                        'rviz_config': rviz_config_file,
                    }.items(),
                ),
                IncludeLaunchDescription(
                    PythonLaunchDescriptionSource(
                        os.path.join(bringup_dir, 'launch', 'tb3_simulation_launch.py')
                    ),
                    launch_arguments={
                        'namespace': robot['name'],
                        'use_namespace': 'True',
                        'map': map_yaml_file,
                        'use_sim_time': 'True',
                        'params_file': params_file,
                        'use_rviz': 'False',
                        'use_simulator': 'False',
                        'headless': 'False',
                        'use_robot_state_pub': use_robot_state_pub,
                        'x_pose': TextSubstitution(text=str(robot['x_pose'])),
                        'y_pose': TextSubstitution(text=str(robot['y_pose'])),
                        'z_pose': TextSubstitution(text=str(robot['z_pose'])),
                        'roll': TextSubstitution(text=str(robot['roll'])),
                        'pitch': TextSubstitution(text=str(robot['pitch'])),
                        'yaw': TextSubstitution(text=str(robot['yaw'])),
                        'robot_name': TextSubstitution(text=robot['name']),
                    }.items(),
                ),
                LogInfo(
                    condition=IfCondition(log_settings),
                    msg=['Launching ', robot['name']],
                ),
                LogInfo(
                    condition=IfCondition(log_settings),
                    msg=[robot['name'], ' map yaml: ', map_yaml_file],
                ),
                LogInfo(
                    condition=IfCondition(log_settings),
                    msg=[robot['name'], ' params yaml: ', params_file],
                ),
                LogInfo(
                    condition=IfCondition(log_settings),
                    msg=[robot['name'], ' rviz config file: ', rviz_config_file],
                ),
                LogInfo(
                    condition=IfCondition(log_settings),
                    msg=[
                        robot['name'],
                        ' using robot state pub: ',
                    ],
                ),
                LogInfo(
                    condition=IfCondition(log_settings),
                    msg=[robot['name'], ' autostart: ', autostart],
                )
            ]
        )

        nav_instances_cmds.append(group)
    # Add static transforms from world to odoms
    for robot in robots:
        map_to_odom = Node(
            package='tf2_ros',
            executable='static_transform_publisher',
            name=f'static_transform_publisher_{robot["name"]}',
            output='screen',
            arguments=[str(robot['x_pose']),
                       str(robot['y_pose']),
                       str(robot['z_pose']),
                       '0', '0', '0', 'map', 'odom']
        )
        odom_to_base_link = Node(
            package='tf2_ros',
            executable='static_transform_publisher',
            name=f'static_transform_publisher_{robot["name"]}',
            output='screen',
            arguments=['0', '0', '0', '0', '0', '0', 'odom', f'{robot["name"]}/base_link']
        )
        nav_instances_cmds.append(odom_to_base_link)


    # Declare launch arguments
    declaration_cmds = [
        DeclareLaunchArgument('log-level',
            default_value='debug',
            description='The log level to use'),
        DeclareLaunchArgument('world',
            default_value="apartment_nocf.wbt",
            description='The world file to be launched'),
        DeclareLaunchArgument('map',
            default_value=os.path.join(package_dir, 'maps', 'map.yaml'),
            description='Full path to map file to load'),
        DeclareLaunchArgument('params_file',
            default_value=os.path.join(package_dir, 'params', 'nav2_params_nocf.yaml'),
            description='Full path to the ROS2 parameters file to use for all launched nodes'),
        DeclareLaunchArgument('rviz_config',
            default_value=os.path.join(bringup_dir, 'rviz', 'nav2_default_view.rviz'),
            description='Full path to the RViz config file to use'),
        DeclareLaunchArgument('use_robot_state_pub',
            default_value='true',
            description='Whether to use the robot state publisher'),
        DeclareLaunchArgument('autostart',
            default_value='true',
            description='Whether to autostart the nav2 stack'),
        DeclareLaunchArgument('use_rviz',
            default_value='false',
            description='Whether to launch RViz'),
        DeclareLaunchArgument('log_settings',
            default_value='true',
            description='Whether to log settings'),
    ]

    robot_params_declaration_cmds = [
        DeclareLaunchArgument("tb1_params_file",
            default_value=os.path.join(package_dir, 'params', 'tb1_params.yaml'),
            description="Full path to the ROS2 parameters file to use for tb1"),
        DeclareLaunchArgument("tb2_params_file",
            default_value=os.path.join(package_dir, 'params', 'tb2_params.yaml'),
            description="Full path to the ROS2 parameters file to use for tb2"),
    ]
    # TODO: bringup_cmd_group initialization (see the multi robot launch file)
    bag_cmd = ExecuteProcess(
        cmd=['ros2', 'bag', 'record', '-a'],
        output='screen'
    )

    ld = LaunchDescription()

    for declaration in declaration_cmds:
        ld.add_action(declaration)
    for declaration in robot_params_declaration_cmds:
        ld.add_action(declaration)
    ld.add_action(bag_cmd)
    ld.add_action(webots)
    ld.add_action(webots._supervisor)
    ld.add_action(foxglove_websocket)
    ld.add_action(launch_handler)
    ld.add_action(event_handler)
    for simulation_instance_cmd in nav_instances_cmds:
        ld.add_action(simulation_instance_cmd)

    return ld
