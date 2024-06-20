import os
import numpy as np

import yaml
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription 
from launch_ros.actions import Node
from launch.actions import IncludeLaunchDescription, DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
from launch_xml.launch_description_sources import XMLLaunchDescriptionSource

def rotation_matrix_to_quaternion(R):
    """
    Converts from a rotation matrix into a quaternion. Outputs it in the same order as ROS
    (x, y, z, w).
    """
    # Ensure the matrix is a rotation matrix (orthogonal with determinant +1)
    assert np.isclose(np.linalg.det(R), 1.0)
    r11, r12, r13 = R[0][0], R[0][1], R[0][2]
    r21, r22, r23 = R[1][0], R[1][1], R[1][2]
    r31, r32, r33 = R[2][0], R[2][1], R[2][2]

    # Calculate the quaternion components
    qw = 0.5 * np.sqrt(1 + r11 + r22 + r33)
    qx = (r32 - r23) / (4 * qw)
    qy = (r13 - r31) / (4 * qw)
    qz = (r21 - r12) / (4 * qw)

    return np.array([qx, qy, qz, qw])


def read_lighthouse_config_to_pose(lighthouse_config_file: str):
    """
    Reads the lighthouse configuration file and returns the data as a dictionary.

    Returns:
        dict: A dictionary containing the lighthouse configuration data.
    """
    with open(lighthouse_config_file, "r") as file:
        lighthouse_config = yaml.safe_load(file)
    lh0_origin = lighthouse_config["geos"][0]["origin"]
    lh1_origin = lighthouse_config["geos"][1]["origin"]
    lh0_rotation_matrix = lighthouse_config["geos"][0]["rotation"]
    lh1_rotation_matrix = lighthouse_config["geos"][1]["rotation"]
    lh0_quat = rotation_matrix_to_quaternion(lh0_rotation_matrix)
    lh1_quat = rotation_matrix_to_quaternion(lh1_rotation_matrix)

    pose1 = [lh0_origin[0], lh0_origin[1], lh0_origin[2],
        lh0_quat[0], lh0_quat[1], lh0_quat[2], lh0_quat[3]]
    pose2 = [lh1_origin[0], lh1_origin[1], lh1_origin[2],
        lh1_quat[0], lh1_quat[1], lh1_quat[2], lh1_quat[3]]
    return pose1, pose2



def generate_launch_description():
    package_dir = get_package_share_directory('drl_pkg')
    # Define launch arguments
    transform_cmds = []
    lh0_transform_arg = DeclareLaunchArgument(
        'lh0_transform',
        default_value="map_to_lh0",
        description="Transform from the map frame to the first lighthouse pose"
    )
    transform_cmds.append(lh0_transform_arg)
    lh1_transform_arg = DeclareLaunchArgument(
        'lh1_transform',
        default_value="map_to_lh1",
        description="Transform from the map frame to the second lighthouse pose"
    )
    transform_cmds.append(lh1_transform_arg)
    launch_argument = LaunchConfiguration('launch_argument')
    lh1_transform = LaunchConfiguration('lh1_transform')
    lh0_transform = LaunchConfiguration('lh0_transform')

    # Read configuration data for the lighthouse poses
    pkg_dir = get_package_share_directory('drl_pkg')
    config_file_path = os.path.join(pkg_dir,
        "config", 'lighthouse_config.yaml')
    lh0_pose, lh1_pose = read_lighthouse_config_to_pose(config_file_path)
    lh0_x, lh0_y, lh0_z, lh0_qw, lh0_qx, lh0_qy, lh0_qz = lh0_pose
    lh1_x, lh1_y, lh1_z, lh1_qw, lh1_qx, lh1_qy, lh1_qz = lh1_pose

    map_to_lh0_transformer = Node(
        package="tf2_ros",
        executable="static_transform_publisher",
        output="screen",
            arguments=[
                str(lh0_x),
                str(lh0_y),
                str(lh0_z),
                str(lh0_qw),
                str(lh0_qx),
                str(lh0_qy),
                str(lh0_qz),
                "map", "lh0_pose",
            ]
    )
    transform_cmds.append(map_to_lh0_transformer)

    map_to_lh1_transformer = Node(
        package="tf2_ros",
        executable="static_transform_publisher",
        output="screen",
            arguments=[
                str(lh1_x),
                str(lh1_y),
                str(lh1_z),
                str(lh1_qw),
                str(lh1_qx),
                str(lh1_qy),
                str(lh1_qz),
                "map", "lh1_pose",
            ]
    )
    transform_cmds.append(map_to_lh1_transformer)

    lh0_to_vicon_lh0_transformer = Node(
        package="tf2_ros",
        executable="static_transform_publisher",
        output="screen",
            arguments=[
                str(0.0),
                str(0.0),
                str(0.3),
                str(0.0),
                str(0.0),
                str(0.0),
                "lh0_pose", "viconLH0",
            ]
    )
    transform_cmds.append(lh0_to_vicon_lh0_transformer)

    lh1_to_vicon_lh1_transformer = Node(
        package="tf2_ros",
        executable="static_transform_publisher",
        output="screen",
            arguments=[
                str(0.0),
                str(0.0),
                str(0.3),
                str(0.0),
                str(0.0),
                str(0.0),
                "lh1_pose", "viconLH1",
            ]
    )
    transform_cmds.append(lh1_to_vicon_lh1_transformer)


    foxglove_websocket = IncludeLaunchDescription(
        XMLLaunchDescriptionSource(
            [os.path.join(get_package_share_directory('foxglove_bridge'),
            'launch',
            'foxglove_bridge_launch.xml')]
        )
    )

    ld = LaunchDescription()
    for tf_command in transform_cmds:
        ld.add_action(tf_command)
    ld.add_action(foxglove_websocket)
    return ld


if __name__ == "__main__":
    config_file_path = os.path.join(
        os.path.dirname(__file__),
        "..", "config", 'lighthouse_config.yaml'
    )
    lh0_pose, lh1_pose = read_lighthouse_config_to_pose(config_file_path)
    print(f"lh0_pose: {lh0_pose}")
    print(f"lh1_pose: {lh1_pose}")
    print(f"config_file_path = {config_file_path}")
