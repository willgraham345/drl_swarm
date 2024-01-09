#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  

"""
This file is used to test the functions in webots_pkg/lighthouse_classes.py
Usage: pytest -v test_pre_launch_cf_lighthouse_configuration.py

Author: Will Graham
"""



import os
import sys
import pytest

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.lighthouse_classes import ReadLHMem, WriteLHGeoMem, WriteLHMem
from webots_pkg.lighthouse_functions import get_cf_pose_according_to_lh, get_cf_pose
from cflib.crazyflie import Crazyflie

import cflib.crtp  # noqa
from cflib.crazyflie import Crazyflie
from cflib.crazyflie.log import LogConfig
from cflib.crazyflie.syncCrazyflie import SyncCrazyflie
from cflib.crazyflie.syncLogger import SyncLogger
from cflib.crazyflie.mem import LighthouseBsGeometry
from cflib.crazyflie.mem import LighthouseMemHelper
from cflib.crazyflie.syncCrazyflie import SyncCrazyflie
from cflib.utils import uri_helper


def test_ReadLHMem(radio_uri = "radio://0/80/2M/E7E7E7E7E7"):
    uri = uri_helper.uri_from_env(radio_uri)
    cflib.crtp.init_drivers()

    print()
    print('------------------')
    print("INITIAL MEMORY")
    print()
    temp_LHMem = ReadLHMem(radio_uri)
    assert temp_LHMem.geo_data[0] is not None
    assert temp_LHMem.calib_data[0] is not None


def test_WriteLHMem(radio_uri = "radio://0/80/2M/E7E7E7E7E7"):    # 
    uri = uri_helper.uri_from_env(radio_uri)
    cflib.crtp.init_drivers()

    # Create a LighthouseBsGeometry object
    bs1geo = LighthouseBsGeometry()
    bs1geo.origin = [0.0, 0.0, 1.0] # Best guess on wheere the base station is on tb
    bs1geo.rotation_matrix = [
        [0.0, -1.0, 0.0],
        [1.0, 0.0, 0.0],
        [0.0, 0.0, 7.0],
    ]
    bs1geo.valid = True

    # Read the current values
    print()
    print('------------------')
    print("INITIAL MEMORY FOR WRITING LH CONFIG")
    temp_cf_lh_memory = ReadLHMem(radio_uri)
    print()
    calib_data = temp_cf_lh_memory.calib_data[0]

    # Write geo memory to crazyflie
    geo_dict = {0: bs1geo}
    calib_dict = {0: calib_data}
    WriteLHGeoMem(radio_uri, geo_dict)

    # Read new values
    print()
    print('------------------')
    print("NEW MEMORY AFTER WRITING LH CONFIG")
    print()
    new_memory = ReadLHMem(radio_uri)
    assert new_memory.geo_data[0].origin == bs1geo.origin


def test_get_cf_pose():
    get_cf_pose()
    

def test_get_cf_pose_according_to_lh():
    get_cf_pose_according_to_lh()



if __name__ == "__main__":
    # test_ReadLHMem()
    # test_WriteLHMem()
    # test_get_cf_pose()
    test_get_cf_pose_according_to_lh()