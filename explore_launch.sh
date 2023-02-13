#!/bin/bash
colcon build --symlink-install

gnome-terminal --tab --title="webots" --command="bash -c 'source install/local_setup.bash; ros2 launch crazyflie_ros2_navigation navigation_simulation_launch.py; $SHELL'"
source install/local_setup.bash
gnome-terminal --tab --title="explore" --command="bash -c 'source install/local_setup.bash; sleep 5; ros2 run explore_lite explore --ros-args --params-file ~/cf_webots/src/m-explore-ros2/explore/config/params.yaml; $SHELL'"
gnome-terminal --tab --title="pub_explore" --command="bash -c 'sleep 10; bash publish_explore.sh; $SHELL'"
