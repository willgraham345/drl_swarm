import os
import sys
import pytest

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.lighthouse_classes import ReadLHMem, WriteLHGeoMem, WriteLHMem
from cflib.crazyflie import Crazyflie

import cflib.crtp  # noqa
from cflib.crazyflie.mem import LighthouseBsGeometry
from cflib.crazyflie.mem import LighthouseMemHelper
from cflib.crazyflie.syncCrazyflie import SyncCrazyflie
from cflib.utils import uri_helper

def test_ReadLHMem(radio_uri = "radio://0/80/2M/E7E7E7E7E7"):
    # 
    uri = uri_helper.uri_from_env(radio_uri)

    # Initialize the low-level drivers
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

    # Initialize the low-level drivers
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



# TODO: Write WriteGeoMem test


#TODO: Test written lh configuration to crazyflie
# def test_cf_lh_config(radio_uri = "radio://0/80/2M"):
#     # Create a Crazyflie object
#     cf = Crazyflie()

#     # Connect to the Crazyflie
#     cf.open_link(radio_uri)

#     # Check if the connection is successful
#     assert cf.is_connected()

#     # Disconnect from the Crazyflie
#     cf.close_link()

if __name__ == "__main__":
    # test_ReadLHMem()
    test_WriteLHMem()
    # test_cf_lh_config()