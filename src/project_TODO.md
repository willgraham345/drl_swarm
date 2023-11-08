# Project Manager
## Long Term Tests We Want To Run
### Next up
- Hover CF without lighthouse (today)
    - Center of mass stuff (balancing the battery)
    - Modify cffirmware to enable extra config
### Future
- Hover CF, and use lighthouse basestation as reference
    - Just hover, write lh config once and no more

- Test moving tb linearly writing lh config once at end

- Test moving tb linearly with 1 Hz update to cf

- Test moving tb radially with 1 Hz update to cf


## Progress/TODO
1. Write testing framework for running the ROS2 test, and recording data
2. Get experimental setup
3. Put 3d prints on TB's
4. Get wifi running on 2nd tb


# Data out from each test
Position vs time of CF


## Questions to Answer
- How do we synchronize time with Vicon machine?
	- First movement crazyflie off the ground?
- How do we gain reliable information on how much drift is present when TB is moving?
	- I think we'll need to design some testing apparatus to make that work. 