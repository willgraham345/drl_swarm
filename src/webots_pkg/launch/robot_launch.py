import os
import pathlib
import launch
from launch import LaunchDescription
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory
from webots_ros2_driver.webots_launcher import WebotsLauncher
from webots_ros2_driver.webots_launcher import Ros2SupervisorLauncher
from webots_ros2_driver.utils import controller_url_prefix
from urdf_parser_py.urdf import URDF

package_dir = get_package_share_directory('webots_pkg')
swarm_classes = pathlib.Path(os.path.join(package_dir, 'resource', 'swarm_classes.py'))
import importlib.util
spec = importlib.util.spec_from_file_location("swarm_classes", swarm_classes)
swarm_module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(swarm_module)


cf1 = swarm_module.Crazyflie('cf1', 'radio://0/80/2M/E7E7E7E7E7', [0, 0, 0])
cf2 = swarm_module.Crazyflie('cf2', 'radio://0/80/2M/E7E7E7E7E8', [1, 1, 0])

tb1 = swarm_module.Turtlebot('tb1', 'ROS2_address', [2, 2, 0])
swarm = swarm_module.Swarm([tb1], [cf1, cf2])
# print(swarm.crazyflies['cf1'].URI_address)

def generate_launch_description():
    webots_package_dir = get_package_share_directory('webots_pkg')

    webots = WebotsLauncher(
        world=os.path.join(webots_package_dir, 'worlds', 'swarm_crazyflie_apartment.wbt')
    )
    # I don't think the ros2 supervisor can come before the webots launcher. I'm not sure though.
    ros2_supervisor = Ros2SupervisorLauncher()
    # urdf = os.path.join(webots_package_dir, 'resource', 'Crazyflie1.urdf')
    # with open(urdf, 'r+') as infp:
    #     urdf = URDF.from_xml_string(infp.read())
    # print(urdf)
    # Don't modify above this line, it'll screw stuff up
    
    # I don't think the state publishers acutally do anything. I think everything runs through the driver. I'm not sure though.
    robot_description = pathlib.Path(os.path.join(package_dir, 'resource', 'Crazyflie1.urdf')).read_text()
    print("robot_description: ", robot_description)
    # cf1_state_publisher = Node(
    #     package='robot_state_publisher',
    #     executable='robot_state_publisher',
    #     output='screen',
    #     parameters=[{
    #         'robot_description': '<robot name="Crazyflie1"><link name=""/></robot>',
    #     }],
    # )
    cf1_driver = Node(
        package='webots_ros2_driver',
        executable='driver',
        output='screen',
        additional_env={'WEBOTS_CONTROLLER_URL': 'Crazyflie1'},
        parameters=[{
            'robot_description': robot_description,
            'use_sim_time': True,
            'set_robot_state_publisher': True,
            'name': 'cf1',
        }],
    )
    robot_description = pathlib.Path(os.path.join(package_dir, 'resource', 'Crazyflie2.urdf')).read_text()
    # cf2_state_publisher = Node(
    #     package='robot_state_publisher',
    #     executable='robot_state_publisher',
    #     output='screen',
    #     namespace='cf2',
    #     parameters=[{
    #         'robot_description': robot_description,
    #     }],
    # )
    cf2_driver = Node(
        package='webots_ros2_driver',
        executable='driver',
        output='screen',
        additional_env={'WEBOTS_CONTROLLER_URL': 'Crazyflie2'},
        parameters=[{
            'robot_description': robot_description,
        }],
    )

    # my_robot_driver = Node(
    #     package='webots_ros2_driver',
    #     executable='driver',
    #     output='screen',
    #     # namespace='cf1_driver',
    #     additional_env={'WEBOTS_CONTROLLER_URL': 'Crazyflie'},
    #     parameters=[{
    #         'robot_description': robot_description,
    #         'use_sim_time': True,
    #         'set_robot_state_publisher': True,
    #     }],
    # )
    return LaunchDescription([
        webots,
        cf1_driver,
        ros2_supervisor,
        cf2_driver,
        # cf1_state_publisher,
        # robot_state_publisher2,
        # my_robot_driver2,
        launch.actions.RegisterEventHandler(
            event_handler=launch.event_handlers.OnProcessExit(
                target_action=webots,
                on_exit=[launch.actions.EmitEvent(event=launch.events.Shutdown())],
            )
        )
    ])

if __name__ == "__main__":
    generate_launch_description()