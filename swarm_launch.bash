#!/bin/bash
colcon build
source install/local_setup.bash
gnome-terminal --tab --title="webots" --command="bash -c 'source install/local_setup.bash; ros2 launch webots_pkg swarm_launch.py; $SHELL'"
rviz2
