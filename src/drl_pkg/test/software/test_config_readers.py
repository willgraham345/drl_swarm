    
import os
import sys
import pytest
try:
    from webots_pkg.config.config_readers import import_webots_swarm_config
except ImportError:
    webots_swarm_import_path = os.path.join(os.path.dirname(__file__), "..", "..", "config", "config_readers.py")
    from config.config_readers import import_webots_swarm_config

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.swarm_classes import Swarm, cf, tb, SwarmProtoWriteHelper

dir_path = os.path.dirname(os.path.abspath(__file__))
SWARM_CONFIG_FILE = os.path.join(dir_path, "resources", "swarm_config.yaml")
SWARM_CONFIG_NO_CF_FILE = os.path.join(dir_path, "resources", "swarm_config_no_cf.yaml")


robot_types = {
    "crazyflies": cf,
    "turtlebots": tb
}

def test_import_webots_swarm_config():
    swarm = import_webots_swarm_config(SWARM_CONFIG_FILE, robot_types)
    print(swarm)
    # Add your assertions here to validate the behavior of your code
    assert len(swarm.crazyflies) == 1
    assert len(swarm.turtlebots) == 2
    assert swarm.crazyflies[0].name == "cf1"
    assert swarm.turtlebots[0].name == "tb1"

    # ...

if __name__ == "__main__":
    test_import_webots_swarm_config()
