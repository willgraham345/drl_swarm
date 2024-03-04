import pytest
from webots_pkg.swarm_classes import Swarm, tb, cf

TB1 = tb("tb1", [0, 0, 0], "tb1_address", [0, 0, 0, 1])
TB2 = tb("tb2", [1, 1, 1], "tb2_address", [0, 0, 0, 1])

CF1 = cf("cf1", [0, 0, 0], "cf1_address", [0, 0, 0, 1])
CF2 = cf("cf2", [1, 1, 1], "cf2_address", [0, 0, 0, 1])

# Test instantiation
def test_swarm_instantiation():
    turtlebots = [...]  # List of Turtlebot objects
    crazyflies = [...]  # List of Crazyflie objects
    world_file = "path/to/world_file"
    swarm = Swarm(turtlebots, crazyflies, world_file)
    assert isinstance(swarm, Swarm)
    assert swarm.turtlebots == turtlebots
    assert swarm.crazyflies == crazyflies
    assert swarm.world_file == world_file

def test_add_tb():
    turtlebots = [TB1]
    crazyflies = []
    swarm = Swarm(turtlebots, crazyflies)
    swarm.add_tb(TB2)
    print("created swarm")

    # Grab turtlebot info from swarm
    pose = swarm.turtlebots[1].start_position 
    yaw = swarm.turtlebots[1].get_yaw()
    print(f'pose: {pose}, yaw: {yaw}')
    assert isinstance(swarm.turtlebots[1], tb)
    assert len(swarm.turtlebots) == 2
    assert pose == [1, 1, 1]
    assert yaw == 0
    with pytest.raises(IndexError):
        print("Testing for IndexError")
        swarm.turtlebots[3]
    with pytest.raises(Exception):
        print("Testing for Exception")
        swarm.add_tb(CF1)
    
def test_add_cf():
    turtlebots = []
    crazyflies = [CF1]
    swarm = Swarm(turtlebots, crazyflies)
    swarm.add_cf(CF2)
    print("created swarm")

    # Grab crazyflie info from swarm
    pose_cf1 = swarm.crazyflies[0].start_position
    yaw_cf1 = swarm.crazyflies[0].get_yaw()
    pose_cf2 = swarm.crazyflies[1].start_position 
    yaw_cf2 = swarm.crazyflies[1].get_yaw()
    print(f'pose_cf1: {pose_cf1}, yaw_cf1: {yaw_cf1}')
    print(f'pose_cf2: {pose_cf2}, yaw_cf2: {yaw_cf2}')
    assert isinstance(swarm.crazyflies[1], cf)
    assert len(swarm.crazyflies) == 2
    assert pose_cf2 == [1, 1, 1]
    assert yaw_cf2 == 0
    with pytest.raises(IndexError):
        print("Testing for IndexError")
        swarm.crazyflies[3]
    with pytest.raises(Exception):
        print("Testing for adding cf when using a turtlebot")
        swarm.add_cf(TB1)
    with pytest.raises(Exception):
        print("Testing for inputting cf object incorrectly")
        swarm.add_cf("cf3")


def test_swarm():
    turtlebots = [TB1, TB2]
    crazyflies = [CF1, CF2]
    swarm = Swarm()
    robot_str = swarm.get_robot_str()
    print("robot_str: ", robot_str)
    print("swarm: ", swarm)
    assert robot_str == "Empty"


    swarm.add_cf(CF1)
    robot_str = swarm.get_robot_str()
    print("robot_str: ", robot_str)
    print("swarm: ", swarm)
    assert robot_str == "cf1=x: 0, y: 0, z: 0, yaw: 0.0;"

    swarm.add_tb(TB1)
    robot_str = swarm.get_robot_str()
    print("robot_str: ", robot_str)
    print("swarm: ", swarm)
    assert robot_str == "cf1=x: 0, y: 0, z: 0, yaw: 0.0;tb1=x: 0, y: 0, z: 0, yaw: 0.0;"





# Run the tests
if __name__ == '__main__':
    pytest.main()