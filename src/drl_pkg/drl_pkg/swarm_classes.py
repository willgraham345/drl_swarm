#                     ____  _            __          __
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  )
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/

import os
import math
import json
import typing
import sys
import warnings


class cf:
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
        assert isinstance(
            start_position, (list)
        ), f"Start position must be a list or tuple, not {start_position}"
        for coord in start_position:
            assert isinstance(
                coord, (int, float)
            ), f"Start position coordinates must be integers or floats, not {coord}"
        if start_orientation is not None:
            assert isinstance(
                start_orientation, (list)
            ), f"Start orientation must be a list or tuple, not {start_orientation}"
        if URI_address is not None:
            assert isinstance(
                URI_address, str
            ), f"URI address must be a string, not {URI_address}"
        self.name = name
        self.URI_address = URI_address
        self.start_position = start_position
        self.start_orientation = start_orientation

    def get_yaw(self) -> float:
        qw, qx, qy, qz = self.start_orientation
        yaw = math.atan2(
            2.0 * (qy * qz + qw * qx), qw * qw - qx * qx - qy * qy + qz * qz
        )
        return yaw


class tb:
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

    def __init__(
        self,
        name,
        start_position,
        ROS2_address=None,
        start_orientation: list = [0, 0, 0, 1],
    ):
        assert isinstance(name, str), "Name must be a string"
        assert isinstance(
            start_position, (list)
        ), "Start position must be a list or tuple"
        assert isinstance(
            start_position, (list)
        ), f"Start position must be a list or tuple, not {start_position}"
        for coord in start_position:
            assert isinstance(
                coord, (int, float)
            ), f"Start position coordinates must be integers or floats, not {coord}"
        if start_orientation is not None:
            assert isinstance(
                start_orientation, (list)
            ), f"Start orientation must be a list or tuple, not {start_orientation}"
        if ROS2_address is not None:
            assert isinstance(
                ROS2_address, str
            ), f"URI address must be a string, not {ROS2_address}"
        self.name = name
        self.ROS2_address = ROS2_address
        self.start_position = start_position
        self.start_orientation = start_orientation

    def get_yaw(self) -> float:
        """Gets the yaw of the turtlebot

        Returns:
            float: _description_
        """
        qw, qx, qy, qz = self.start_orientation
        yaw = math.atan2(
            2.0 * (qy * qz + qw * qx), qw * qw - qx * qx - qy * qy + qz * qz
        )
        return yaw


class Swarm:
    """
    Swarm class, represents a swarm of turtlebots and crazyflies in both webots and experiments

    :param turtlebots: List of Turtlebot objects
    :type turtlebots: Turtlebot()
    :param crazyflies: List of Crazyflie objects
    :type crazyflies: Crazyflie()
    :param world_file: Path to webots world file we want to edit
    :type world_file: str


    """

    def __init__(self, turtlebots: tb = None, crazyflies: cf = None, world_file=None):
        self.turtlebots = []
        self.crazyflies = []
        if turtlebots is not None:
            for turtle in turtlebots:
                self.turtlebots.append(turtle)
        if crazyflies is not None:
            for crazy in crazyflies:
                self.crazyflies.append(crazy)
        if world_file is None:
            self.world_file = os.path.join(
                os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
                "worlds/apartment.wbt",
            )
        else:
            self.world_file = world_file

    def add_tb(self, tb_in):
        """Adds another turtlebot to the Swarm

        Args:
            tb_in (_type_): _description_
        """
        assert isinstance(tb_in, tb), "Input must be an instance of tb class"
        self.turtlebots.append(tb_in)
        print(
            f"Added turtlebot {tb_in.name} to swarm, current turtlebots: {self.turtlebots}",
            file=sys.stdout,
        )

    def add_cf(self, cf_in):
        """Adds a crazyflie to the Swarm

        Args:
            cf_in (cf): Crazyflie to put in swarm, must be instance of cf class
        """
        assert isinstance(cf_in, cf), "Input must be an instance of cf class"
        self.crazyflies.append(cf_in)
        print(
            f"Added crazyflie {cf_in.name} to swarm, current crazyflies: {self.crazyflies}",
            file=sys.stdout,
        )

    def get_robot_str(self) -> str:
        """Gets name for each robot in the swarm

        Returns:
            str: _description_
        """
        robots = {}
        for turtle in self.turtlebots:
            robots[turtle.name] = {
                "start_position": turtle.start_position,
                "ROS2_address": turtle.ROS2_address,
                "start_orientation": turtle.start_orientation,
            }
        for crazy in self.crazyflies:
            robots[crazy.name] = {
                "start_position": crazy.start_position,
                "URI_address": crazy.URI_address,
                "start_orientation": crazy.start_orientation,
            }
        return json.dumps(robots, sort_keys=True, indent=2)

    def get_robots_dict_list(self) -> dict:
        robots = []
        for turtle in self.turtlebots:
            robots.append(
                {
                    "name": turtle.name,
                    "x_pose": turtle.start_position[0],
                    "y_pose": turtle.start_position[1],
                    "z_pose": turtle.start_position[2],
                    "roll": turtle.start_orientation[0],
                    "pitch": turtle.start_orientation[1],
                    "yaw": turtle.start_orientation[2],
                }
            )
        for crazy in self.crazyflies:
            robots.append(
                {
                    "name": crazy.name,
                    "x": crazy.start_position[0],
                    "y": crazy.start_position[1],
                    "z": crazy.start_position[2],
                    "roll": crazy.start_orientation[0],
                    "pitch": crazy.start_orientation[1],
                    "yaw": crazy.start_orientation[2],
                }
            )
        return robots

    def parse_multi_robot_pose(self) -> dict:
        """
        Parses the pose of multiple robots and returns a dictionary with their positions and orientations.
        Example input: "robot1={x: 1.0, y: 1.0, yaw: 1.5707}; robot2={x: 1.0, y: 1.0, yaw: 1.5707}"
        """
        multirobots = {}
        for turtle in self.turtlebots:
            pose_dict = {
                "x": turtle.start_position[0],
                "y": turtle.start_position[1],
                "z": turtle.start_position[2],
                "roll": 0.0,
                "pitch": 0.0,
                "yaw": turtle.get_yaw(),
            }
            multirobots[turtle.name] = pose_dict
        for crazy in self.crazyflies:
            pose_dict = {
                "x": crazy.start_position[0],
                "y": crazy.start_position[1],
                "z": crazy.start_position[2],
                "roll": 0.0,
                "pitch": 0.0,
                "yaw": crazy.get_yaw(),
            }
            multirobots[crazy.name] = pose_dict
        return multirobots


class SwarmProtoWriteHelper:
    """Class that helps to write and save proto files to the swarm
    """
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
