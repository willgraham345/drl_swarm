#!/bin/bash
# TODO_tests: Test and make sure this stuff is working. 



# Specify the path to the workspace you want to source
object_name="$1"

# Source the workspace
source "~mocap_ws/install/local_setup.zsh"

# Launch the Vicon listener
zsh ~/mocap_ws/signal_start.zsh

# Wait for a moment to ensure the listener is up and running
sleep 5

zsh ~/mocap_ws/start_driver.zsh
