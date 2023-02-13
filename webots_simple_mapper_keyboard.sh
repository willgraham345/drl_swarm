#!/bin/bash
colcon build --symlink-install
gnome-terminal --tab --title="webots" --command="bash -c 'source install/local_setup.bash; ros2 launch crazyflie_ros2_simple_mapper simple_mapper_simulation_launch.py; $SHELL'"
source install/local_setup.bash
gnome-terminal --tab --title="teleop" --command="bash -c 'source install/local_setup.bash; ros2 run teleop_twist_keyboard teleop_twist_keyboard ; $SHELL'"
rviz2
