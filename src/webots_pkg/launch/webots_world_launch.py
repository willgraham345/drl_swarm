import os

import launch
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from webots_ros2_driver.webots_launcher import WebotsLauncher
from webots_ros2_driver.webots_controller import WebotsController

package_dir = get_package_share_directory('webots_pkg')
def generate_launch_description():
    """
    Launches the webots world and the ros2 supervisor
    """
    # THIS is for the robot_driver (unnecessary for webots_pkg)
    webots = WebotsLauncher(
        world=os.path.join(package_dir, 'worlds', 'apartment.wbt'),
        mode=''
    )

    webots = WebotsLauncher(
        world=os.path.join(package_dir, 'worlds', 'apartment.wbt'),
        ros2_supervisor=True
    )
    # Add event handler so everything shuts down on Webots exit
    event_handler = launch.actions.RegisterEventHandler(
            event_handler=launch.event_handlers.OnProcessExit(
                target_action=webots,
                on_exit=[launch.actions.EmitEvent(event=launch.events.Shutdown())],
            )
        )


    return LaunchDescription([
        webots,
        webots._supervisor,
        event_handler,
    ])


if __name__ == "__main__":
    generate_launch_description()
