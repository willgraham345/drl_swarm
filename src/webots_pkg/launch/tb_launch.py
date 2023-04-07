import os
import pathlib
import launch
from launch import LaunchDescription
from ament_index_python.packages import get_package_share_directory
from webots_ros2_driver.webots_launcher import WebotsLauncher
from webots_ros2_driver.webots_launcher import Ros2SupervisorLauncher
from launch_ros.actions import LoadComposableNodes, Node
from launch.substitutions import LaunchConfiguration


package_dir = get_package_share_directory('webots_pkg')
swarm_classes = pathlib.Path(os.path.join(package_dir, 'resource', 'swarm_classes.py'))
print("Swarm Classes: ", swarm_classes)
import importlib.util
spec = importlib.util.spec_from_file_location("swarm_classes", swarm_classes)
swarm_module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(swarm_module)


cf1 = swarm_module.Crazyflie('cf1', 'radio://0/80/2M/E7E7E7E7E7', [0, 0, 0])
cf2 = swarm_module.Crazyflie('cf2', 'radio://0/80/2M/E7E7E7E7E8', [1, 1, 0])

tb1 = swarm_module.Turtlebot('tb1', 'ROS2_address', [-1, -1, 0])
tb2 = swarm_module.Turtlebot('tb2', 'ROS2_address', [-2, -2, 0])

swarm = swarm_module.Swarm([tb1], [])


# Define helper functions
def get_cf_driver(cf):
    robot_description = pathlib.Path(os.path.join(package_dir, 'resource', 'crazyflie.urdf')).read_text()

    crazyflie_driver = Node(
        package='webots_ros2_driver',
        executable='driver',
        output='screen',
        additional_env={
            'WEBOTS_ROBOT_NAME':cf.name,
            },
        parameters=[
            {'robot_description': robot_description},
        ]
    )
    return crazyflie_driver


def tb_launcher(tb):
    diffdrive_controller_spawner = Node(
        package='controller_manager',
        executable='spawner' if not use_deprecated_spawner_py else 'spawner.py',
        output='screen',
        prefix=controller_manager_prefix,
        arguments=['diffdrive_controller'] + controller_manager_timeout,
    )
    joint_state_broadcaster_spawner = Node(
        package='controller_manager',
        executable='spawner' if not use_deprecated_spawner_py else 'spawner.py',
        output='screen',
        prefix=controller_manager_prefix,
        arguments=['joint_state_broadcaster'] + controller_manager_timeout,
    )


    # turtlebot_driver = Node()
    return [diffdrive_controller_spawner, joint_state_broadcaster_spawner]


# From webots_ros2_driver/robot_launch.py
controller_manager_timeout = ['--controller-manager-timeout', '50']
use_deprecated_spawner_py = 'ROS_DISTRO' in os.environ and os.environ['ROS_DISTRO'] == 'foxy'
controller_manager_prefix = 'python.exe' if os.name == 'nt' else ''


def generate_launch_description():
    package_dir = get_package_share_directory('webots_pkg')
     # THIS is for the robot_driver (unnecessary for webots_pkg)
    ros2_supervisor = Ros2SupervisorLauncher()
    use_sim_time = LaunchConfiguration('use_sim_time', default=True)
    webots = WebotsLauncher(
        world=os.path.join(package_dir, 'worlds', 'turtlebot_apartment.wbt')
    )
    # Robot_state_publisher is a ros2 package that interacts with the Crazyflie urdf to publish the Crazyflie's state
    
    launch_description = [ros2_supervisor, webots]

    # for cf in swarm.crazyflies:
    #     print("cf = ", cf)
    #     robot_state_publisher = Node(
    #         package='robot_state_publisher',
    #         executable='robot_state_publisher',
    #         output='screen',
    #         namespace=cf.name,
    #         parameters=[{
    #             'robot_description': '<robot name=""><link name=""/></robot>'
    #         }],
    #     )
    #     launch_description.append(robot_state_publisher)
    #     launch_description.append(get_cf_driver(cf))
    
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
                'use_sim_time': True
            }],
        )
        launch_description.append(robot_state_publisher)
        tb_nodes = tb_launcher(tb)
        for node in tb_nodes:
            launch_description.append(node)
    event_handler = launch.actions.RegisterEventHandler(
            event_handler=launch.event_handlers.OnProcessExit(
                target_action=webots,
                on_exit=[launch.actions.EmitEvent(event=launch.events.Shutdown())],
            )
        )
    launch_description.append(event_handler)




    return LaunchDescription(launch_description)