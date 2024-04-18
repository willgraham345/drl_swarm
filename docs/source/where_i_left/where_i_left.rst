Where I left off
----------------
Where I attempted to modify the source code: `lighthouse-position-est source code change <https://github.com/bitcraze/crazyflie-firmware/blob/9e7e697906eced761d5fd27be4f5d866654da250/src/modules/src/lighthouse/lighthouse_position_est.c#L207-L214>`_

This needs to be removed for yaw estimation to correctly be performed: `yaw calculation <https://github.com/bitcraze/crazyflie-firmware/blob/master/src/utils/src/lighthouse/lighthouse_geometry.c#L169-L201>`_

I wasn't able to figure out how to get the crazyflie to fly with the inverted lighthouse sensor. I built jigs to hold the Crazyflie aboove the lighthouse basestations to make sure that I was getting the correct position calculations from the lighthouse. I tried nearly every rotation matrix, and wasn't ever able to get the data to agree with the Vicon data. I always had one or two of the axes negative (i.e. displacements in one of the axes was negative). This typically manifested as having a correct displacement for the x and y, with a negative displacement for the z. 

I also tried to put a negative sign on a few various locations but didn't have much luck. 

I built testing features and Ros2 launch scripts into the repository that you can repurpose to new testing. 