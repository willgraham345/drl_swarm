import os
import pathlib
import launch
from launch import LaunchDescription
from ament_index_python.packages import get_package_share_directory
from webots_ros2_driver.webots_launcher import WebotsLauncher
from webots_ros2_driver.webots_launcher import Ros2SupervisorLauncher
from launch_ros.actions import LoadComposableNodes, Node


# TODO: Add dependence for swarm_classes.py
from swarm_classes import Swarm


def generate_launch_description():
    package_dir = get_package_share_directory('webots_pkg')
    robot_description = pathlib.Path(os.path.join(package_dir, 'resource', 'crazyflie.urdf')).read_text() # THIS is for the robot_driver (unnecessary for webots_pkg)
    ros2_supervisor = Ros2SupervisorLauncher()
    webots = WebotsLauncher(
        world=os.path.join(package_dir, 'worlds', 'crazyflie_apartment.wbt')
    )
    # Robot_state_publisher is a ros2 package that interacts with the Crazyflie urdf to publish the Crazyflie's state
    robot_state_publisher = Node(
        package='robot_state_publisher',
        executable='robot_state_publisher',
        output='screen',
        namespace='robot1', # TODO: Change this to interact with swarm_classes.py
        parameters=[{
            'robot_description': '<robot name=""><link name=""/></robot>'
        }],
    )

    # my_robot_driver = Node(
    #     package='webots_ros2_driver',
    #     executable='driver',
    #     output='screen',
    #     namespace='robot1',
    #     additional_env={'WEBOTS_CONTROLLER_URL': 'robot1'},
    #     parameters=[
    #         {'robot_description': robot_description,
    #          'use_sim_time': True,
    #          'set_robot_state_publisher': True},
    #     ]
    # )

    # my_robot_driver2 = Node(
    #     package='webots_ros2_driver',
    #     executable='driver',
    #     output='screen',
    #     namespace='robot2',
    #     additional_env={'WEBOTS_CONTROLLER_URL': 'robot2'},
    #     parameters=[
    #         {'robot_description': robot_description,
    #          'use_sim_time': True,
    #          'set_robot_state_publisher': True},
    #     ]
    #     # We need to remap the crazyflie controllers

    # )
    # robot_state_publisher2 = Node(
    #     package='robot_state_publisher',
    #     executable='robot_state_publisher',
    #     output='screen',
    #     namespace='robot2',
    #     parameters=[{
    #         'robot_description': '<robot name=""><link name=""/></robot>'
    #     }],
    # )







    return LaunchDescription([
        webots,
        robot_state_publisher,
        ros2_supervisor,
        launch.actions.RegisterEventHandler(
            event_handler=launch.event_handlers.OnProcessExit(
                target_action=webots,
                on_exit=[launch.actions.EmitEvent(event=launch.events.Shutdown())],
            )
        )
    ])