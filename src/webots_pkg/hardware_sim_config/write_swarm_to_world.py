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
import shutil
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.swarm_classes import Swarm, cf, tb, Swarm_config_storage

# Other configs
dir_path = os.path.dirname(__file__)
COPIED_FILE = os.path.join( dir_path, '..', 'worlds', 'base_worlds', 'apartment.wbt')
DESTINATION_DIR = dir_path

# Macros for swarm configuration
CF1_NAME = "cf1"
CF1_URI = ""
CF1_TRANSLATION = "-1 -1 0.015"
CF1_ORIENTATION = [0, 0, 0, 1]

CF2_NAME = "cf2"
CF2_URI = ""
CF2_TRANSLATION = "-2 -2 0.015"
CF2_ORIENTATION = [0, 0, 0, 1]


TB1_NAME = "tb1"
TB1_TRANSLATION = "-1.5 -1.5 0.015"
TB1_ORIENTATION = [0, 0, 0, 1]

TB2_NAME = "tb2"
TB2_TRANSLATION = "-2.5 -2.5 0.015"
TB2_ORIENTATION = [0, 0, 0, 1]

world_files = "apartment.wbt"





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

def append_json_to_world_files(world_files, swarm_config: Swarm_config_storage):
    for file_path in world_files:
        with open(file_path, 'a') as file:
            file.write("\n")
            for cf_proto in swarm_config.cf_protos:
                file.write(cf_proto)
            for tb_proto in swarm_config.tb_protos:
                file.write(tb_proto)
# Example usage
if __name__ == "__main__":
    # cf1_dict = create_cf_dict(CF1_NAME, CF1_TRANSLATION)
    # cf2_dict = create_cf_dict(CF2_NAME, CF2_TRANSLATION)

    cf1_proto= create_cf_protos(CF1_NAME, CF1_TRANSLATION)
    cf2_proto= create_cf_protos(CF2_NAME, CF2_TRANSLATION)
    tb1_proto= create_tb_protos(TB1_NAME, TB1_TRANSLATION)
    tb2_proto= create_tb_protos(TB2_NAME, TB2_TRANSLATION)

    swarm = Swarm_config_storage([cf1_proto, cf2_proto], [tb1_proto, tb2_proto])


    file_path = shutil.copy(COPIED_FILE, DESTINATION_DIR)

    append_json_to_world_files([file_path], swarm)
