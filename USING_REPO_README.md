
# Project Management on Repo
### TODO
- Flip lighthouse within crazyflie-firmware 
### In Progress

### Rules for Updating Repo
- Make sure to delete all folders except for src and bash scripts. This will keep it so we can build on local machines without issues.
- **Branches naming scheme**:
  - name_description
### Bash Scripts Guide
- **webots_simple_mapper_keyboard.sh**
  - Same thing as hardware mapper, but in WeBots simulator
- **webots_navigation.sh**
  - Launches a Nav2 system using slam (according to file in /crazyflie_ros2_experimental/cr)
- explore_launch.sh = In progress. Supposed to launch a hardware crazyflie with exploration and navigation algorithms
- hardware_simple_mapper_keyboard.sh
  - Launches a crazyflie with SLAM mapping, driven through twist commands (typically a teleop twist keyboard)

  ### Guide to crazyflie_ros2_experimental (from Dr. Kimberly McGuire)
- **crazyflie_ros2_simulation**
  - The go-between for WeBots and ROS2
  - Folders for the world files, and different crazyflie instances within WeBots
    - Worlds files are specific to the WeBots environment
  - This package is referenced for anything involved with simulation
- **crazyflie_ros2_slam**
  - Package responsible for all SLAM capabilities. This will deal with both real and simulated launches. 
  - Has mapper parameters for asynchronous mapping.
- **crazyflie_ros2_navigation**eE
  - The nav2-capable package that we'll be using. This has two launch files which handle real and simulated tests, respectively. 
  - Important file is the nav2_params.yaml. This has the configuration files nav2 will draw from in order to create our environment. 
- crazyflie_ros2_simple_mapper
  - simple telemetry operation for a mapping. This is good for a quick system recognition.
- crazyflie_ros2
  - Has crazyflie_publisher py & launch files. This handles publishing a real crazyflie's data.
- crazyflie_ros2_description
  - Handles Rviz2 launch(I think)



## Crazyflie Links
1. Overview of Bitcraze Repositories: https://www.bitcraze.io/documentation/repository/
2. How to set up a Crazyflie: https://www.bitcraze.io/documentation/tutorials/getting-started-with-crazyflie-2-x/#config-client
3. Flashing to a crazyflie: https://www.bitcraze.io/documentation/repository/crazyflie-firmware/master/building-and-flashing/build/
4. Crazyflie Toolbelt Repo: https://github.com/bitcraze/toolbelt
5. Crazyflie cfclient GUI: https://www.bitcraze.io/documentation/repository/crazyflie-clients-python/master/userguides/userguide_client/
## Repositories of Note
1. Bitcraze Researcher Repository: https://github.com/knmcguire/crazyflie_ros2_experimental

## Turtletbot Information
1. Tutorial on Navigating a Turtlebot with Nav2: https://docs.omniverse.nvidia.com/app_isaacsim/app_isaacsim/tutorial_ros2_navigation.html
(note, this might not be the best resource. I haven't tested it yet)

## Future Work
1. Potential Repo we can model our RRT after: https://github.com/robo-friends/m-explore-ros2
2. Modifying Lighthouse Configuration

  a. https://github.com/bitcraze/crazyflie-firmware/blob/master/src/utils/src/lighthouse/lighthouse_geometry.c#L169-L201
  b. https://github.com/bitcraze/crazyflie-firmware/blob/9e7e697906eced761d5fd27be4f5d866654da250/src/modules/src/lighthouse/lighthouse_position_est.c#L207-L214