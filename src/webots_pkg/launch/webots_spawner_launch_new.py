#!/usr/bin/env python
import os
import pathlib
from ament_index_python.packages import get_package_share_directory
import launch
from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument
from launch.actions import ExecuteProcess, RegisterEventHandler, LogInfo

from launch.substitutions import LaunchConfiguration, FindExecutable
from launch.substitutions.path_join_substitution import PathJoinSubstitution
from launch.event_handlers import OnProcessStart
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch_ros.actions import Node
from launch.actions import IncludeLaunchDescription
from webots_ros2_driver.urdf_spawner import URDFSpawner
from webots_ros2_driver.utils import controller_url_prefix

from webots_pkg.swarm_classes import Crazyflie, Turtlebot, Swarm
from webots_pkg.spawning_functions import get_cf_driver # TODO: Add tb_driver function

def generate_launch_description():
    package_dir = get_package_share_directory('webots_pkg')

    # Include webots_world_launch.py

    world_node = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            PathJoinSubstitution([package_dir, 'launch', 'webots_world_launch.py']),
        ),
        launch_arguments={
            'world': 'apartment.wbt'
        }.items(),
    )

    # Get subentities from world_node for event handler. 
    webots_node = world_node.get_sub_entities()[0] 

    
    

    # Define a crazyflie
    cf1 = Crazyflie('cf1', 'radio://0/80/2M/E7E7E7E7E7', [-2.0, -2.0, 2.0], [0, 0, 0])

    # Define Crazylie driver and simple mapper
    cf_driver, cf_mapper = get_cf_driver(cf1, package_dir)

    spawn_cf = ExecuteProcess(
        cmd=[[
            FindExecutable(name='ros2'), 
            ' service call "' 
            '/Ros2Supervisor/spawn_node_from_string ',
            'webots_ros2_msgs/srv/SpawnNodeFromString ',
            """{data: Crazyflie { name 'cf1' controller '<extern>' translation -2.0 -2.0 2.0}}"""
            # '"{data: Crazyflie {name "cf1" controller "<extern>" translation -2.0 -2.0 2.0 }}"',
        ]],
        shell=True, # command will fail with "file not found error" if not true
    )

    spawn_cf_event_handler = RegisterEventHandler(
        event_handler=OnProcessIO(
            target_action=spawn_cf,
            on_stdout=lambda event: LogInfo(
                msg=
            )
    robot_state_publisher = Node(
        package='robot_state_publisher',
        executable='robot_state_publisher',
        output='screen',
        namespace=cf1.name,
        parameters=[{
            'robot_description': '<robot name=""><link name=""/></robot>'
        }],
    )

    crazyflie_driver, simple_mapper_node = get_cf_driver(cf1, package_dir)

    # New attempt is to spawn with an IMPORTABLE EXTERNPROTO defined within the resource file, found on github
    # urdf_path_cf = os.path.join(package_dir, 'resource', 'crazyflie.urdf')
    # urdf_path_tb = os.path.join(package_dir, 'resource', 'turtlebot.urdf')
    # robot_description_cf = pathlib.Path(urdf_path_cf).read_text()
    # robot_description_tb = pathlib.Path(urdf_path_tb).read_text()

    ##### CLI COMMAND: ros2 service call /Ros2Supervisor/spawn_node_from_string webots_ros2_msgs/srv/SpawnNodeFromString "data: Crazyflie {name \"cf1\"} "   #####
    ### Need to learn how to set the IMPORTABLE EXTERNPROTO list in the webots worlds.
    # Fields can be rewritten, but need to be within the brackets above i.e. {name = \"cf1\" translation -2.0 -2.0 0.15}

    #TODO: Add CF PROTO node to the repostory with the multiranger as well as the the 
    #TODO: Add TB Proto node to repository and test launching it


    # urdf_success = spawn_URDF_robot = URDFSpawner(
    #     name='cf1',
    #     urdf_path=urdf_path_cf,
    #     translation='0 0 1',
    #     rotation='0 0 1 -1.5708',
    # )

    # TODO: Add namespace capability to cf nodes
    # cf_publisher = Node(
    #     package = 'webots_pkg',
    #     executable = 'cf_publisher',
    #     name = 'cf1_publisher',
    #     output = 'screen',
    #     parameters=[{
    #         'link_uri': 'radio://0/80/2M/E7E7E7E7E7',
    #     }]
    #     # namespace='cf1',
    # ) # TODO: Test that it's working with a Crazyflie Dongle

    # cf_driver = Node(
    #     package = 'webots_pkg',
    #     executable = 'driver',
    #     name = 'cf1_driver',
    #     output = 'screen',
    #     parameters=[{}],
    #     # namespace='cf1',
    # )

    # cf_mapper = Node(
    #     package = 'webots_pkg',
    #     executable = 'simple_mapper',
    #     name = 'cf1_mapper',
    #     # namespace = 'cf1',
    # )

    ld = LaunchDescription()
    ld.add_action(world_node)

    
    ld.add_action(cf_driver)
    # ld.add_action(cf_mapper)
    # TODO add following nodes to the launch description once crazyflie is spawned
    # ld.add_action(robot_state_publisher)
    # ld.add_action(simple_mapper_node)
    # ld.add_action(crazyflie_driver)
    return ld