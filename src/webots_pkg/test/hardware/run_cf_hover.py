#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  

"""
This script is used to test the Crazyflie's hover function, and should be used in a scripting setup.

Make sure that the initial position of the crazyflie is roughly 1/2 a meter down on x axis from lighthouses.

Usage: pytest -v test_cf_hover.py
Author: Will Graham
"""

#RUN_TEST: Test if this code works

import sys
import os
import logging
import time
import json
import cflib.crtp
from cflib.crazyflie import Crazyflie
from cflib.crazyflie.log import LogConfig
from cflib.crazyflie.syncCrazyflie import SyncCrazyflie
from cflib.crazyflie.extpos import Extpos
from cflib.positioning.motion_commander import MotionCommander
from cflib.utils import uri_helper


URI = uri_helper.uri_from_env(default='radio://0/80/2M/E7E7E7E7E7')

DEFAULT_HEIGHT = 0.75

logging.basicConfig(level=logging.ERROR)


position_estimate = [-0.5, 0, 0, 0]

def test_hover_crazyflie(): #FIXME: Remove this test, keep this a script file
    # Initialize the Crazyflie object
    cf = Crazyflie()

    # Set the URI of the Crazyflie
    uri = uri_helper.uri_from_env(default='radio://0/80/2M/E7E7E7E7E7')

    # Connect to the Crazyflie
    cf.open_link(uri)

    time.sleep(1)

    # Takeoff and hover for 5 seconds
    cf.commander.send_hover_setpoint(0, 0, 0, 2.25)

    # Land the Crazyflie
    cf.commander.send_stop_setpoint()

    # Close the connection
    cf.close_link()

    # Exit the test
    sys.exit(0)


def move_up_land_slowly_simple(scf):
    with MotionCommander(scf, default_height=0.5) as mc:
        time.sleep(1)
        mc.up(0.5)
        time.sleep(1)
        mc.land(0.05)

def take_off_simple(scf):
    print("sending external pos")
    # cf = Crazyflie(URI) 
    # extpos = Extpos(cf)
    # extpos.send_extpos(-0.5, 0, 0)
    with MotionCommander(scf, default_height=DEFAULT_HEIGHT) as mc:
        time.sleep(5)

def log_pos_callback(timestamp, data, logconf):
    print(data)
    global position_estimate
    position_estimate[0] = data['stateEstimate.x']
    position_estimate[1] = data['stateEstimate.y']
    position_estimate[2] = data['stateEstimate.z']
    position_estimate[3] = data['stabilizer.yaw']

# RUN_TESTS: Confirm the json file is written correctly
def output_position_estimate(position_estimate):
    timestamp = int(time.time())
    filename = f"cf_hover_trial_{timestamp}.json"

    with open(filename, 'w') as file:
        json.dump(position_estimate, file)

# RUN_TESTS: Confirm the cf can hover when flashed with the correct firmware

if __name__ == '__main__':
    cflib.crtp.init_drivers()

    with SyncCrazyflie(URI, cf = Crazyflie(rw_cache='./cache')) as scf:
        time.sleep(1)

        logconf = LogConfig(name='Position', period_in_ms=10)
        logconf.add_variable('stateEstimate.x', 'float')
        logconf.add_variable('stateEstimate.y', 'float')
        logconf.add_variable('stateEstimate.z', 'float')

        logconf.add_variable('stabilizer.yaw', 'float')
        scf.cf.log.add_config(logconf)

        logconf.data_received_cb.add_callback(log_pos_callback)

        logconf.start()


        take_off_simple(scf)
        # move_linear_simple(scf)
        # move_box_limit(scf)
        logconf.stop()
        time.sleep(1)