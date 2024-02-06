#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  

"""
This file is used to test the functions in webots_pkg/lighthouse_classes.py
Usage: pytest -v test_lighthouse_classes.py

Author: Will Graham
"""



import os
import sys
import pytest
import time
from unittest.mock import Mock, patch

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..')))
from webots_pkg.lighthouse_classes import ReadLHMem, WriteLHGeoMem, WriteLHMem,SyncCrazyflie_WriteLh
from cflib.crazyflie import Crazyflie

import cflib.crtp
from cflib.crazyflie.mem import LighthouseBsGeometry
from cflib.utils import uri_helper
import pytest

LH_Z_OFFSET = 0.1

TESTING_STAND = [-0.65, -0.1, 1.1]

MIDDLE_OF_ROOM = [0.0, 0.0, 0.0]

IN_FRONT = [1, 0, 0]
# ROTATION_MATRIX = [
#     [1.0, 0.0, 0.0],
#     [0.0, 0.0, -1.0],
#     [0.0, 1.0, 0.0],]

PITCH_ROTATION_NEG_90 = [
    [0.0, 0.0, -1.0],
    [0.0, 1.0, 0.0],
    [1.0, 0.0, 0.0],
]
NO_ROTATION_MATRIX = [
    [1.0, 0.0, 0.0],
    [0.0, 1.0, 0.0],
    [0.0, 0.0, 1.0]
]

FINAL_POS = [0.5, 0.5, 1.5]
def test_init_SyncCrazyflie_WriteLh():
    """
    Test the SyncCrazyflie_WriteLh class
    """
    start_time = time.time()
    cflib.crtp.init_drivers()
    initial_position = TESTING_STAND
    # initial_position = MIDDLE_OF_ROOM
    initial_yaw = 0.0
    bs_dict = {0: [0.0, 0.5, LH_Z_OFFSET], 1: [0.0, -0.5, LH_Z_OFFSET]}
    URI = "radio://0/80/2M/E7E7E7E7E7"
    sync_cf = SyncCrazyflie_WriteLh(URI,
                initial_position,
                FINAL_POS,
                initial_yaw,
                bs_dict,
                PITCH_ROTATION_NEG_90)
    # sync_cf.hl_commander_workflow()


if __name__ == "__main__":
    test_init_SyncCrazyflie_WriteLh()