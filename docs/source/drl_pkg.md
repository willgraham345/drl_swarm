# `/src/drl_pkg` Explanation and Table of Contents

Like a typical ROS repository, this repository will be comprised of a `/src`, `build/`, and `install/` folder. The `src/` folder will contain all of the source code for the repository, and the `build/` and `install/` folders will be used to build and install the repository, respectively. The `build/` and `install/` folders will be created when the repository is built for the first time after cloning and are ignored by the `.gitignore` file. We'll focus on the `src/` folder in-depth.

The `data_analysis/` folder is used to store data analysis results from the Vicon system. Dr. Drew should be familiar with some of the figures saved inside. There are figures, plotting scripts, and csv outputs from tests run. This was left in the repository as a potential reference for future testing.

The only exception to this folder is the `data_analysis` folder, which is used to store data analysis results from the Vicon system. Dr. Drew should be familiar with some of the figures saved inside.

## `src/` subdirectories

`drl_pkg`
: - Where most DRL development is located. All launch files can be found here, and more information can be found in the section below.

`mocap` & `mocap_msgs` & `mocap4ros2_vicon`

> - Open-source ROS2 tool used to interface with Vicon motion capture system in Large Robotics Lab.
>   : - Source location: `https://github.com/MOCAP4ROS2-Project`
>       : - Put this within the repo rather than adding it as a native dependency, as there were configuration files that make setup from source much more difficult to control.

`crazyflie_ros2_experimental`

> - Copied from [Dr Kimberly McGuires Experimental Repository](https://github.com/knmcguire/crazyflie_ros2_experimental) as it was the starting point for development. Again, had configuration files that needed to be edited in order to make this repository compile and work correctly. Not necessary for repository to compile, but could be useful for future developers.

`data_analysis`

## `drl_pkg` folder explanation

`config`

> - Holds the configuration yamls used within a few of the launch files. The idea was to create this folder so configuration for experimentation and simulation can be changed on the fly. These yamls can be read and implemented as Ros2 launch parameters.

`hardware_sim_config`

> - This was used to write configuration from files in the `config`, to webots world files in the `world` directory. Webots world files are a *almost* a json, but don't have the first item enclosed in brackets. This folder has the workaround functions necessary for writing a swarm configuration to the Webots world file.

`launch`

> - Standard ros2 launch file folder. For more information on this, read tutorials on the \[ROS2 Tutorials\](<https://docs.ros.org/en/humble/Tutorials/Intermediate/Launch/Launch-Main.html>).

`maps` & `params`

> - Used for nav2 parameters. I wasn't able to get far enough to implement this in a consistent manner.

`resource`

> - Folder that is used to hold additional configuration files, specifically robot urdf files. There is also a `graph_search.py` that was used for a Motion Planning Course. May be useful in exploration development.

`test`

> - Folder that housed useful software/hardware testing files. Useful for making sure hardware is working correctly before testing and as a way to debug active issues. Typically invoked via command line outside directly as a python file. The best file here is the `reset_cf.py` that lets a user reset a Crazyflie using a Crazyradio.

`drl_pkg`

> - Where *all* of the Ros2 nodes are implemented. This will be discussed in depth in the docs.

`worlds`

World files for the webots simulator.

## Repository Table of Contents

```{toctree}
:maxdepth: 1

src_code_docs/classes
src_code_docs/launch_functions
src_code_docs/deprecated
```