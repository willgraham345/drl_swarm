import os
import pathlib
from ament_index_python.packages import get_package_share_directory
from webots_ros2_driver.utils import controller_url_prefix
from launch_ros.actions import Node




def get_cf_driver(cf, package_dir):
    """
    Returns a tuple of nodes for the crazyflie driver and simple mapper, used in spawning new crazyflies
    @param cf: Crazyflie object
    @return: tuple of nodes for the crazyflie driver and simple mapper
    """
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

#TODO: Write tb_driver function