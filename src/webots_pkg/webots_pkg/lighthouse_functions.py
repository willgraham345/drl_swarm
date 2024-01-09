#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  
"""
#RUN_TEST: Run testing on this code to see if it works

Author: Will Graham
"""


import logging
import time

import cflib.crtp
from cflib.crazyflie import Crazyflie
from cflib.crazyflie.log import LogConfig
from cflib.crazyflie.syncCrazyflie import SyncCrazyflie
from cflib.crazyflie.syncLogger import SyncLogger
from cflib.utils import uri_helper



def log_stab_callback(timestamp, data, logconf):
    print('[%d][%s]: %s' % (timestamp, logconf.name, data))

def simple_log_async(scf, logconf):
    cf = scf.cf
    cf.log.add_config(logconf)
    logconf.data_received_cb.add_callback(log_stab_callback)
    logconf.start()
    time.sleep(5)
    logconf.stop()

def param_stab_est_callback(name, value):
    print('The crazyflie has parameter ' + name + ' set at number: ' + value)


def simple_param_async(scf, groupstr, namestr):
    cf = scf.cf
    full_name = groupstr + '.' + namestr

    cf.param.add_update_callback(group=groupstr, name=namestr,
                                 cb=param_stab_est_callback)
    time.sleep(1)
    cf.param.set_value(full_name, 2)
    time.sleep(1)
    cf.param.set_value(full_name, 1)
    time.sleep(1)

def get_cf_pose(radio_uri = "radio://0/80/2M/E7E7E7E7E7"):
    uri = uri_helper.uri_from_env(radio_uri)
    cflib.crtp.init_drivers()   
    lg_pos = LogConfig(name='Position', period_in_ms=100)
    lg_pos.add_variable('kalman.stateX', 'float')
    lg_pos.add_variable('kalman.stateY', 'float')
    lg_pos.add_variable('kalman.stateZ', 'float')

    with SyncCrazyflie(uri, cf=Crazyflie(rw_cache='./cache')) as scf:
        simple_log_async(scf, lg_pos)

def get_cf_pose_according_to_lh(radio_uri = "radio://0/80/2M/E7E7E7E7E7"):
    uri = uri_helper.uri_from_env(radio_uri)
    cflib.crtp.init_drivers()   
    lg_pos = LogConfig(name='Position', period_in_ms=100)
    lg_pos.add_variable('lighthouse.posX', 'float')
    lg_pos.add_variable('lighthouse.posY', 'float')
    lg_pos.add_variable('lighthouse.posZ', 'float')


    ext_pose_config = LogConfig(name='ext_pos', period_in_ms=100)
    ext_pose_config.add_variable('ext_pos.X', 'float')
    ext_pose_config.add_variable('ext_pos.Y', 'float')
    ext_pose_config.add_variable('ext_pos.Z', 'float')

    with SyncCrazyflie(uri, cf=Crazyflie(rw_cache='./cache')) as scf:
        simple_log_async(scf, ext_pose_config) #TODO: Confirm this is working


if __name__ == '__main__':
    # get_cf_pose()
    # get_cf_pose_according_to_lh()