import os
import sys
import pytest

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.lighthouse_classes import WriteGeoMem, WriteMem
from cflib.crazyflie import Crazyflie

import cflib.crtp  # noqa
from cflib.crazyflie import Crazyflie
from cflib.crazyflie.mem import LighthouseMemHelper
from cflib.crazyflie.syncCrazyflie import SyncCrazyflie
from cflib.utils import uri_helper

# TODO: Write ReadMem test

# TODO: Write WriteMem test

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
