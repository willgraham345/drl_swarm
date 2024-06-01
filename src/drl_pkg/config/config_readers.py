import os
import sys
import yaml
import shutil
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from drl_pkg.swarm_classes import cf, tb, Swarm

# Define the paths to the configuration file and the destination directory
dir_path = os.path.dirname(__file__)
DESTINATION_DIR = dir_path
CONFIG_FILE_PATH = os.path.abspath(os.path.join(dir_path, '..', 'config', 'webots_config.yaml'))

def import_yaml_as_swarm(config_file_path: str):
    """
    Import the Webots swarm configuration as a swarm object from a YAML file.
    Will return warnings on missing fields. A successful test of this is outputting
    the swarm object to the console, and the proto string that would be appended to
    the world file.

    Parameters:
        config_file_path (str): The path to the YAML configuration file.

    Returns:
        Swarm: The swarm object containing the TurtleBots and
        Crazyflies defined in the configuration file.
    """
    with open(config_file_path, 'r', encoding="utf-8") as file:
        config = yaml.safe_load(file)
    cf_list = []
    tb_list = []
    try:
        crazyflies = config['robots']['crazyflies']
        for _, crazyflie_info in crazyflies.items():
            name = crazyflie_info['name']
            uri = crazyflie_info['uri']
            translation = crazyflie_info['translation']
            orientation = crazyflie_info['orientation']
            crazyflie = cf(name,translation,URI_address=uri, start_orientation=orientation)
            # cf_proto = create_cf_protos(name, translation)
            cf_list.append(crazyflie)
            print(f"Added Crazyflie {name} to the swarm")
    except KeyError:
        print("No Crazyflies found in the configuration file")
    try:
        turtlebots = config['robots']['turtlebots']
        for _, turtle_info in turtlebots.items():
            name = turtle_info['name']
            ROS2_address = turtle_info['ROS2_address']
            translation = turtle_info['translation']
            orientation = turtle_info['orientation']
            # tb_proto = create_tb_protos(name, translation)
            turtlebot = tb(name,translation, ROS2_address = ROS2_address, start_orientation = orientation)
            tb_list.append(turtlebot)
            print(f"Added Turtlebot {name} to the swarm")
    except KeyError:
        print("No Turtlebots found in the configuration file")

    swarm = Swarm(tb_list, cf_list)
    return swarm


def import_yaml_as_webots_config(config_file_path: str):

    #FIXME: This function isn't correctly implemented, should return a WeBots swarm configuration (protos)

    """
    Import the Webots swarm configuration as a swarm object from a YAML file.
    """
    with open(config_file_path, 'r', encoding="utf-8") as file:
        config = yaml.safe_load(file)
    cf_protos = []
    tb_protos = []
    try:
        crazyflies = config['robots']['crazyflies']

        for _, crazyflie_info in crazyflies.items():
            name = crazyflie_info['name']
            # uri = crazyflie_info['uri']
            translation = crazyflie_info['translation']
            # orientation = crazyflie_info['orientation']
            # crazyflie = cf(name,translation,URI_address=uri, start_orientation=orientation)
            cf_proto = create_cf_protos(name, translation)
            # cf_list.append(crazyflie)
            print(f"Added Crazyflie {name} to the swarm")
    except KeyError:
        print("No Crazyflies found in the configuration file")
    try:
        turtlebots = config['robots']['turtlebots']
        for _, turtle_info in turtlebots.items():
            name = turtle_info['name']
            # ROS2_address = turtle_info['ROS2_address']
            translation = turtle_info['translation']
            # orientation = turtle_info['orientation']
            tb_proto = create_tb_protos(name, translation)
            # turtlebot = tb(name,translation, ROS2_address = ROS2_address, start_orientation = orientation)
            tb_protos.append(tb_proto)
            print(f"Added Turtlebot {name} to the swarm")
    except KeyError:
        print("No Turtlebots found in the configuration file")

    # TODO: Need to fix this back into a WeBots swarm configuration
    swarm = Swarm(cf_protos, tb_protos)
    return swarm


def create_cf_protos(cf_name, start_position):
    """
    Create a Crazyflie prototype with the given name and start position.

    Parameters:
        cf_name (str): The name of the Crazyflie prototype.
        start_position (str): The start position of the Crazyflie prototype.

    Returns:
        str: The Crazyflie prototype template with the provided name and start position.
    """
    cf_template = """
Crazyflie {{
  translation {start_position}
  name "{cf_name}"
  controller "<extern>"
}}
    """
    return cf_template.format(start_position=start_position, cf_name=cf_name)

def create_tb_protos(tb_name, start_position):
    """
    Create a TurtleBot3Burger proto string with the given name and start position.

    Parameters:
        tb_name (str): The name of the TurtleBot.
        start_position (str): The start position of the TurtleBot.

    Returns:
        str: The TurtleBot3Burger proto string.
    """
    tb_template = '''
TurtleBot3Burger {{
  translation {start_position}
  name "{tb_name}"
  controller "<extern>"
  controllerArgs [
      ""
  ]
  extensionSlot [
      Solid {{
          name "imu_link"
      }}
      GPS {{
      }}
      InertialUnit {{
          name ""
      }}
      RobotisLds01 {{
      }}
  ]
}}
'''
    return tb_template.format(start_position=start_position, tb_name=tb_name)
