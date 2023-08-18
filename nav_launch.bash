#!/bin/bash
colcon build --symlink-install
source install/local_setup.bash
gnome-terminal --tab --title="webots" --command="bash -c 'source install/local_setup.bash; ros2 launch webots_pkg nav2_launch.py; $SHELL'"
