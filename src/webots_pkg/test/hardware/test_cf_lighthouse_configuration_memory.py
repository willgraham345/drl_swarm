#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  

"""
This test ensures that the modified cffirmware has been written to the cf and that the cf is correctly configured to use our lighthouse system. Outputs lighthouse confiugration to command line.

Usage: pytest -v test_pre_launch_cf_lighthouse_configuration.py

Author: Will Graham
"""

import os
import sys

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..')))
from webots_pkg.lighthouse_classes import ReadLHMem

import cflib.crtp  # noqa
from cflib.utils import uri_helper

ROTATION_MATRIX = [
    [0.0, 0.0, -1.0],
    [0.0, 1.0, 0.0],
    [1.0, 0.0, 0.0],]

class TestCfLighthouseConfiguration:
    """
    This class is used to test the configuration of the Crazyflie lighthouse system.
    """
    def dummy_method(self):
        """
        This is a dummy method.
        """
        pass

    def test_rot_matrix(self, radio_uri = "radio://0/80/2M/E7E7E7E7E7"):
        """
        This fixture is used to test the rotation matrix of all basestations to be equal to straight up
        """
        uri = uri_helper.uri_from_env(radio_uri)
        cflib.crtp.init_drivers()

        temp_LHMem = ReadLHMem(radio_uri)

        print()
        print('------------------')
        print("Basestation Memory on CF")
        print()
        print(temp_LHMem.geo_data[0].rotation_matrix)
        print()

        print(temp_LHMem.geo_data[1].rotation_matrix)
        print(temp_LHMem.geo_data[2].rotation_matrix)
        print(temp_LHMem.geo_data[3].rotation_matrix)

        
        # Tests for basestation 1
        assert temp_LHMem.geo_data[0].rotation_matrix == ROTATION_MATRIX

        assert temp_LHMem.geo_data[1].rotation_matrix == ROTATION_MATRIX

        assert temp_LHMem.geo_data[2].rotation_matrix == ROTATION_MATRIX
        
        assert temp_LHMem.geo_data[3].rotation_matrix == ROTATION_MATRIX