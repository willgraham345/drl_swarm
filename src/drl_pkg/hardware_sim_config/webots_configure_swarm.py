#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  

"""
Deprecated script for writing a swarm configuration to a JSON file.

Usage: python3 write_lh_config.py

Author: Will Graham
"""

import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from drl_pkg.swarm_classes import Swarm, cf, tb

def define_swarm():
    """
    Define the swarm configuration.

    Returns:
        swarm (Swarm): The :class:`Swarm` object with defined configuration.
    """
    cf1 = cf("cf1", [-1, -1, 0.015])
    cf2 = cf("cf2", [-2, -2, 0.015])
    tb1 = tb("tb1", [-1.5, -1.5, 0.015])
    tb2 = tb("tb2", [-2.5, -2.5, 0.015])
    world_file = "worlds/apartment.wbt"
    swarm = Swarm([tb1, tb2], [cf1, cf2], world_file)
    return swarm

def write_swarm_to_json(swarm):
    """
    Write the swarm configuration to a JSON file.

    Args:
        swarm (Swarm): The swarm object:class:`Swarm` with defined configuration.
    """
    # TODO: Implement the function to write the swarm configuration to a JSON file
    pass
    swarm.write_dict_to_json()

if __name__ == "__main__":
    swarm = define_swarm()
    swarm.write_dict_to_json()