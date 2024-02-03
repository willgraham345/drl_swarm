#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  
"""
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
    """
    Callback function for logging stabilization data. Works in conjunction with the simple_log_async function.

    Args:
        timestamp (int): The timestamp of the log message.
        data (str): The log message data.
        logconf (LogConf): The log configuration object.

    Returns:
        None
    """
    print('[%d][%s]: %s' % (timestamp, logconf.name, data))

def simple_log_async(scf, logconf):
    """
    Asynchronously logs data using the provided log configuration.

    Args:
        scf: The scf object representing the Crazyflie connection.
        logconf: The log configuration to use for logging.

    Returns:
        None
    """
    cf = scf.cf
    cf.log.add_config(logconf)
    logconf.data_received_cb.add_callback(log_stab_callback)
    logconf.start()
    time.sleep(5)
    logconf.stop()

def param_stab_est_callback(name, value):
    """
    Callback function for parameter stability estimation. We won't use this function, but it is kept in case parameters are needed
    Works in conjunction with the simple_param_async function.

    Args:
        name (str): The name of the parameter.
        value (str): The value of the parameter.

    Returns:
        None
    """
    print('The crazyflie has parameter ' + name + ' set at number: ' + value)


def simple_param_async(scf, groupstr, namestr):
    """
    Asynchronously sets a parameter value in the Crazyflie firmware. 

    Args:
        scf (object): The Crazyflie connection object.
        groupstr (str): The parameter group.
        namestr (str): The parameter name.

    Returns:
        None
    """
    cf = scf.cf
    full_name = groupstr + '.' + namestr

    cf.param.add_update_callback(group=groupstr, name=namestr,
                                 cb=param_stab_est_callback)
    time.sleep(1)
    cf.param.set_value(full_name, 2)
    time.sleep(1)
    cf.param.set_value(full_name, 1)
    time.sleep(1)

def get_only_cf_kalman_pos(radio_uri = "radio://0/80/2M/E7E7E7E7E7"):

    uri = uri_helper.uri_from_env(radio_uri)
    cflib.crtp.init_drivers()   
    lg_pos = LogConfig(name='Stabilizer', period_in_ms=100)
    lg_pos.add_variable('kalman.stateX', 'float')
    lg_pos.add_variable('kalman.stateY', 'float')
    lg_pos.add_variable('kalman.stateZ', 'float')

    with SyncCrazyflie(uri, cf=Crazyflie(rw_cache='./cache')) as scf:
        simple_log_async(scf, lg_pos)

def get_cf_pose_according_to_lh(radio_uri = "radio://0/80/2M/E7E7E7E7E7"): #FIXME: Determine if this is necessary. We want position from LH, not kalman
    uri = uri_helper.uri_from_env(radio_uri)
    cflib.crtp.init_drivers()   
    lg_pos = LogConfig(name='Lighthouse Position', period_in_ms=100)
    lg_pos.add_variable('lighthouse.posX', 'float')
    lg_pos.add_variable('lighthouse.posY', 'float')
    lg_pos.add_variable('lighthouse.posZ', 'float')


    # ext_pose_config = LogConfig(name='ext_pos', period_in_ms=100)
    # ext_pose_config.add_variable('ext_pos.X', 'float')
    # ext_pose_config.add_variable('ext_pos.Y', 'float')
    # ext_pose_config.add_variable('ext_pos.Z', 'float')

    with SyncCrazyflie(uri, cf=Crazyflie(rw_cache='./cache')) as scf:
        simple_log_async(scf, lg_pos) 

def compare_kalman_to_lh_pos(radio_uri = "radio://0/80/2M/E7E7E7E7E7"):
    uri = uri_helper.uri_from_env(radio_uri)
    cflib.crtp.init_drivers()
    log_config_kal_and_lh = LogConfig(name='Stabilizer', period_in_ms=100)
    log_config_kal_and_lh.add_variable('kalman.stateX', 'float')
    log_config_kal_and_lh.add_variable('kalman.stateY', 'float')
    log_config_kal_and_lh.add_variable('kalman.stateZ', 'float')
    log_config_kal_and_lh.add_variable('lighthouse.x', 'float')
    log_config_kal_and_lh.add_variable('lighthouse.y', 'float')
    log_config_kal_and_lh.add_variable('lighthouse.z', 'float')
    log_config_lh_bs_delta.add_variable('lighthouse.bs_delta', 'float')
    with SyncCrazyflie(uri, cf=Crazyflie(rw_cache='./cache')) as scf:
        simple_log_async(scf, log_config_kal_and_lh)

def get_lh_bs_delta(radio_uri = "radio://0/80/2M/E7E7E7E7E7"):
    uri = uri_helper.uri_from_env(radio_uri)
    cflib.crtp.init_drivers()
    log_config_lh_bs_delta = LogConfig(name='lh_bs_delta', period_in_ms=100)
    with SyncCrazyflie(uri, cf=Crazyflie(rw_cache='./cache')) as scf:
        simple_log_async(scf, log_config_lh_bs_delta)

if __name__ == '__main__':
    get_only_cf_kalman_pos()
    get_cf_pose_according_to_lh()