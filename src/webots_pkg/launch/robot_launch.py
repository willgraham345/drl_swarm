import os
import pathlib
import launch
from launch import LaunchDescription
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory
from webots_ros2_driver.webots_launcher import WebotsLauncher
from webots_ros2_driver.webots_launcher import Ros2SupervisorLauncher
# from webots_ros2_driver.utils import controller_url_prefix
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

def get_cf_driver(cf_name):
    crazychoir_package_dir = get_package_share_directory('crazychoir')
    robot_description = pathlib.Path(os.path.join(crazychoir_package_dir, 'crazyflie_fpqr.urdf')).read_text()

    crazyflie_driver = Node(
        package = 'webots_ros2_driver',
        executable = 'driver',
        namespace = cf_name,
        output = 'screen',
        additional_env = {
            'WEBOTS_CONTROLLER_URL': cf_name,
        },
        parameters = [
            {'robot_description': robot_description},
        ]
    )
    return crazyflie_driver

def generate_launch_description():
    webots_package_dir = get_package_share_directory('webots_pkg')

    webots = WebotsLauncher(
        world=os.path.join(webots_package_dir, 'worlds', 'swarm_crazyflie_apartment.wbt')
    )
    # I don't think the ros2 supervisor can come before the webots launcher. I'm not sure though.
    ros2_supervisor = Ros2SupervisorLauncher()
    event_handler = launch.actions.RegisterEventHandler(
            event_handler=launch.event_handlers.OnProcessExit(
                target_action=webots,
                on_exit=[launch.actions.EmitEvent(event=launch.events.Shutdown())],
            )
        )
    launch_description = [webots, ros2_supervisor, event_handler]
    # The for loop is working, printing the strings correctly
    for cf in swarm.crazyflies: 
        launch_description.append(get_cf_driver(cf.name))
        launch_description.append(Node(
            package = 'robot_state_publisher',
            executable = 'robot_state_publisher',
            additional_env = {'WEBOTS_ROBOT_NAME': cf.name},
            namespace=cf.name,
            output = 'screen',
            parameters = [
                {'robot_description': '<robot name=""><link name=""/></robot>',}
                ]
            ))

    return LaunchDescription(launch_description)
if __name__ == "__main__":
    generate_launch_description()