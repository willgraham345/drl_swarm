Development Environment Setup
=================

VSCode Extensions
-----------------
1. **ROS**
    * Id: ms-iot.vscode-ros
    * Description: Develop Robot Operating System (ROS) with Visual Studio Code.
    * Version: 0.9.6
    * Publisher: Microsoft
    * `Ros VS Marketplace Link <https://marketplace.visualstudio.com/items?itemName=ms-iot.vscode-ros>`_

    * Can't stress how helpful this extension is. It will let you set up Intellisense with different Ros2 packages. This is absolutely a must.

2. Error Lens
    * Id: usernamehw.errorlens
    * Description: Improve highlighting of errors, warnings and other language diagnostics.
    * Version: 3.16.0
    * Publisher: Alexander
    * `Error Lens VS Marketplace Link <https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens>`

3. Better Comments
    * Id: aaron-bond.better-comments
    * Description: Improve your code commenting by annotating with alert, informational, TODOs, and more!
    * Version: 3.0.2
    * Publisher: Aaron Bond
    * `Better Comments VS Marketplace Link <https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments>`

4. TODO Tree
    * Id: Gruntfuggly.todo-tree
    * Description: Show TODO, FIXME, etc. comment tags in a tree view
    * Version: 0.0.226
    * Publisher: Gruntfuggly
    * `TODO Tree VS Marketplace Link <https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree>`


Dependencies needed for the program
-----------------------------------
**ROS 2 Packages**
Installed with apt, make sure to replace $ROS_DISTRO with your ROS 2 distribution (e.g. foxy, galactic, etc.)::

    sudo apt-get install ros-$ROS_DISTRO-tf-transformations
    sudo apt install ros-$ROS_DISTRO-navigation2 ros-$ROS_DISTRO-nav2-bringup '~ros-$ROS_DISTRO-turtlebot3-.*'
    sudo apt-get install ros-$ROS_DISTRO-webots-ros2

**Python**
Should be installed::

    pip3 install xacro
    sudo pip3 install transforms3d
    pip3 install bresenham


Helpful Tools and Software for Development
------------------------------------------
1. Foxglove Studio
    * Description: Foxglove Studio is a free, open-source tool for visualizing and interacting with robotics data. Imagine a better rviz2. 
        * You will find some of the ros2 launch scripts to have foxglove websockets embedded as nodes. This is to allow for real-time visualization of the robot's state. If you don't want to use foxglove, these can be commented out. 
    * Follow install instructions from the website: `Foxglove Studio Website <https://foxglove.dev/studio/>`