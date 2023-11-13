# Project Manager
## Long Term Tests We Want To Run
### Today
- [ ] Hover CF without lighthouse (today)
    - [x] Build cfclient locally in linux (Will's computer, ~/cfclient)
    - Modify cffirmware to enable extra config
    - [ ] Build new PCB :(
- [x] Dive into writing lighthouse configuration in crazyflie. 
  - [ ] See if I can get the crazyflie to use the lighthouse for localization
  - [ ] 3d print a testing stand for lighthouse testing
- [ ] Use lighthouse basestation as reference
    - Just hover, write lh config once and no more
- [ ] Start looking into Vicon Config


### Future
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