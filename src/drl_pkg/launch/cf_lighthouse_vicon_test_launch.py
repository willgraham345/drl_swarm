"""
This launch file creates a ROS 2 system that connects Crazyflie to a lighthouse
mocap system and compares it against a static Vicon system. It includes a static transform,
a foxglove websocket, a recording of the data, transforms to make the crazyflie publish correctly,
and a rviz2 node.
"""
import os
import launch_ros
import yaml
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.actions import ExecuteProcess, IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch_xml.launch_description_sources import XMLLaunchDescriptionSource


def generate_launch_description():
    """
    This will launch a Ros2 system that will connect with a crazyflie using the default
    URI, with it's initial position populated with values from the
    `src/drl_pkg/config/experiment_config.yaml` file.
    These initial position values will also be used in creating a static transformer between the
    'world' and 'odom' frames (this is required for the crazyflie to publish correctly).
    It will also launch a foxglove websocket and vicon driver to record the data.
    Data is recorded and sent to a default rosbag file.

    Usage:
        >>> ros2 launch drl_pkg cf_lighthouse_vicon_test_launch.py

    Args:
        None

    Returns:
        :obj:`vicon_driver_launch`: An included LaunchDescription object from the mocap_vicon_driver
        package. This is activated by the :obj:`start_vicon_publishing` action.
        :obj:`foxglove_websocket`: An included LaunchDescription object from the foxglove_bridge
        package.
        :obj:`crazyflie_node`: Included `cf_publisher_launch` LaunchDescription with parameters as:
        Fly = False, URI = 'radio://0/80/2M/E7E7E7E7E7', config_file = params_file.
        :obj:`static_tf_publisher`: Publishes a static transform between the world and odom frames
        for the crazyflie.
        :obj:`rviz`: Launches the rviz2 node.
        :obj:`start_vicon_publishing`: Activates the vicon driver node.
    """

    package_dir = get_package_share_directory("drl_pkg")
    experiment_config_file_path = os.path.abspath(
        os.path.join(package_dir, "config", "experiment_config.yaml")
    )
    # Include launch description from  mocap_vicon_driver
    mocap_pkg_dir = get_package_share_directory("mocap_vicon_driver")

    vicon_driver_launch = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(mocap_pkg_dir, "launch", "mocap_vicon_driver_launch.py")
        )
    )

    foxglove_websocket = IncludeLaunchDescription(
        XMLLaunchDescriptionSource(
            [
                os.path.join(
                    get_package_share_directory("foxglove_bridge"),
                    "launch",
                    "foxglove_bridge_launch.xml",
                )
            ]
        )
    )

    crazyflie_node = launch_ros.actions.Node(
        package="drl_pkg",
        executable="cf_publisher",
        parameters=[
            {
                "fly": False,
                "config_file": experiment_config_file_path,
                "lh1_pose_frame": "lighthouse1_pose",
                "lh2_pose_frame": "lighthouse2_pose",
                "URI": "radio://0/80/2M/E7E7E7E7E7",
            }
        ],
    )
    with open(experiment_config_file_path, "r") as file:
        config = yaml.safe_load(file)
        for cf in config["robots"]["crazyflies"]:
            if cf["name"] == "cf1":
                initial_translation = [float(x) for x in cf["translation"]]
    static_tf_publisher = launch_ros.actions.Node(
        package="tf2_ros",
        executable="static_transform_publisher",
        output="screen",
        arguments=[
            str(initial_translation[0]),
            str(initial_translation[1]),
            str(initial_translation[2]),
            "0",
            "0",
            "0",
            "world",
            "odom",
        ],
    )

    rviz = launch_ros.actions.Node(
        package="rviz2",
        executable="rviz2",
        output="screen",
    )

    # * Set lifecycle node to start
    start_vicon_publishing = ExecuteProcess(
        cmd=["ros2", "lifecycle", "set", "/mocap_vicon_driver_node", "activate"],
    )

    record_all_nodes = ExecuteProcess(
        cmd=[
            "ros2",
            "bag",
            "record",
            "-a",
            "--output",
            "/home/will/drl_swarm/data_analysis/rotation_matrix_testing"
                +"/flipped_sensor_pos_config/90_pitch_90_yaw/rosbag",
        ],
    )

    ld = LaunchDescription()
    ld.add_action(vicon_driver_launch)
    ld.add_action(crazyflie_node)
    ld.add_action(foxglove_websocket)
    ld.add_action(static_tf_publisher)
    ld.add_action(rviz)
    ld.add_action(start_vicon_publishing)
    ld.add_action(record_all_nodes)

    return ld
