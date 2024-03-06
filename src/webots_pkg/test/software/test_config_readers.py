    
import os
import pytest
try:
    from webots_pkg.config_readers import import_webots_swarm_config
except ImportError:
    webots_swarm_import_path = os.path.join(os.path.dirname(__file__), "..", "..", "webots_pkg")
    from webots_pkg.config_readers import import_webots_swarm_config


FILE_DIR = os.path.dirname(os.path.abspath(__file__))
SWARM_CONFIG_FILE = os.path.join(FILE_DIR, "resources", "swarm_config.yaml")
SWARM_CONFIG_NO_CF_FILE = os.path.join(FILE_DIR, "resources", "swarm_config_no_cf.yaml")


def test_import_webots_swarm_config():
    swarm = import_webots_swarm_config(SWARM_CONFIG_FILE)
    print(swarm)
    # Add your assertions here to validate the behavior of your code
    assert len(swarm.crazyflies) == 1
    assert len(swarm.turtlebots) == 2
    assert swarm.crazyflies[0].name == "Crazyflie1"
    assert swarm.turtlebots[0].name == "Turtlebot1"

    # ...

if __name__ == "__main__":
    test_import_webots_swarm_config()
