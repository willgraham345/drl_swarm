#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  

"""
This script is used to test the Crazyflie's hover function.

Usage: pytest -v test_cf_hover.py
Author: Will Graham
"""

#RUN_TEST: Test if this code works

import sys
import os
from cflib.crazyflie import Crazyflie
from cflib.utils import uri_helper

def test_hover_crazyflie():
    # Initialize the Crazyflie object
    cf = Crazyflie()

    # Set the URI of the Crazyflie
    uri = uri_helper.uri_from_env(default='radio://0/80/2M/E7E7E7E7E7')

    # Connect to the Crazyflie
    cf.open_link(uri)

    # Takeoff and hover for 5 seconds
    cf.commander.send_hover_setpoint(0, 0, 0, 5000)

    # Land the Crazyflie
    cf.commander.send_stop_setpoint()

    # Close the connection
    cf.close_link()


