import os
import pathlib
import launch
from launch import LaunchDescription
from ament_index_python.packages import get_package_share_directory
from webots_ros2_driver.webots_launcher import WebotsLauncher
from webots_ros2_driver.webots_launcher import Ros2SupervisorLauncher
from launch.actions import IncludeLaunchDescription
from launch_ros.actions import LoadComposableNodes, Node
from launch.substitutions import LaunchConfiguration
from launch.launch_description_sources import PythonLaunchDescriptionSource
from webots_ros2_driver.utils import controller_url_prefix
import xacro
from nav2_common.launch import ReplaceString

package_dir = get_package_share_directory('webots_pkg')
swarm_classes = pathlib.Path(os.path.join(package_dir, 'resource', 'swarm_classes.py'))
print("Swarm Classes: ", swarm_classes)
import importlib.util
spec = importlib.util.spec_from_file_location("swarm_classes", swarm_classes)
swarm_module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(swarm_module)


cf1 = swarm_module.Crazyflie('cf1', 'radio://0/80/2M/E7E7E7E7E7', [-1.5, -1.5, 0.015], [0, 0, 0])
cf2 = swarm_module.Crazyflie('cf2', 'radio://0/80/2M/E7E7E7E7E8', [0, 0, 0], [0, 0, 0])

tb1 = swarm_module.Turtlebot('tb1', 'ROS2_address', [0, 0, 0], [0, 0, 0])
tb2 = swarm_module.Turtlebot('tb2', 'ROS2_address', [0, 0, 0], [0, 0, 0])

swarm = swarm_module.Swarm([tb1, tb2], [cf1])


# Define helper functions
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
            {'robot_description': robot_description},
        ]
    )
    simple_mapper_node = Node(
        package='webots_pkg',
        executable='simple_mapper',
        output='screen',
        namespace=cf.name,
    )
    return crazyflie_driver, simple_mapper_node

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
    package_dir = get_package_share_directory('webots_pkg')
     # THIS is for the robot_driver (unnecessary for webots_pkg)
    ros2_supervisor = Ros2SupervisorLauncher()
    webots = WebotsLauncher(
        world=os.path.join(package_dir, 'worlds', 'swarm_apartment.wbt')
    )
    launch_description = [webots]
    
    # Handle transforms between map and odom for all robots

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
        launch_description.append(handle_initial_frame_tf(cf))
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
        launch_description.append(handle_initial_frame_tf(tb))

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