#!/bin/zsh
colcon build --symlink-install


# Source local setup for local variables
source install/local_setup.zsh

# Launch ROS 2 Instance
ros2 launch webots_pkg webots_world_launch.py -d
