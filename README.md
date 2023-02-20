# Crazyflie_WeBots_SLAM


----------
# Resources
## Dependencies needed for the program
**ROS 2**
```
sudo apt-get install ros-$ROS_DISTRO-tf-transformations
sudo apt install ros-$ROS_DISTRO-navigation2 ros-$ROS_DISTRO-nav2-bringup '~ros-$ROS_DISTRO-turtlebot3-.*'
sudo apt-get install ros-$ROS_DISTRO-webots-ros2

```
**Python**
Should be installed via python3 and pip3 commands
```
pip3 install xacro
sudo pip3 install transforms3d
pip3 install bresenham

```
## Needed Editing for each native machine.
We need to source a local installation of the crazyflie firmware on each machine within each. See instructions here: https://github.com/bitcraze/crazyflie-firmware
-  You will need to follow the instructions on this.
In crazyflie_webots_driver.py (/src/crazyflie_ros2_simulation/crazyflie_ros2_simulation), there is a necessary line to be edited to: 
```
sys.path.append('/home/$USER_NAME$/crazyflie-firmware/build')
# NOTE: The $USER_NAME here doesn't really matter. what matters is that you locally install the crayzflie firmware
# on your local device, and write the filepath to that directory within sys.path append. I did mine in the home 
# directory, but you're welcome to put it somewhere else.
```
where ``$USER_NAME$`` is the name of the user (the important thing here is making sure your crazyflie-firmware directory is sourced correctly. Make sure to have the python bindings set up. (see Crazyflie firmware repository for instructions on how to create python bindings)

## Dependency hyperlinks
1. Installation of Nav2: https://navigation.ros.org/build_instructions/index.html
        Nav2 Base Page: https://navigation.ros.org/index.html
        Nav2 Plugin Tutorial: https://navigation.ros.org/plugin_tutorials/index.html
        
3. Installation of ROS 2 Galactic: https://docs.ros.org/en/galactic/Installation.html
4. Installation of ROS 2 Foxy: https://docs.ros.org/en/foxy/Installation.html
  a. note, we will be using foxy, as it's the only one working with turtlebot
5. Crazyflie Firmware: https://github.com/bitcraze/crazyflie-firmware
6. Crazyradio Firmware: https://github.com/bitcraze/crazyradio-firmware
7. Crazyflie Python Client: https://github.com/bitcraze/crazyflie-clients-python
8. Crazyflie Python Library: https://github.com/bitcraze/crazyflie-lib-python
9. WeBots Installation: https://www.cyberbotics.com/doc/guide/installation-procedure
## WeBots
1. How to use WeBots in ROS2: https://www.cyberbotics.com/doc/guide/using-ros

