import os
import sys
import yaml

from webots_pkg.swarm_classes import Swarm, cf, tb 
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.swarm_classes import Swarm, cf, tb, SwarmProtoWriteHelper

def unpack_cf_config(cf_config: dict):
    # TODO: Implement this function
    raise NotImplementedError

def unpack_tb_config(tb_config: dict):
    # TODO: Implement this function
    raise NotImplementedError

def import_webots_swarm_config(config_file_path: str, robot_types: dict):
    with open(config_file_path, 'r') as file:
        config = yaml.safe_load(file)
    swarm = Swarm()
    
    try:
        for robot_type, class_def in robot_types.items():
            for agent in config['robots'][robot_type]:
                robot = class_def(name = str(agent), start_position=config['robots'][robot_type][agent]['translation'])
                print(f"Robot = {robot}")
                print(f"Robot name = {robot.name}")
                print(f"Robot start_position = {robot.start_position}")
                assert isinstance(robot, class_def), "Robot instantiated correctly..."
                if robot_type == "crazyflies":
                    swarm.add_cf(robot)
                if robot_type == "turtlebots":
                    swarm.add_tb(robot)

    except Exception as e:
        print(f"No {robot_type} found in config file: {e}") 

        
    return swarm