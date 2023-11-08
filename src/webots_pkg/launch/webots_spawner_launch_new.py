#!/usr/bin/env python
import os
import pathlib
from ament_index_python.packages import get_package_share_directory
import launch
from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
from launch.substitutions.path_join_substitution import PathJoinSubstitution
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch_ros.actions import Node
from launch.actions import IncludeLaunchDescription
from webots_ros2_driver.urdf_spawner import URDFSpawner

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
    # ld.add_action(cf_publisher)
    # ld.add_action(cf_driver)
    # ld.add_action(cf_mapper)
    return ld