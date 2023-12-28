import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.lighthouse_classes import ReadMem, WriteGeoMem, WriteMem
from cflib.crazyflie import Crazyflie


import cflib.crtp 
from cflib.crtp.crtpstack import CRTPPacket
from cflib.crtp.crtpstack import CRTPPort
from cflib.utils import uri_helper


def is_stm_connected(radio_uri = "radio://0/80/2M/E7E7E7E7E7"):
    result = False
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
        if pk_ack is not None and pk.data == pk_ack.data:
            result = True
            link.close()
    link.close()
    return result


def test_cf_connection():
    result = is_stm_connected()

    assert result == True


if __name__ == '__main__':
    test_cf_connection()