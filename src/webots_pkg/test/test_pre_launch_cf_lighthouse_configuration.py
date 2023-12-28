import os
import sys
import pytest

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.lighthouse_classes import ReadMem, WriteGeoMem, WriteMem
from cflib.crazyflie import Crazyflie

import cflib.crtp  # noqa
from cflib.crazyflie import Crazyflie
from cflib.crazyflie.mem import LighthouseMemHelper
from cflib.crazyflie.syncCrazyflie import SyncCrazyflie
from cflib.utils import uri_helper

def test_ReadMem(radio_uri = "radio://0/80/2M"):
    rm = ReadMem(radio_uri)
    # TODO: Finish writing assertions to prove it's being read (requires cf and radio)


# TODO: Write WriteMem test
@pytest.mark.dependency(depends=["test_ReadMem"])
def test_WriteMem(radio_uri = "radio://0/80/2M"):
    # Create a Crazyflie object
    cf = Crazyflie()

    # Connect to the Crazyflie
    cf.open_link(radio_uri)

    # Check if the connection is successful
    assert cf.is_connected()

    # Disconnect from the Crazyflie
    cf.close_link()

    # Create a dictionary of geometry data
    geo_dict = {
        0: LighthouseBsGeometry(
            origin=[1.0, 2.0, 3.0],
            rotation_matrix=[
                [4.0, 5.0, 6.0],
                [7.0, 8.0, 9.0],
                [10.0, 11.0, 12.0],
            ],
            valid=True
        ),
        1: LighthouseBsGeometry(
            origin=[21.0, 22.0, 23.0],
            rotation_matrix=[
                [24.0, 25.0, 26.0],
                [27.0, 28.0, 29.0],
                [30.0, 31.0, 32.0],
            ],
            valid=True
        )
    }
    # use readme to get calib_dict


    WriteMem(uri, geo_dict, calib_dict)
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
