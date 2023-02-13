# Crazyflie_WeBots_SLAM


# Project Management on Repo
### TODO
- Give GitHub access for everyone
- Run Nav2 within WeBots
- 
### In Progress

### Rules for Updating Repo
- Make sure to delete all folders except for src and bash scripts. This will keep it so we can build on local machines without issues.
### Bash Scripts Guide
- **explore_launch.sh = In prgoress. Supposed to launch a hardware crazyflie with exploration and navigation algorithms**
- **hardware_simple_mapper_keyboard.sh**
  - Launches a crazyflie with SLAM mapping, driven through twist commands (typically a teleop twist keyboard)
- **webots_simple_mapper_keyboard.sh**
  - Same thing as hardware mapper, but in WeBots simulator

### Guide to crazyflie_ros2_experimental (from Dr. Kimberly McGuire)
- **crazyflie_ros2_simulation**
  - The go-between for WeBots and ROS2
  - Folders for the world files, and different crazyflie instances within WeBots
    - Worlds files are specific to the WeBots environment
  - This package is referenced for anything involved with simulation
- **crazyflie_ros2_slam**
  - Package responsible for all SLAM capabilities. This will deal with both real and simulated launches. 
  - Has mapper parameters for asynchronous mapping.
- **crazyflie_ros2_navigation**
  - The nav2-capable package that we'll be using. This has two launch files which handle real and simulated tests, respectively. 
  - Important file is the nav2_params.yaml. This has the configuration files nav2 will draw from in order to create our environment. 
- crazyflie_ros2_simple_mapper
  - simple telemetry operation for a mapping. This is good for a quick system recognition.
- crazyflie_ros2
  - Has crazyflie_publisher py & launch files. This handles publishing a real crazyflie's data.
- crazyflie_ros2_description
  - Handles Rviz2 launch(I think)

----------
# Resources
## Dependencies needed for the program
**ROS 2**
```
sudo apt-get install ros-<ros_distro>-tf-transformations
sudo apt install ros-<distro>-navigation2 ros-<distro>-nav2-bringup '~ros-<distro>-turtlebot3-.*'
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
In crazyflie_webots_driver.py, there is a necessary line to be edited to: 
```
sys.path.append('/home/$USER_NAME$/crazyflie-firmware')
```
where $USER_NAME$ is the name of the user (the important thing here is making sure your crazyflie-firmware directory is sourced correctly. Make sure to have the python bindings set up. (see Crazyflie firmware repository for instructions on how to create python bindings)

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
## Crazyflie Links
1. Overview of Bitcraze Repositories: https://www.bitcraze.io/documentation/repository/
2. How to set up a Crazyflie: https://www.bitcraze.io/documentation/tutorials/getting-started-with-crazyflie-2-x/#config-client
3. Flashing to a crazyflie: https://www.bitcraze.io/documentation/repository/crazyflie-firmware/master/building-and-flashing/build/
4. Crazyflie Toolbelt Repo: https://github.com/bitcraze/toolbelt
## Repositories of Note
1. Bitcraze Researcher Repository: https://github.com/knmcguire/crazyflie_ros2_experimental

## Turtletbot Information
1. Tutorial on Navigating a Turtlebot with Nav2: https://docs.omniverse.nvidia.com/app_isaacsim/app_isaacsim/tutorial_ros2_navigation.html
(note, this might not be the best resource. I haven't tested it yet)
## WeBots
1. How to use WeBots in ROS2: https://www.cyberbotics.com/doc/guide/using-ros

## Future Work
1. Potential Repo we can model our RRT after: https://github.com/robo-friends/m-explore-ros2
2. 