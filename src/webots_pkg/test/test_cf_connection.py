import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.




# TODO: Write test to connect to crazyflie with cflib
def test_cf_connection(radio_uri = "radio://0/80/2M"):
    # Create a Crazyflie object
    cf = Crazyflie()

    # Connect to the Crazyflie
    cf.open_link(radio_uri)

    # Check if the connection is successful
    assert cf.is_connected()

    # Disconnect from the Crazyflie
    cf.close_link()
