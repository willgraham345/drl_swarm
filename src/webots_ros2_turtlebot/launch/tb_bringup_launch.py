import os
from launch import LaunchDescription
from launch.substitutions import LaunchConfiguration
from launch.actions import DeclareLaunchArgument, LogInfo, IncludeLaunchDescription 
from launch_ros.actions import Node
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch_xml.launch_description_sources import XMLLaunchDescriptionSource

from ament_index_python.packages import get_package_share_directory

TURTLEBOT3_MODEL = 'waffle_pi'
LDS_MODEL = 'LDS_02'
ROS_DOMAIN_ID = '30' # Found this in the bashrc file, may be related to turtlebot bringup

def generate_launch_description():
    model = 'burger'
    world = os.path.join(os.getenv('ROS_PACKAGE_PATH').split(':')[0], 'turtlebot3_gazebo/worlds/empty.world')

    turtlebot3_robot_node = Node(
        package='turtlebot3_bringup',
        executable='robot.launch.py',
        name='turtlebot3_robot',
        output='screen',
        parameters=[{'model': model, 'world': world}]
    )

    return LaunchDescription([turtlebot3_robot_node])