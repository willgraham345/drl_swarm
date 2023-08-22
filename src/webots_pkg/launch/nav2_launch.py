import importlib.util
import os
import pathlib

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
####################### IMPORTS FOR SWARM CLASSES #######################
package_dir = get_package_share_directory('webots_pkg')
nav2_bringup_dir = get_package_share_directory('nav2_bringup')
nav2_launch_dir = os.path.join(nav2_bringup_dir, 'launch')
swarm_classes = pathlib.Path(os.path.join(package_dir, 'resource', 'swarm_classes.py'))
print("Swarm Classes: ", swarm_classes)
spec = importlib.util.spec_from_file_location("swarm_classes", swarm_classes)
swarm_module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(swarm_module)
##########################################################################

####################### DEFINE SWARM AND WORLD ##########################

# Define swarm here:
cf1 = swarm_module.Crazyflie('cf1', [-1.5, -1.5, 0.015])
cf2 = swarm_module.Crazyflie('cf2', [-2.5, -2.5, 0.015])
tb1 = swarm_module.Turtlebot('tb1', [-1.0, -1.5, 0])
tb2 = swarm_module.Turtlebot('tb2', [-2.0, -2.0, 0])

swarm = swarm_module.Swarm([tb1, tb2], [cf1, cf2])
# Write swarm into world file
world_path = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
    "worlds/apartment.wbt")

new_world_filepath = os.path.join(package_dir, 'worlds', 'my_world.wbt')


swarm.swarm_writer(world_path, new_world_filepath)
##########################################################################

# Define helper functions
def get_cf_driver(cf):
    ''' UNFINISHED
    Description:
    This function will return different ROS nodes used to simulate the crazyflie in Webots.

    Dependencies:
    webots_ros2_driver
    robot_state_publisher
    webots_pkg
    resource/crazyflie.urdf
    nav2_params
    I think there are m
    '''
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
        package='webots_pkg',
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

    return crazyflie_driver, simple_mapper_node, bringup_cmd

def tb_launcher(tb):
    ''' UNFINISHED
    Description:
    This function will return different ROS nodes used to simulate the turtlebot in Webots.
    Dependencies:
    webots_ros2_driver
    robot_state_publisher
    webots_pkg
    resource/crazyflie.urdf
    nav2_params
    I think there are m
    '''
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
    ''' UNFINISHED
    Description:
    This function will return a ROS node that will publish a static transform between the map and the agent's initial position
    Reads in the swarm's configuration as defined in swarm_classes.py
    Dependencies:
    tf2_ros
    '''
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

def generate_launch_description():
    package_dir = get_package_share_directory('webots_pkg')
     # THIS is for the robot_driver (unnecessary for webots_pkg)
    ros2_supervisor = Ros2SupervisorLauncher()
    webots = WebotsLauncher(
        world=new_world_filepath,
    )
    launch_description = [webots]
    
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
        launch_description.append(robot_state_publisher)
        # launch_description.append(handle_initial_frame_tf(cf))
        for node in get_cf_driver(cf):
            launch_description.append(node)
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
        launch_description.append(robot_state_publisher)
        # launch_description.append(handle_initial_frame_tf(tb))

        tb_nodes = tb_launcher(tb)
        launch_description.append(tb_nodes) #Temporary fix, go back to for loop commented below
    
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