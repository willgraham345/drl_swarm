
#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  
"""
This file defines the classes used to represent a swarm in ros2 and webots.

Author: Will Graham
"""


import os
import math
import json
import typing
import sys
import warnings


class cf():
    """
    Class that represents a crazyflie in both webots and experiments
    :param name: Name of crazyflie
    :type name: str
    :param start_position: Starting position of crazyflie
    :type start_position: list
    :param URI_address: URI address of crazyflie
    :type URI_address: str
    :param start_orientation: Starting orientation of crazyflie
    :type start_orientation: list

    """
    def __init__(self, name, start_position, URI_address=None, start_orientation=None):
        assert isinstance(name, str), f"Name must be a string, not {name}"
        assert isinstance(start_position, (list)), f"Start position must be a list or tuple, not {start_position}"
        for coord in start_position:
            assert isinstance(coord, (int, float)), f"Start position coordinates must be integers or floats, not {coord}"
        if start_orientation is not None:
            assert isinstance(start_orientation, (list)), f"Start orientation must be a list or tuple, not {start_orientation}"
        if URI_address is not None:
            assert isinstance(URI_address, str), f"URI address must be a string, not {URI_address}"
        self.name = name
        self.URI_address = URI_address
        self.start_position = start_position
        self.start_orientation = start_orientation
    def get_yaw(self) -> float:
        qw, qx, qy, qz = self.start_orientation
        yaw = math.atan2(2.0 * (qy * qz + qw * qx), qw * qw - qx * qx - qy * qy + qz * qz)
        return yaw


class tb(): 
    """
    Class that represents a turtlebot in both webots and experiments
    :param name: Name of turtlebot
    :type name: str
    :param start_position: Starting position of turtlebot
    :type start_position: list
    :param ROS2_address: ROS2 address of turtlebot
    :type ROS2_address: str
    :param start_orientation: Starting orientation of turtlebot
    :type start_orientation: list
    """
    def __init__(self, name, start_position, ROS2_address=None, start_orientation=None):
        assert isinstance(name, str), "Name must be a string"
        assert isinstance(start_position, (list)), "Start position must be a list or tuple"
        assert isinstance(start_position, (list)), f"Start position must be a list or tuple, not {start_position}"
        for coord in start_position:
            assert isinstance(coord, (int, float)), f"Start position coordinates must be integers or floats, not {coord}"
        if start_orientation is not None:
            assert isinstance(start_orientation, (list)), f"Start orientation must be a list or tuple, not {start_orientation}"
        if ROS2_address is not None:
            assert isinstance(ROS2_address, str), f"URI address must be a string, not {ROS2_address}"
        self.name = name
        self.ROS2_address = ROS2_address
        self.start_position = start_position
        self.start_orientation = start_orientation
    def get_yaw(self) -> float:
        qw, qx, qy, qz = self.start_orientation
        yaw = math.atan2(2.0 * (qy * qz + qw * qx), qw * qw - qx * qx - qy * qy + qz * qz)
        return yaw

class Swarm():
        """
        Swarm class, represents a swarm of turtlebots and crazyflies in both webots and experiments
        
        :param turtlebots: List of Turtlebot objects
        :type turtlebots: Turtlebot()
        :param crazyflies: List of Crazyflie objects
        :type crazyflies: Crazyflie()
        :param world_file: Path to webots world file we want to edit
        :type world_file: str


        """
        def __init__(self, turtlebots: tb = None, crazyflies: cf = None, world_file = None):
                self.turtlebots = []
                self.crazyflies = []
                if turtlebots is not None:
                    for tb in turtlebots:
                        self.turtlebots.append(tb)
                if crazyflies is not None:
                    for cf in crazyflies:
                        self.crazyflies.append(cf)
                if world_file is None:
                    self.world_file = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
                         "worlds/apartment.wbt")
                else:
                        self.world_file = world_file
        
        def add_tb(self, tb_in):
            assert isinstance(tb_in, tb), "Input must be an instance of tb class"
            self.turtlebots.append(tb_in)
            print(f"Added turtlebot {tb_in.name} to swarm, current turtlebots: {self.turtlebots}", file=sys.stdout)

        def add_cf(self, cf_in):
            assert isinstance(cf_in, cf), "Input must be an instance of cf class"
            self.crazyflies.append(cf_in)
            print(f"Added crazyflie {cf_in.name} to swarm, current crazyflies: {self.crazyflies}", file=sys.stdout)

        def get_robot_str(self) -> str:
            robots = {}
            for tb in self.turtlebots:
                robots[tb.name] = {
                    "start_position": tb.start_position,
                    "ROS2_address": tb.ROS2_address,
                    "start_orientation": tb.start_orientation
                }
            for cf in self.crazyflies:
                robots[cf.name] = {
                    "start_position": cf.start_position,
                    "URI_address": cf.URI_address,
                    "start_orientation": cf.start_orientation
                }
            return json.dumps(robots, sort_keys=True, indent=2)



class SwarmProtoWriteHelper():
    def __init__(self, cf_protos: list[str], tb_protos: list[str]):
        self.cf_protos = cf_protos
        self.tb_protos = tb_protos








if __name__ == "__main__":
    # Create a swarm of turtlebots and crazyflies
    tb1 = tb("tb1", start_position=[-1.5, -1.5, 0])
    tb2 = tb("tb2", start_position=[-1.5, -2.5, 0])
    cf1 = cf("cf1", start_position=[-2, -3, 0.015])
    cf2 = cf("cf2", start_position=[-2, -2, 0.015])
    # Create swarm
    swarm1 = Swarm([tb1, tb2], [cf1, cf2])
