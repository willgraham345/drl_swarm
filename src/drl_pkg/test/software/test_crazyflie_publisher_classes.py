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

IDENTITY_MATRIX = [
    [1.0, 0.0, 0.0],
    [0.0, 1.0, 0.0],
    [0.0, 0.0, 1.0]
]

ALL_CLOSE_TOL = 1e-5

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

@pytest.fixture
def lh_data():
    """
    Creates and returns an instance of LighthouseData with specified tf2 frames.

    Returns:
        LighthouseData: An instance of the LighthouseData class.
    """
    lh_tf2_frames = ["tb1/lighthouse_pose", "tb2/lighthouse_pose"]
    return LighthouseData(lh_tf2_frames)

def test_lighthouse_data_class(lh_data):
    def test_lighthouse_data_init(lh_data):
        """
        Test the initialization of the LighthouseData class, and confirms
        that the class correctly saves the input tf2 frames.
        """
        assert len(lh_data.lh_frames) == 2
        assert len(lh_data.lh_poses) == 2
        assert lh_data.lh_frames[0] == "tb1/lighthouse_pose"
        assert lh_data.lh_frames[1] == "tb2/lighthouse_pose"

        # Confirm that the class correctly fails when the input tf2 frames are not unique,
        # strings are not passed in, or the input is empty.
        try:
            LighthouseData(["tb1/lighthouse_pose", "tb1/lighthouse_pose"])
        except ValueError:
            pass
        else:
            assert False, "Expected ValueError, passed in non-unique strings"

        try:
            LighthouseData([1, 2])
        except ValueError:
            pass
        else:
            assert False, "Expected ValueError, passed in non-string"

    def test_lighthouse_data_set_pose(lh_data):
        """
        Test function confirming that the LighthouseData class can correctly save a
        configured pose, and reject invalid inputs.
        
        We have already tested for bad inputs in test_lighthouse_data_init
        that the Pose class will correctly handle incorrect input. Confirmation of rejectd inputs
        will cover
        """
        lh_data.set_pose({
        1: Pose(position=Point(x=4.0, y=5.0, z=6.0),
            orientation=Quaternion(x=0.0, y=0.0, z=0.0, w=1.0)),
        0: Pose(position=Point(x=1.0, y=2.0, z=3.0),
            orientation=Quaternion(x=0.0, y=0.0, z=0.0, w=1.0))
        })
        assert lh_data.lh_poses[0].position.x == 1.0
        assert lh_data.lh_poses[0].position.y == 2.0
        assert lh_data.lh_poses[0].position.z == 3.0
        assert lh_data.lh_poses[1].position.x == 4.0
        assert lh_data.lh_poses[1].position.y == 5.0
        assert lh_data.lh_poses[1].position.z == 6.0

        # Try setting pose with only a pose object, check failure

        try:
            lh_data.set_pose(
                Pose(position=Point(x=1.0, y=2.0, z=3.0))
            )
        except ValueError:
            pass
        else:
            assert False, "Expected ValueError, passed in pose without dict key"


    def test_lighthouse_data_get_lh_config(lh_data):
        """
        Test case for the `get_lh_config` method of the `LighthouseData` class.
        Assumes that test_lighthouse_data_set_pose() has already run.

        See Also:
            test_lighthouse_data_set_pose
        """
        input_pose = {
            0: Pose(position=Point(x=1.0, y=2.0, z=3.0)),
            1: Pose(position=Point(x=4.0, y=5.0, z=6.0))
        }
        lh_data.set_pose(input_pose)
        lh_config = lh_data.get_lh_config()
        assert lh_config[0].origin == [1.0, 2.0, 3.0]
        assert lh_config[1].origin == [4.0, 5.0, 6.0]
        assert np.allclose(lh_config[1].rotation_matrix, IDENTITY_MATRIX, atol=ALL_CLOSE_TOL)
        assert np.allclose(lh_config[0].rotation_matrix, IDENTITY_MATRIX, atol=ALL_CLOSE_TOL)
        input_pose = {
            1: Pose(position=Point(x=4.0, y=5.0, z=6.0),
                    orientation = Quaternion(x=0.7071068, y = 0.0, z = 0.7071068, w = 0.0)),
        }
        rot_matrix = [
            [0.0, 0.0, 1.0],
            [0.0, -1.0, 0.0],
            [1.0, 0.0, 0.0],
        ]
        lh_data.set_pose(input_pose)
        lh_config = lh_data.get_lh_config()
        assert lh_config[0].origin == [1.0, 2.0, 3.0]
        assert lh_config[1].origin == [4.0, 5.0, 6.0]
        assert np.allclose(lh_config[0].rotation_matrix, IDENTITY_MATRIX, atol=ALL_CLOSE_TOL)
        assert np.allclose(lh_config[1].rotation_matrix, rot_matrix, atol=ALL_CLOSE_TOL)

    # Class tests
    test_lighthouse_data_init(lh_data)
    test_lighthouse_data_set_pose(lh_data)
    test_lighthouse_data_get_lh_config(lh_data)

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

if __name__ == '__main__':
    # pytest.main()
    test_lighthouse_config_writer_class(calib_dict)
