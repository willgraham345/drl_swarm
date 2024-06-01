import os
import sys
import importlib.util
try:
    from webots_pkg.config.config_readers import import_webots_swarm_config
except ImportError:
    pass
    webots_swarm_import_path = os.path.join(os.path.dirname(__file__),
        "..", "..", "config", "config_readers.py")
    spec = importlib.util.spec_from_file_location("config_readers", webots_swarm_import_path)
    config_readers = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(config_readers)

    import_webots_swarm_config = config_readers.import_yaml_as_swarm

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
dir_path = os.path.dirname(os.path.abspath(__file__))

SWARM_CONFIG_FILE = os.path.join(os.path.dirname(__file__), "testing_yaml.yaml")
# SWARM_CONFIG_NO_CF_FILE = os.path.join(dir_path, "resources", "swarm_config_no_cf.yaml")


def test_import_yaml_as_swarm():
    """
    Test function for importing Webots swarm configuration.

    This function tests the behavior of the `import_yaml_as_swarm` function by
    importing a swarm configuration yaml file and performing assertions to validate the
    expected behavior. Specifically, it tests that the import_webots_swarm_config will 
    return a swarm object with the correct number of turtlebots and crazyflies, and that
    the names and start positions of the robots are correct.

    Args:
        None

    Returns:
        None
    """
    swarm = import_webots_swarm_config(SWARM_CONFIG_FILE)
    print(f"Swarm object: {swarm}")
    print(f"Swarm object: {swarm.turtlebots}")
    print(f"Swarm object: {swarm.crazyflies}")
    # print(swarm.get_robots_dict_list())
    # Add your assertions here to validate the behavior of your code
    assert len(swarm.crazyflies) == 1
    assert len(swarm.turtlebots) == 2
    assert swarm.crazyflies[0].name == "cf1"
    assert swarm.turtlebots[0].name == "tb1"
    assert swarm.crazyflies[0].start_position == [1.5, 1.5, 0.015]

if __name__ == "__main__":
    test_import_yaml_as_swarm()
