
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
        assert isinstance(start_position, (list)), "Start position must be a list or tuple"
        assert all(isinstance(coord, float) for coord in start_position), "Start position coordinates must be integers or floats"
        assert isinstance(name, str), "Name must be a string"
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
        assert isinstance(start_position, (list)), "Start position must be a list or tuple"
        assert all(isinstance(coord, float) for coord in start_position), "Start position coordinates must be integers or floats"
        assert isinstance(name, str), "Name must be a string"
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
            robot_str = ""
            try:
                if self.crazyflies == []: 
                    print("No crazyflies found in swarm during get_robot_str", file=sys.stdout)
                else:
                    for cf in self.crazyflies:
                            robot_str += f"{cf.name}="
                            robot_str+= f"x: {cf.start_position[0]}, y: {cf.start_position[1]}, z: {cf.start_position[2]}, yaw: {cf.get_yaw()};"
            except Exception as e:
                print(f"Error in get_robot_str: {e}", file=sys.stdout)
            try:
                if self.turtlebots == []:
                    print("No turtlebots found in swarm during get_robot_str", file = sys.stdout)
                else:
                    print("hitting turtlebot loop")
                    for tb in self.turtlebots:
                            robot_str += f"{tb.name}="
                            robot_str+= f"x: {tb.start_position[0]}, y: {tb.start_position[1]}, z: {tb.start_position[2]}, yaw: {tb.get_yaw()};"
            except Exception as e:
                print(f"Error in get_robot_str: {e}", file=sys.stdout)
            
            if robot_str == "" :
                print("No robots found in swarm during get_robot_str", file=sys.stdout)
                robot_str = "Empty"
            return robot_str



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
