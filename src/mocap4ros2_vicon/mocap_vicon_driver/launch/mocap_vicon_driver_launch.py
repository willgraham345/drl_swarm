# Copyright 2022 Intelligent Robotics Lab
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


import os

from ament_index_python.packages import get_package_share_directory
import launch

from launch import LaunchDescription
from launch.actions import EmitEvent
from launch.actions import SetEnvironmentVariable, DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import LifecycleNode
from launch_ros.events.lifecycle import ChangeState

import lifecycle_msgs.msg


def generate_launch_description():

    params_file_path = os.path.join(get_package_share_directory(
      'mocap_vicon_driver'), 'config', 'mocap_vicon_driver_params.yaml')

    stdout_linebuf_envvar = SetEnvironmentVariable(
        'RCUTILS_LOGGING_BUFFERED_STREAM', '1')

    # print('')
    # print('params_file_path: ', params_file_path)
    # print('')

    driver_node = LifecycleNode(
        name='mocap_vicon_driver_node',
        namespace=LaunchConfiguration('namespace'),
        package='mocap_vicon_driver',
        executable='mocap_vicon_driver_main',
        output='screen',
        parameters=[LaunchConfiguration('config_file')],
    )

    # Make the driver node take the 'configure' transition
    driver_configure_trans_event = EmitEvent(
        event=ChangeState(
            lifecycle_node_matcher=launch.events.matchers.matches_action(driver_node),
            transition_id=lifecycle_msgs.msg.Transition.TRANSITION_CONFIGURE,
        )
    )

    # Make the driver node take the 'activate' transition
    # driver_activate_trans_event = EmitEvent(
    #    event = ChangeState(
    #        lifecycle_node_matcher = launch.events.matchers.matches_action(driver_node),
    #        transition_id = lifecycle_msgs.msg.Transition.TRANSITION_ACTIVATE,
    #     )
    # )

    # Create the launch description and populate
    ld = LaunchDescription()
    ld.add_action(DeclareLaunchArgument('namespace', default_value=''))
    ld.add_action(DeclareLaunchArgument('config_file', default_value=params_file_path))

    ld.add_action(stdout_linebuf_envvar)
    ld.add_action(driver_node)
    ld.add_action(driver_configure_trans_event)
    # ld.add_action(driver_activate_trans_event)

    return ld
