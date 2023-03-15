import os
import pathlib
import launch
from launch import LaunchDescription
from ament_index_python.packages import get_package_share_directory
from webots_ros2_driver.webots_launcher import WebotsLauncher
from webots_ros2_driver.webots_launcher import Ros2SupervisorLauncher
from launch_ros.actions import LoadComposableNodes, Node

# import importlib.util
# # specify the full path of the file containing the class definition
# current_file_path= os.getcwd()
# directory_path = os.path.dirname(current_file_path)
# swarm_path = os.path.join(directory_path, 'resource')
# sys.path.insert(0, directory_path)
# print("Current File Path: ", current_file_path)
# print("Directory Path: ", os.path.dirname(current_file_path))
# print("Swarm Path: ", swarm_path)

# spec = importlib.util.spec_from_file_location("swarm_classes", os.path.join(swarm_path, 'swarm_classes.py'))
# swarm_classes = importlib.util.module_from_spec(spec)
# print("Swarm Classes: ", swarm_classes)
# from resource import * # This imports swarm classes to the file
# import swarm_classes
package_dir = get_package_share_directory('webots_pkg')
swarm_classes = pathlib.Path(os.path.join(package_dir, 'resource', 'swarm_classes.py'))
print("Swarm Classes: ", swarm_classes)
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
    package_dir = get_package_share_directory('webots_pkg')
    robot_description = pathlib.Path(os.path.join(package_dir, 'resource', 'crazyflie.urdf')).read_text() # THIS is for the robot_driver (unnecessary for webots_pkg)
    ros2_supervisor = Ros2SupervisorLauncher()
    webots = WebotsLauncher(
        world=os.path.join(package_dir, 'worlds', 'crazyflie_apartment.wbt')
    )
    # Robot_state_publisher is a ros2 package that interacts with the Crazyflie urdf to publish the Crazyflie's state

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
    for tb in swarm.turtlebots:
        robot_state_publisher = Node(
            package='robot_state_publisher',
            executable='robot_state_publisher',
            output='screen',
            namespace=tb.name,
            parameters=[{
                'robot_description': '<robot name=""><link name=""/></robot>'
            }],
        )



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