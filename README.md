# `drl_swarm` Overview
This repo has been Will Graham's MS work from 2022-2024. It is still in development. Installing this repo onto a machine running Ubuntu 22.04 using VSCode is ***highly*** recommended.

You will find docs in the `docs/` folder, with an HTML that can be launched.

## TODO
Things left to do before handing over to Dan
- [ ] Lint all files
  - [ ] webots_pkg
    - [x] config 
    - [x] hardware_sim_config
    - [ ] launch
    - [ ] maps
    - [ ] params
    - [ ] resource
    - [ ] test
    - [ ] webots_pkg
    - [ ] worlds
    - [ ] package.xml
    - [ ] setup.py
- [ ] Make docs for repo using Sphinx
  - [ ] webots_pkg
    - [ ] config 
    - [ ] hardware_sim_config
    - [ ] launch
    - [ ] maps
    - [ ] params
    - [ ] resource
    - [ ] test
    - [ ] webots_pkg
    - [ ] worlds
    - [ ] package.xml
    - [ ] setup.py
- [ ] Make docs for re
- [ ] Create a markdown guide, or possible an html listed in docs
- [ ] Create guide for installing requirements to the repo
  - [ ] Python
  - [ ] ROS
  - [ ] Bitcraze libraries
- [ ] Make diagrams for help on making the repo work

## Repo `src/` Folders
### `webots_pkg`
- The main source for development. All launch files can be found here
#### Files of Note
### `mocap` & `mocap_msgs` & `mocap4ros2_vicon`
- Open-source ROS2 tool used to interface with Vicon motion capture system in Large Robotics Lab. 
- [Source location](https://github.com/MOCAP4ROS2-Project)
  - Put this within the repo rather than adding it as a native dependency, as there were configuration files that make setup from source much more difficult to control.
### `crazyflie_ros2_experimental`
- Copied from [Dr Kimberly McGuires Experimental Repository] (https://github.com/knmcguire/crazyflie_ros2_experimental) as it was the starting point for development. Again, had configuration files that needed to be edited in order to make this repository compile and work correctly. Not necessary for repository to compile, but could be useful for future developers.

### `misc`


### `data_analysis`
- Results from our Vicon tests, primarily conducted through configuration of the `src/webots_pkg/launch/cf_localization_launch.py` launch file.
- Figures, plotting scripts, and csv files of outputs are listed in here. Can be useful when further tested is necessary.
  - As an additional note, Foxglove studio is a helpful software for livestreaming and viewing ROS2 outputs. You'll find these servers referenced throughout some of the launch files. 

----------
# Environment Setup

## VSCode Extensions
1. Better Comments
Name: Better Comments
Id: aaron-bond.better-comments
Description: Improve your code commenting by annotating with alert, informational, TODOs, and more!
Version: 3.0.2
Publisher: Aaron Bond
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments
2. Error Lens
Name: Error Lens
Id: usernamehw.errorlens
Description: Improve highlighting of errors, warnings and other language diagnostics.
Version: 3.16.0
Publisher: Alexander
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens
3. **ROS**
Name: ROS
Id: ms-iot.vscode-ros
Description: Develop Robot Operating System (ROS) with Visual Studio Code.
Version: 0.9.6
Publisher: Microsoft
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=ms-iot.vscode-ros
- Can't stress how helpful this extension is, lets you do some really cool things from the extension page itself. Make sure to read the VSCode guide on setup, as it is will help set up IntelliSense for ROS/ROS2 packages and dependencies. 
4. TODO Tree
Name: Todo Tree
Id: Gruntfuggly.todo-tree
Description: Show TODO, FIXME, etc. comment tags in a tree view
Version: 0.0.226
Publisher: Gruntfuggly
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree

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
    Install using "Installing the Debian Package with the Advanced Packaging Tool (APT)". Not Snap!
## WeBots
1. How to use WeBots in ROS2: https://www.cyberbotics.com/doc/guide/using-ros


