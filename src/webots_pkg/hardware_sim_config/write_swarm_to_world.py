#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  


"""

A file used to write the configuration of our swarm into the json of the WeBots file.
IMPORTANT: This file must match the configuration specified within the launch file.
"""



import os
import sys
import json
import yaml
import shutil
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.swarm_classes import Swarm, cf, tb, SwarmProtoWriteHelper

# TODO: Fix this script. See notes in `config_rules.md` for more details on desired implementation.
# MACROS TO BE SET HERE
CONFIG_FILE_INPUT = "webots_config_no_cf.yaml"
# 1. Set the path to the world file to copy
# 2. Set the path to the world file to write to
# 3. Set the path to the configuration file
# 4. Set the path to the directory where the world file will be copied to




# Other configs
dir_path = os.path.dirname(__file__)
DESTINATION_DIR = dir_path

CONFIG_FILE_PATH = os.path.abspath(os.path.join(dir_path, '..', 'config', 'webots_config.yaml'))


def import_webots_swarm_config(config_file_path : str):
    with open(config_file_path, 'r') as file:
        config = yaml.safe_load(file)
    
    cf_protos = []
    tb_protos = []
    
    for cf in config['robots']['crazyflies']:
        cf_name = cf['name']
        cf_translation = cf['translation']
        cf_proto = create_cf_protos(cf_name, cf_translation)
        cf_protos.append(cf_proto)
    
    for tb in config['robots']['turtlebots']:
        tb_name = tb['name']
        tb_translation = tb['translation']
        tb_proto = create_tb_protos(tb_name, tb_translation)
        tb_protos.append(tb_proto)
    
    world_file_to_copy_path = config['world_file_to_copy_path']
    world_file_to_write_path = config['world_file_to_write_path']
    swarm_proto_helper = SwarmProtoWriteHelper(cf_protos, tb_protos)
    return swarm_proto_helper, world_file_to_write_path, world_file_to_copy_path

def create_cf_protos(cf_name, start_position):
    cf_template = """
Crazyflie {{
  translation {start_position}
  name "{cf_name}"
  controller "<extern>"
}}
    """
    return cf_template.format(start_position=start_position, cf_name=cf_name)

def create_tb_protos(tb_name, start_position):
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

def append_protos_to_world_files(world_files, swarm_config: SwarmProtoWriteHelper):
    for file_path in world_files:
        with open(file_path, 'a') as file:
            file.write("\n")
            for cf_proto in swarm_config.cf_protos:
                file.write(cf_proto)
            for tb_proto in swarm_config.tb_protos:
                file.write(tb_proto)
# Example usage
if __name__ == "__main__":

    swarm_proto_helper, world_file_to_write_path, world_file_to_copy_path = import_webots_swarm_config(CONFIG_FILE_PATH)

    COPIED_FILE = os.path.join( dir_path, world_file_to_copy_path)

    file_path = shutil.copy(COPIED_FILE, DESTINATION_DIR)

    append_protos_to_world_files([file_path], swarm_proto_helper)
