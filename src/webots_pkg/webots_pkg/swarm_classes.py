
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
import json
import typing


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
        self.name = name
        self.URI_address = URI_address
        self.start_position = start_position
        self.start_orientation = start_orientation


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
        self.name = name
        self.ROS2_address = ROS2_address
        self.start_position = start_position
        self.start_orientation = start_orientation

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
        
        def add_tb(self, tb):
                self.turtlebots.append(tb)
        
        def add_cf(self, cf):
                self.crazyflies.append(cf)



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
