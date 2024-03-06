import yaml
import os

from webots_pkg.swarm_classes import Swarm, cf, tb 


def import_webots_swarm_config(config_file_path : str):
    print(); print()
    print("Starting import_webots_swarm_config")
    print()
    with open(config_file_path, 'r') as file:
        config = yaml.safe_load(file)
    swarm = Swarm()
    
    try:
        for crazyflie in config['robots']['crazyflies']:
            Crazyflie = cf(name=crazyflie['name'], start_position=['translation_float'])
            print(f"Crazyflie = {Crazyflie}")
            print(f"Crazyflie name = {Crazyflie.name}")
            print(f"Crazyflie start_position = {Crazyflie.start_position}")
            assert isinstance(Crazyflie, cf), "Crazyflie instantiated correctly..."
            swarm.add_cf(Crazyflie)

    except Exception as e:
        print(f"No crazyflies found in config file: {e}") 

    try:
        for turtlebot in config['robots']['turtlebots']:
            Turtlebot = tb(name=turtlebot['name'], start_position=['translation_float'])
            assert isinstance(Turtlebot, tb), "Turtlebot instantiated correctly..."
            swarm.add_tb(Turtlebot)
    except Exception as e:
        print(f"No turtlebots found in config file: {e}")
        
    return swarm 