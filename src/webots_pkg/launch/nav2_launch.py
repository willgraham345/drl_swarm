import importlib.util
import os
import pathlib
import sys

import launch
import xacro
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import LoadComposableNodes, Node
from nav2_common.launch import ReplaceString
from webots_ros2_driver.utils import controller_url_prefix
from webots_ros2_driver.webots_launcher import (Ros2SupervisorLauncher,
                                                WebotsLauncher)

# Import swarm functions and swarm classes
from webots_pkg.swarm_classes import Crazyflie, Turtlebot, Swarm
from webots_pkg.swarm_launch_functions import get_cf_driver, tb_launcher


####################### IMPORTS FOR SWARM CLASSES #######################
package_dir = get_package_share_directory('webots_pkg')
nav2_bringup_dir = get_package_share_directory('nav2_bringup')
nav2_launch_dir = os.path.join(nav2_bringup_dir, 'launch')

####################### DEFINE SWARM AND WORLD ##########################

# Define swarm here:
cf1 = Crazyflie('cf1', [-1.5, -1.5, 0.015])
# cf2 = Crazyflie('cf2', [-2.5, -2.5, 0.015])
tb1 = Turtlebot('tb1', [-1.0, -1.5, 0])
tb2 = Turtlebot('tb2', [-2.0, -2.0, 0])

swarm = Swarm([tb1, tb2], [cf1])
# Write swarm into world file
world_path = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
    "worlds/apartment.wbt")

new_world_filepath = os.path.join(package_dir, 'worlds', 'my_world.wbt')

swarm.swarm_writer(world_path, new_world_filepath)


##########################################################################
##########################################################################

def handle_initial_frame_tf(agent):
    """
    Returns a Node object that publishes the initial transform of a given agent. In our examples, agents refer to Crazyflies and Turtlebots.
    :param agent: Agent object
    :type agent: Agent

    :return static_tf_publisher: static_tf_publisher node object
    :rtype: launch_ros.actions.Node
    """
    # Get initial position and orientation
    pos = agent.start_position
    ori = agent.start_orientation
    if ori is None:
        ori = [0, 0, 0] # Default orientatiou
    # Create a launch action to handle the transform
    static_tf_publisher = Node(
        package='tf2_ros',
        executable='static_transform_publisher',
        output='screen',
        arguments=[str(pos[0]), str(pos[1]), str(pos[2]), str(ori[0]), str(ori[1]), str(ori[2]), 'map', f'{agent.name}/map'],
    )
    return static_tf_publisher


####################### BEGIN LAUNCH DESCRIPTION ################################

def generate_launch_description():
    # THIS is for the robot_driver (unnecessary for webots_pkg)
    ros2_supervisor = Ros2SupervisorLauncher()
    webots = WebotsLauncher(
        world=new_world_filepath,
    )
    launch_description = [webots]
    
    for cf in swarm.crazyflies:
        robot_state_publisher = Node(
            package='robot_state_publisher',
            executable='robot_state_publisher',
            output='screen',
            namespace=cf.name,
            parameters=[{
                'robot_description': '<robot name=""><link name=""/></robot>'
            }],
        )
        launch_description.append(robot_state_publisher)
        # launch_description.append(handle_initial_frame_tf(cf))
        for node in get_cf_driver(cf):
            launch_description.append(node)
    for tb in swarm.turtlebots:
        robot_state_publisher = Node(
            package='robot_state_publisher',
            executable='robot_state_publisher',
            output='screen',
            namespace=tb.name,
            parameters=[{
                'robot_description': '<robot name=""><link name=""/></robot>',
            }],
        )
        launch_description.append(robot_state_publisher)
        # launch_description.append(handle_initial_frame_tf(tb))

        tb_nodes = tb_launcher(tb)
        launch_description.append(tb_nodes) #Temporary fix, go back to for loop commented below
    

    rviz_cmd = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(nav2_launch_dir, 'rviz_launch.py')),
        launch_arguments={
                          'rviz_config': os.path.join(nav2_bringup_dir, 'rviz', 'nav2_default_view.rviz')}.items())
    # Add event handler so everything shuts down on Webots exit
    event_handler = launch.actions.RegisterEventHandler(
            event_handler=launch.event_handlers.OnProcessExit(
                target_action=webots,
                on_exit=[launch.actions.EmitEvent(event=launch.events.Shutdown())],
            )
        )
    
    launch_description.append(event_handler)

    return LaunchDescription(launch_description)


if __name__ == "__main__":
    generate_launch_description()