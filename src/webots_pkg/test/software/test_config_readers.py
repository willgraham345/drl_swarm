    
import pytest
from webots_pkg.config_readers import import_webots_swarm_config

def test_import_webots_swarm_config():
    config_file_path = "/path/to/config/file.yaml"
    swarm = import_webots_swarm_config(config_file_path)
    
    # Add your assertions here to validate the behavior of your code
    assert len(swarm.crazyflies) == 2
    assert len(swarm.turtlebots) == 3
    assert swarm.crazyflies[0].name == "Crazyflie1"
    assert swarm.turtlebots[0].name == "Turtlebot1"
    # ...

if __name__ == "__main__":
    pytest.main()
