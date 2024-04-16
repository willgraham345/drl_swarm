Start Here
==========

Knowledge/experience prerequisites to development on this repository:
---------------------------------------------------------------------
    * **Programming in Python**: You do not need an expert, but should have a good grasp on basics of Python programming. Namely, object-oriented programming, virtual environments and package management, and basic data structures. There are about a million resources for learning Python and I'll let you find one you like. 
    * **ROS / ROS2**: For better or worse, this was developed using ROS2. You should have a basic understanding of ROS2, including how to create packages, nodes, and topics. Additionally, you *really* should have some knowledge of launch files, including the debugging flag and how to navigate your way around the ROS2 ecosystem. I *highly* recommend going through the `Ros2 Humble Tutorial <https://docs.ros.org/en/humble/Tutorials.html>`_ from start to finish. This is a fantastic guide that really gives you a start on understanding ROS2. I find myself back here consistently as I debug and develop. 
    * **Bitcraze Software/Hardware**: I'd be shocked if you have expereince in this area, but kudos if you have it! The main repositories you should be familiar with are the `crazyflie-firmware`, `crazyflie-lib-python`, and the `crazyradio-firmware`. If you have an understanding of this, GREAT. If not, you'll find it in the `Bitcraze Guide`. or on `Bitcraze's Github <https://github.com/bitcraze>`_. 
        * Note: Bitcraze has guides on how to understand and use these repositories which is separate from the company repository. 

    * **Lighthouse Positioning System**: You should have a basic understanding of how the lighthouse positioning system works. The links below have been the most helpful to me on learning and understanding the system. 
        * `Lighthouse Positioning System <https://www.bitcraze.io/documentation/system/positioning/ligthouse-positioning-system/>`_
        * `Lighthouse System Overview <https://www.bitcraze.io/documentation/repository/crazyflie-firmware/master/functional-areas/lighthouse/system_overview/>`_
            * The best link as far as the math and theory behind the system. Make sure to click on all links within this section. 
        * `Getting Started with the Lighthouse System <https://www.bitcraze.io/documentation/tutorials/getting-started-with-lighthouse/>`_
            * Has useful info on using the crazyflie client. 



Where I left off
----------------
Where I attempted to modify the source code: `lighthouse-position-est source code change <https://github.com/bitcraze/crazyflie-firmware/blob/9e7e697906eced761d5fd27be4f5d866654da250/src/modules/src/lighthouse/lighthouse_position_est.c#L207-L214>`_

This needs to be removed for yaw estimation to correctly be performed: `yaw calculation <https://github.com/bitcraze/crazyflie-firmware/blob/master/src/utils/src/lighthouse/lighthouse_geometry.c#L169-L201>`_

I wasn't able to figure out how to get the crazyflie to fly with the inverted lighthouse sensor. I built jigs to hold the Crazyflie aboove the lighthouse basestations to make sure that I was getting the correct position calculations from the lighthouse. I tried nearly every rotation matrix, and wasn't ever able to get the data to agree with the Vicon data. I always had one or two of the axes negative (i.e. displacements in one of the axes was negative). This typically manifested as having a correct displacement for the x and y, with a negative displacement for the z. 

I also tried to put a negative sign on a few various locations but didn't have much luck. 

I built testing features and Ros2 launch scripts into the repository that you can repurpose to new testing. 


Before exploring repository, I'd highly recommend setting up your computer and IDE with instructions found in :doc:`environment_setup`.

.. 