import os
import pathlib
import launch
from launch_ros.actions import Node
from launch import LaunchDescription
from ament_index_python.packages import get_package_share_directory
from webots_ros2_driver.webots_launcher import WebotsLauncher
from webots_ros2_driver.webots_launcher import Ros2SupervisorLauncher
from launch_ros.actions import LoadComposableNodes, Node
from launch_ros.descriptions import ComposableNode


def generate_launch_description():
    package_dir = get_package_share_directory('crazyflie_ros2_simulation')
    robot_description = pathlib.Path(os.path.join(package_dir, 'resource', 'crazyflie.urdf')).read_text()
    ros2_supervisor = Ros2SupervisorLauncher()
    webots = WebotsLauncher(
        world=os.path.join(package_dir, 'worlds', 'crazyflie_apartment.wbt')
    )

    my_robot_driver = Node(
        package='webots_ros2_driver',
        executable='driver',
        output='screen',
        namespace='robot1',
        additional_env={'WEBOTS_CONTROLLER_URL': 'robot1'},
        parameters=[
            {'robot_description': robot_description,
             'use_sim_time': True,
             'set_robot_state_publisher': True},
        ]
    )

    robot_state_publisher = Node(
        package='robot_state_publisher',
        executable='robot_state_publisher',
        output='screen',
        namespace='robot1',
        parameters=[{
            'robot_description': '<robot name=""><link name=""/></robot>'
        }],
    )

    my_robot_driver2 = Node(
        package='webots_ros2_driver',
        executable='driver',
        output='screen',
        namespace='robot2',
        additional_env={'WEBOTS_CONTROLLER_URL': 'robot2'},
        parameters=[
            {'robot_description': robot_description,
             'use_sim_time': True,
             'set_robot_state_publisher': True},
        ]
        # We need to remap the crazyflie controllers

    )
    robot_state_publisher2 = Node(
        package='robot_state_publisher',
        executable='robot_state_publisher',
        output='screen',
        namespace='robot2',
        parameters=[{
            'robot_description': '<robot name=""><link name=""/></robot>'
        }],
    )







    return LaunchDescription([
        webots,
        my_robot_driver,
        robot_state_publisher,
        ros2_supervisor,
        # my_robot_driver2,
        # robot_state_publisher2,
        launch.actions.RegisterEventHandler(
            event_handler=launch.event_handlers.OnProcessExit(
                target_action=webots,
                on_exit=[launch.actions.EmitEvent(event=launch.events.Shutdown())],
            )
        )
    ])