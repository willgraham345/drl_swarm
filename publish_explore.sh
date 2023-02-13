#!/bin/bash
source install/local_setup.bash
ros2 topic pub -r .15 /explore/resume std_msgs/msg/Bool "{data: True}"
