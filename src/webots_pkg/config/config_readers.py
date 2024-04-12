import os
import sys
import yaml
import shutil
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.swarm_classes import cf, tb, Swarm

# Define the paths to the configuration file and the destination directory
dir_path = os.path.dirname(__file__)
DESTINATION_DIR = dir_path
CONFIG_FILE_PATH = os.path.abspath(os.path.join(dir_path, '..', 'config', 'webots_config.yaml'))

def import_webots_swarm_config(config_file_path: str, ):
    """
    Import the Webots swarm configuration from a YAML file. This is a versatile function that can be used to import a variety of robots by passing in a type with the title of the robots. 

    Parameters:
        config_file_path (str): The path to the YAML configuration file.

    Returns:
        tuple: A tuple containing the following:
            - swarm_proto_helper (SwarmProtoWriteHelper): An instance of the SwarmProtoWriteHelper class.
            - world_file_to_write_path (str): The path to the world file to write.
            - world_file_to_copy_path (str): The path to the world file to copy.
    """
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

    swarm = Swarm(cf_protos, tb_protos)
