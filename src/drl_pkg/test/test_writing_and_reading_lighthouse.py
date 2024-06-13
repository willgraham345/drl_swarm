# -*- coding: utf-8 -*-
#
#     ||          ____  _ __
#  +------+      / __ )(_) /_______________ _____  ___
#  | 0xBC |     / __  / / __/ ___/ ___/ __ `/_  / / _ \
#  +------+    / /_/ / / /_/ /__/ /  / /_/ / / /_/  __/
#   ||  ||    /_____/_/\__/\___/_/   \__,_/ /___/\___/
#
#  Copyright (C) 2019 Bitcraze AB
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either version 2
#  of the License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
"""
Example of how to write to the Lighthouse base station geometry
and calibration memory in a Crazyflie
"""

import os
import logging
from threading import Event
import yaml

import cflib.crtp  # noqa
from cflib.crazyflie import Crazyflie
from cflib.crazyflie.mem import LighthouseBsCalibration
from cflib.crazyflie.mem import LighthouseBsGeometry
from cflib.crazyflie.mem import LighthouseMemHelper
from cflib.crazyflie.syncCrazyflie import SyncCrazyflie
from cflib.utils import uri_helper

# Only output errors from the logging framework
logging.basicConfig(level=logging.ERROR)


class ReadMem:
    def __init__(self, uri):
        self._event = Event()

        uri = uri_helper.uri_from_env(default=uri)
        with SyncCrazyflie(uri, cf=Crazyflie(rw_cache="./cache")) as scf:
            helper = LighthouseMemHelper(scf.cf)

            helper.read_all_geos(self._geo_read_ready)
            self._event.wait()

            self._event.clear()

            helper.read_all_calibs(self._calib_read_ready)
            self._event.wait()

    def _geo_read_ready(self, geo_data):
        for id, data in geo_data.items():
            print("---- Geometry for base station", id + 1)
            data.dump()
            print()
        self._event.set()

    def _calib_read_ready(self, calib_data):
        for id, data in calib_data.items():
            print("---- Calibration data for base station", id + 1)
            data.dump()
            print()
        self._event.set()


class WriteMem:
    def __init__(self, uri, geo_dict, calib_dict):
        self._event = Event()

        with SyncCrazyflie(uri, cf=Crazyflie(rw_cache="./cache")) as scf:
            helper = LighthouseMemHelper(scf.cf)

            helper.write_geos(geo_dict, self._data_written)
            self._event.wait()

            self._event.clear()

            helper.write_calibs(calib_dict, self._data_written)
            self._event.wait()

    def _data_written(self, success):
        if success:
            print("Data written")
        else:
            print("Write failed")

        self._event.set()





def read_lighthouse_config(lighthouse_config_file):
    """
    Reads the lighthouse configuration file and returns the data as a dictionary.

    Returns:
        dict: A dictionary containing the lighthouse configuration data.
    """
    with open(lighthouse_config_file, "r") as file:
        lighthouse_config = yaml.safe_load(file)
    bs1geo = LighthouseBsGeometry()
    bs2geo = LighthouseBsGeometry()
    bs1calib = LighthouseBsCalibration()
    bs2calib = LighthouseBsCalibration()
    bs1geo.origin = lighthouse_config["geos"][0]["origin"]
    bs1geo.rotation_matrix = lighthouse_config["geos"][0]["rotation"]
    bs1geo.valid = True
    bs2geo.origin = lighthouse_config["geos"][1]["origin"]
    bs2geo.rotation_matrix = lighthouse_config["geos"][1]["rotation"]
    bs2geo.valid = True
    bs1calib.sweeps[0].phase = lighthouse_config["calibs"][0][
        "sweeps"
    ][0]["phase"]
    bs1calib.sweeps[0].tilt = lighthouse_config["calibs"][0][
        "sweeps"
    ][0]["tilt"]
    bs1calib.sweeps[0].curve = lighthouse_config["calibs"][0][
        "sweeps"
    ][0]["curve"]
    bs1calib.sweeps[0].gibmag = lighthouse_config["calibs"][0][
        "sweeps"
    ][0]["gibmag"]
    bs1calib.sweeps[0].gibphase = lighthouse_config["calibs"][0][
        "sweeps"
    ][0]["gibphase"]
    bs1calib.sweeps[0].ogeemag = lighthouse_config["calibs"][0][
        "sweeps"
    ][0]["ogeemag"]
    bs1calib.sweeps[0].ogeephase = lighthouse_config["calibs"][0][
        "sweeps"
    ][0]["ogeephase"]
    bs1calib.sweeps[1].phase = lighthouse_config["calibs"][0][
        "sweeps"
    ][1]["phase"]
    bs1calib.sweeps[1].tilt = lighthouse_config["calibs"][0][
        "sweeps"
    ][1]["tilt"]
    bs1calib.sweeps[1].curve = lighthouse_config["calibs"][0][
        "sweeps"
    ][1]["curve"]
    bs1calib.sweeps[1].gibmag = lighthouse_config["calibs"][0][
        "sweeps"
    ][1]["gibmag"]
    bs1calib.sweeps[1].gibphase = lighthouse_config["calibs"][0][
        "sweeps"
    ][1]["gibphase"]
    bs1calib.sweeps[1].ogeemag = lighthouse_config["calibs"][0][
        "sweeps"
    ][1]["ogeemag"]
    bs1calib.sweeps[1].ogeephase = lighthouse_config["calibs"][0][
        "sweeps"
    ][1]["ogeephase"]
    bs1calib.uid = lighthouse_config["calibs"][0]["uid"]
    bs1calib.valid = True
    bs2calib.sweeps[0].phase = lighthouse_config["calibs"][1][
        "sweeps"
    ][0]["phase"]
    bs2calib.sweeps[0].tilt = lighthouse_config["calibs"][1][
        "sweeps"
    ][0]["tilt"]
    bs2calib.sweeps[0].curve = lighthouse_config["calibs"][1][
        "sweeps"
    ][0]["curve"]
    bs2calib.sweeps[0].gibmag = lighthouse_config["calibs"][1][
        "sweeps"
    ][0]["gibmag"]
    bs2calib.sweeps[0].gibphase = lighthouse_config["calibs"][1][
        "sweeps"
    ][0]["gibphase"]
    bs2calib.sweeps[0].ogeemag = lighthouse_config["calibs"][1][
        "sweeps"
    ][0]["ogeemag"]
    bs2calib.sweeps[0].ogeephase = lighthouse_config["calibs"][1][
        "sweeps"
    ][0]["ogeephase"]
    bs2calib.sweeps[1].phase = lighthouse_config["calibs"][1][
        "sweeps"
    ][1]["phase"]
    bs2calib.sweeps[1].tilt = lighthouse_config["calibs"][1][
        "sweeps"
    ][1]["tilt"]
    bs2calib.sweeps[1].curve = lighthouse_config["calibs"][1][
        "sweeps"
    ][1]["curve"]
    bs2calib.sweeps[1].gibmag = lighthouse_config["calibs"][1][
        "sweeps"
    ][1]["gibmag"]
    bs2calib.sweeps[1].gibphase = lighthouse_config["calibs"][1][
        "sweeps"
    ][1]["gibphase"]
    bs2calib.sweeps[1].ogeemag = lighthouse_config["calibs"][1][
        "sweeps"
    ][1]["ogeemag"]
    bs2calib.sweeps[1].ogeephase = lighthouse_config["calibs"][1][
        "sweeps"
    ][1]["ogeephase"]
    bs2calib.uid = lighthouse_config["calibs"][1]["uid"]
    bs2calib.valid = True
    geo_dict = {0: bs1geo, 1: bs2geo}
    calib_dict = {0: bs1calib, 1: bs2calib}
    return geo_dict, calib_dict


if __name__ == "__main__":
    # Create lighthouse config file path
    lighthouse_config_file_path = os.path.join(
        os.path.dirname(__file__), "..", "config", "lighthouse_config.yaml"
    )
    test_config_path = os.path.join(
        os.path.dirname(__file__), "software", "testing_lighthouse_config.yaml"
    )
    print("STARTING SCRIPT...")
    # URI to the Crazyflie to connect to
    print("Reading crazyflie memory...")
    uri = uri_helper.uri_from_env(default='radio://0/80/2M/E7E7E7E7E7')

    # Initialize the low-level drivers
    cflib.crtp.init_drivers()

    ReadMem(uri)
    input("Press enter to continue...")

    print("Writing configuration...")
    # Read saved configuration
    geo_dict, calib_dict = read_lighthouse_config(lighthouse_config_file_path)

    # Write to memory
    WriteMem(uri, geo_dict, calib_dict)
    input("Press enter to continue...")

    # Read memory again
    print("Reading memory...")
    ReadMem(uri)
    input("Press enter to finish...")
    print("DONE!")
