import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.swarm_classes import Swarm, cf, tb, cf_dict2json, tb_dict2json


# Define Swarm here
def define_swarm():
    cf1 = cf("cf1", [-1, -1, 0.015])
    cf2 = cf("cf2", [-2, -2, 0.015])
    tb1 = tb("tb1", [-1.5, -1.5, 0.015])
    tb2 = tb("tb2", [-2.5, -2.5, 0.015])
    world_file = "worlds/apartment.wbt"
    swarm = Swarm([tb1, tb2], [cf1, cf2], world_file)
    return swarm

def write_swarm_to_json(swarm):
    swarm.write_dict_to_json()

if __name__ == "__main__":
    swarm = define_swarm()
    swarm.write_dict_to_json()