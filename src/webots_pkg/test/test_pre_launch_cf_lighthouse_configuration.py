import os
import sys
import pytest

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.lighthouse_classes import ReadLHMem, WriteLHGeoMem, WriteLHMem
from cflib.crazyflie import Crazyflie

import cflib.crtp  # noqa
from cflib.crazyflie.mem import LighthouseMemHelper
from cflib.crazyflie.syncCrazyflie import SyncCrazyflie
from cflib.utils import uri_helper

def test_ReadLHMem(radio_uri = "radio://0/80/2M/E7E7E7E7E7"):
    # 
    uri = uri_helper.uri_from_env(radio_uri)

    # Initialize the low-level drivers
    cflib.crtp.init_drivers()

    temp_LHMem = ReadLHMem(radio_uri)
    # TODO: Finish writing assertions to prove it's being read (requires cf and radio)


# TODO: Write WriteMem test
def test_WriteLHMem():

    # Read the current values
    temp_memory = ReadLHMem(uri)

    # Create a LighthouseBsGeometry object
    bs1geo = LighthouseBsGeometry()


    # Modify the origin and rotation_matrix fields
    bs1geo.origin = [0.0, 0.0, 0.1] # Best guess on wheere the base station is on tb
    bs1geo.rotation_matrix = [
        [0.0, -1.0, 0.0],
        [1.0, 0.0, 0.0],
        [0.0, 0.0, 1.0],
    ]

    # Write geo memory to crazyflie
    geo_dict = {0: bs1geo}
    WriteLHGeoMem(uri, geo_dict)

    # Read new values
    new_memory = ReadLHMem(uri)
    assert 
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
