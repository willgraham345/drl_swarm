import os
import sys
import pytest

import numpy as np
from cflib.crazyflie.mem import LighthouseBsCalibration
from cflib.crazyflie import Crazyflie
from drl_pkg.crazyflie_publisher import (
    LighthouseData,
    LighthouseConfigWriter,
    CrazyfliePublisher,
)

from geometry_msgs.msg import Pose, Point, Quaternion

@pytest.fixture
def pose_of_zeros():
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
def lh_data():
    """
    Creates and returns an instance of LighthouseData with specified tf2 frames.

    Returns:
        LighthouseData: An instance of the LighthouseData class.
    """
    lh_tf2_frames = ["tb1/lighthouse_pose", "tb2/lighthouse_pose"]
    return LighthouseData(lh_tf2_frames)

@pytest.fixture
def lh_config_writer():
    calibration_data = {
        0: LighthouseBsCalibration(),
        1: LighthouseBsCalibration()
    }
    cf = Crazyflie()
    return LighthouseConfigWriter(cf, calibration_data)

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
    that the Pose class will correctly handle incorrect input. Confirmation of rejectd inputs will cover
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

# def test_lighthouse_config_writer_init():
#     cf = Crazyflie()
#     rotation_matrices = [[NO_ROTATION_MATRIX]]
#     lh_config = {0: LighthouseBsGeometry()}
#     calibs = {0: LighthouseBsCalibration()}
#     writer = LighthouseConfigWriter(cf, rotation_matrices, lh_config, calibs)
#     assert writer._cf == cf
#     assert writer.lh_rotation_matrices == rotation_matrices
#     assert writer._lh_config == lh_config
#     assert writer._calibs_on_cf == False
#     assert writer._calibs == calibs

def test_lighthouseConfigWriter_init():
    """
    Test case for the initialization of the `LighthouseConfigWriter` class.
    """
    # Create a Crazyflie instance
    crazyflie_instance = CrazyfliePublisher()

    # Create a dictionary of calibration data
    calibration_data = {
        0: LighthouseBsCalibration(),
        1: LighthouseBsCalibration()
    }

    # Create an instance of LighthouseConfigWriter
    writer = LighthouseConfigWriter(crazyflie_instance, calibration_data)

    # Assert that the class has been initialized correctly
    assert writer._cf == crazyflie_instance
    assert writer.lh_rotation_matrices == [[IDENTITY_MATRIX]]
    assert writer._lh_config == {}
    assert writer._calibs_on_cf == False
    assert writer._calibs == calibration_data

def test_update_rotation_matrices(crazyflie_instance, calibration_data):
    # Create an instance of LighthouseConfigWriter
    writer = LighthouseConfigWriter(crazyflie_instance, calibration_data)

    # Define the new rotation matrices
    rotation_matrices = [
        [[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]],
        [[0.0, 0.0, 1.0], [0.0, 1.0, 0.0], [-1.0, 0.0, 0.0]]
    ]

    # Call the update_rotation_matrices method
    writer.update_rotation_matrices(rotation_matrices)

    # Assert that the rotation matrices have been updated
    assert writer.lh_rotation_matrices == rotation_matrices
# Add more tests as needed

if __name__ == '__main__':
    test_lighthouse_data_init()
    test_lighthouse_data_set_pose()
    test_lighthouse_data_get_lh_config()
