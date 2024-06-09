import os
import sys
import pytest

import numpy as np
from cflib.crazyflie.mem import LighthouseBsCalibration
from cflib.crazyflie import Crazyflie
try:
    from drl_pkg.crazyflie_publisher import (
        LighthouseData,
        LighthouseConfigWriter,
        CrazyfliePublisher,
    )
except ImportError:
    import importlib
    crazyflie_publisher_classes = os.path.join(os.path.dirname(__file__),
        "..", "..", "drl_pkg", "crazyflie_publisher.py")
    spec = importlib.util.spec_from_file_location("config_readers", crazyflie_publisher_classes)
    crazyflie_publisher_classes = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(crazyflie_publisher_classes)
    LighthouseData = crazyflie_publisher_classes.LighthouseData
    LighthouseConfigWriter = crazyflie_publisher_classes.LighthouseConfigWriter 
    CrazyfliePublisher = crazyflie_publisher_classes.CrazyfliePublisher

from geometry_msgs.msg import Pose, Point, Quaternion

@pytest.fixture
def pose_of_zeros():
    """
    Returns a Pose object with all position and orientation values set to zero.

    Returns:
        Pose: A Pose object with all position and orientation values set to zero.
    """
    pose = Pose()
    pose.position.x = 0.0
    pose.position.y = 0.0
    pose.position.z = 0.0
    pose.orientation.x = 0.0
    pose.orientation.y = 0.0
    pose.orientation.z = 0.0
    pose.orientation.w = 1.0
    return pose

@pytest.fixture
def pose_of_ones():
    """
    Returns a Pose object with all position and orientation values set to 1.0.

    Returns:
        Pose: A Pose object with x, y, z, and orientation values set to 1.0.
    """
    pose = Pose()
    pose.position.x = 1.0
    pose.position.y = 1.0
    pose.position.z = 1.0
    pose.orientation.x = 1.0
    pose.orientation.y = 1.0
    pose.orientation.z = 1.0
    pose.orientation.w = 1.0
    return pose

@pytest.fixture
def calib_dict():
    """
    Returns a calibration dictionary for use in testing
    """
    bs1calib = LighthouseBsCalibration()
    bs1calib.sweeps[0].phase = 1.0
    bs1calib.sweeps[0].tilt = 2.0
    bs1calib.sweeps[0].curve = 3.0
    bs1calib.sweeps[0].gibmag = 4.0
    bs1calib.sweeps[0].gibphase = 5.0
    bs1calib.sweeps[0].ogeemag = 6.0
    bs1calib.sweeps[0].ogeephase = 7.0
    bs1calib.sweeps[1].phase = 1.1
    bs1calib.sweeps[1].tilt = 2.1
    bs1calib.sweeps[1].curve = 3.1
    bs1calib.sweeps[1].gibmag = 4.1
    bs1calib.sweeps[1].gibphase = 5.1
    bs1calib.sweeps[1].ogeemag = 6.1
    bs1calib.sweeps[1].ogeephase = 7.1
    bs1calib.uid = 1234
    bs1calib.valid = True

    bs2calib = LighthouseBsCalibration()
    bs2calib.sweeps[0].phase = 1.5
    bs2calib.sweeps[0].tilt = 2.5
    bs2calib.sweeps[0].curve = 3.5
    bs2calib.sweeps[0].gibmag = 4.5
    bs2calib.sweeps[0].gibphase = 5.5
    bs2calib.sweeps[0].ogeemag = 6.5
    bs2calib.sweeps[0].ogeephase = 7.5
    bs2calib.sweeps[1].phase = 1.51
    bs2calib.sweeps[1].tilt = 2.51
    bs2calib.sweeps[1].curve = 3.51
    bs2calib.sweeps[1].gibmag = 4.51
    bs2calib.sweeps[1].gibphase = 5.51
    bs2calib.sweeps[1].ogeemag = 6.51
    bs2calib.sweeps[1].ogeephase = 7.51
    bs2calib.uid = 9876
    bs2calib.valid = True

    # Note: base station ids (channels) are 0-indexed
    calib_dict = {0: bs1calib, 1: bs2calib}
    return calib_dict

# TODO: Write tests for LighthouseConfigWriter
# TODO: Write test for write_lh_geos_to_memory
# TODO: Write test for write_lh_calibs_to_memory
# TODO: Write test for read_lh_geos_from_memory
# TODO: Write test for read_lh_calibs_from_memory
# TODO: Write test for _lh_geo_read_callback
# TODO: Write test for _lh_calib_read_callback
# TODO: Write test for _lh_geo_data_written_callback
# TODO: Write test for _lh_calib_data_written_callback
# TODO: Write test for update_rotation_matrices


def test_lighthouse_config_writer_class(calib_dict):
    """
    Tests the LighthouseConfigWriter class. Contains subfunctions for each individual method.
    """

    def test_lighthouse_config_writer_init(calib_dict):
        """
        Test case for the initialization of the `LighthouseConfigWriter` class.
        """

        try:
            # Create a dictionary of calibration data
            cf = Crazyflie(rw_cache='./cache')
            cf.open_link("radio://0/80/2M/E7E7E7E7E7")

            # Create an instance of LighthouseConfigWriter
            LighthouseConfigWriter(cf, calib_dict)

            # Assert that the class has been initialized correctly
            assert True
        except Exception as e:
            assert False, f"Did not pass, due to {e}"

    def test_update_rotation_matrices(calib_dict):
        # Create a dictionary of calibration data
        cf = Crazyflie(rw_cache='./cache')
        cf.open_link("radio://0/80/2M/E7E7E7E7E7")

        # Create an instance of LighthouseConfigWriter
        writer = LighthouseConfigWriter(calib_dict)

        # Define the new rotation matrices
        rotation_matrices = [
            [[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]],
            [[0.0, 0.0, 1.0], [0.0, 1.0, 0.0], [-1.0, 0.0, 0.0]]
        ]

        # Call the update_rotation_matrices method
        writer.update_rotation_matrices(rotation_matrices)

        # Assert that the rotation matrices have been updated
        assert writer.lh_rotation_matrices == rotation_matrices

    # Class tests
    test_lighthouse_config_writer_init(calib_dict)
    test_update_rotation_matrices(calib_dict)

def test_crazyflie_publisher_class():
    """
    Tests the CrazyfliePublisher class. Contains subfunctions for each individual method.
    """

    def test_crazyflie_publisher_init():
        """
        Test case for the initialization of the `CrazyfliePublisher` class.
        """

        try:
            # Create an instance of CrazyfliePublisher
            CrazyfliePublisher()

            # Assert that the class has been initialized correctly
            assert True
        except Exception as e:
            assert False, f"Did not pass, due to {e}"

    # Class tests
    test_crazyflie_publisher_init()

if __name__ == '__main__':
    # pytest.main()
    test_lighthouse_config_writer_class(calib_dict)
