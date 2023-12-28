import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.lighthouse_classes import ReadLHMem, WriteLHGeoMem, WriteLHMem
from cflib.crazyflie import Crazyflie

# ----------------------------------------------
import unittest

import cflib.crtp
from cflib.crtp.crtpstack import CRTPPacket
from cflib.crtp.crtpstack import CRTPPort
from cflib.utils import uri_helper


class TestSingleCfGrounded(unittest.TestCase):
    def setUp(self):
        cflib.crtp.init_drivers()
        self.radioUri = uri_helper.uri_from_env(default='radio://0/80/2M/E7E7E7E7E7')
        self.usbUri = 'usb://0'

    def is_stm_connected(self):
        link = cflib.crtp.get_link_driver(self.radioUri)

        pk = CRTPPacket()
        pk.set_header(CRTPPort.LINKCTRL, 0)  # Echo channel
        pk.data = b'test'
        link.send_packet(pk)
        for _ in range(10):
            pk_ack = link.receive_packet(0.1)
            print(pk_ack)
            if pk_ack is not None and pk.data == pk_ack.data:
                link.close()
                return True
        link.close()
        return False
        # print(pk_ack)
        # return pk_ack is not None

# TODO: Write test to connect to crazyflie with cflib
import struct
import time
import unittest

import numpy as np

import cflib.crtp
from cflib.crtp.crtpstack import CRTPPacket
from cflib.crtp.crtpstack import CRTPPort

# ----------------------------------------------
class TestLink(TestSingleCfGrounded):

    # def test_scan(self):
    #     start_time = time.time()
    #     result = cflib.crtp.scan_interfaces()
    #     end_time = time.time()
    #     uris = [uri for (uri, msg) in result]
    #     self.assertEqual(len(uris), 2)
    #     self.assertIn("radio://*/80/2M/E7E7E7E7E7", uris)
    #     self.assertIn("usb://0", uris)
    #     self.assertLess(end_time - start_time, 2)

    # def test_latency_radio_s4(self):
    #     result = self.latency(self.radioUri, 4)
    #     self.assertLess(result, 8)

    # def test_latency_radio_s28(self):
    #     result = self.latency(self.radioUri, 28)
    #     self.assertLess(result, 8)

    def test_latency_usb_s4(self):
        result = self.latency(self.usbUri, 4, 1000)
        self.assertLess(result, 1)

    def test_latency_usb_s28(self):
        result = self.latency(self.usbUri, 28, 1000)
        self.assertLess(result, 1)

    # def test_bandwidth_radio_s4(self):
    #     result = self.bandwidth(self.radioUri, 4)
    #     self.assertGreater(result, 450)

    # def test_bandwidth_radio_s28(self):
    #     result = self.bandwidth(self.radioUri, 28)
    #     self.assertGreater(result, 450)

    def test_bandwidth_usb_s4(self):
        result = self.bandwidth(self.usbUri, 4, 1000)
        self.assertGreater(result, 1000)

    def test_bandwidth_usb_s28(self):
        result = self.bandwidth(self.usbUri, 28, 1000)
        self.assertGreater(result, 1500)

    def latency(self, uri, packet_size=4, count=500):
        link = cflib.crtp.get_link_driver(uri)
        # # wait until no more packets in queue
        # while True:
        #     pk = link.receive_packet(0.5)
        #     print(pk)
        #     if not pk or pk.header == 0xFF:
        #         break

        pk = CRTPPacket()
        pk.set_header(CRTPPort.LINKCTRL, 0)  # Echo channel

        latencies = []
        for i in range(count):
            pk.data = self.build_data(i, packet_size)

            start_time = time.time()
            link.send_packet(pk)
            while True:
                pk_ack = link.receive_packet(-1)
                if pk_ack.port == CRTPPort.LINKCTRL and pk_ack.channel == 0:
                    break
            end_time = time.time()

            # make sure we actually received the expected value
            i_recv, = struct.unpack('<I', pk_ack.data[0:4])
            self.assertEqual(i, i_recv)
            latencies.append((end_time - start_time) * 1000)
        link.close()
        result = np.min(latencies)
        print('Latency for {} (packet size {} B): {:.2f} ms'.format(uri, packet_size, result))
        return result

    def bandwidth(self, uri, packet_size=4, count=500):
        link = cflib.crtp.get_link_driver(uri, link_error_callback=self.error_cb)
        # # wait until no more packets in queue
        # while True:
        #     pk = link.receive_packet(0.5)
        #     if not pk:
        #         break

        # enqueue packets
        start_time = time.time()
        for i in range(count):
            pk = CRTPPacket()
            pk.set_header(CRTPPort.LINKCTRL, 0)  # Echo channel
            pk.data = self.build_data(i, packet_size)
            link.send_packet(pk)

        # get the result
        for i in range(count):
            while True:
                pk_ack = link.receive_packet(-1)
                if pk_ack.port == CRTPPort.LINKCTRL and pk_ack.channel == 0:
                    break
            # make sure we actually received the expected value
            i_recv, = struct.unpack('<I', pk_ack.data[0:4])
            self.assertEqual(i, i_recv)
        end_time = time.time()
        link.close()
        result = count / (end_time - start_time)
        kbps = (count * packet_size) / 1024 / (end_time - start_time)
        print('Bandwith for {} (packet size {} B): {:.2f} packets/s ({:.2f} kB/s)'.format(
            uri, packet_size, result, kbps))
        return result

    def error_cb(self, error):
        self.assertIsNone(None, error)

    def build_data(self, i, packet_size):
        assert (packet_size % 4 == 0)
        repeats = packet_size // 4
        return struct.pack('<' + 'I'*repeats, *[i]*repeats)


if __name__ == '__main__':
    unittest.main()