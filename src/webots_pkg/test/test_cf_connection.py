#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  import os

"""
Test to confirm computer is correctly connected to Crazyflie

Author: Will Graham"""

import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.lighthouse_classes import ReadLHMem, WriteLHGeoMem, WriteLHMem
from cflib.crazyflie import Crazyflie


import cflib.crtp 
from cflib.crtp.crtpstack import CRTPPacket
from cflib.crtp.crtpstack import CRTPPort
from cflib.utils import uri_helper


def is_stm_connected(radio_uri = "radio://0/80/2M/E7E7E7E7E7"):
    cf_transmitting = False
    transmission_correct = False
    cflib.crtp.init_drivers()
    radioUri = uri_helper.uri_from_env(radio_uri)
    link = cflib.crtp.get_link_driver(radioUri)

    pk = CRTPPacket()
    pk.set_header(CRTPPort.LINKCTRL, 0)  # Echo channel
    pk.data = b'test'
    link.send_packet(pk)
    for _ in range(10):
        pk_ack = link.receive_packet(0.1)
        print(pk_ack)
        if pk_ack is not None:
            cf_transmitting = True
            print("stm transmitting")
    link.close()
    return cf_transmitting 


def test_cf_connection():
    cf_transmitting = is_stm_connected()
    assert cf_transmitting


if __name__ == '__main__':
    test_cf_connection()