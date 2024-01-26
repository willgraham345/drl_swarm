#!/bin/bash
gnome-terminal --tab bash -c "../../build_repo.sh; exec bash"
source install/local_setup.bash
# TODO: Build testing ros2 script to launch and hover crazyflies