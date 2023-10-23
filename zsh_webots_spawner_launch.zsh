#!/bin/zsh
colcon build --symlink-install


# Source local setup for local variables
source install/local_setup.zsh

# Launch webots_spawner
ros2 launch webots_pkg webots_spawner_launch.py
