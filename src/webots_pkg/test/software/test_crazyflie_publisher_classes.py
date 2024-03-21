import os
import sys
import pytest

from cflib.crazyflie.mem import LighthouseBsCalibration
from webots_pkg.crazyflie_publisher import LighthouseData
import numpy as np

from geometry_msgs.msg import Twist, Pose, Point, Quaternion
pose_basic = Pose()
pose_basic.position.x = 0.0
pose_basic.position.y = 0.0
pose_basic.position.z = 0.0
pose_basic.orientation.x = 0.0
pose_basic.orientation.y = 0.0
pose_basic.orientation.z = 0.0
pose_basic.orientation.w = 1.0


pose_ones = Pose()
pose_ones.position.x = 1.0
pose_ones.position.y = 1.0
pose_ones.position.z = 1.0
pose_ones.orientation.x = 1.0
pose_ones.orientation.y = 1.0
pose_ones.orientation.z = 1.0
pose_ones.orientation.w = 1.0


IDENTITY_MATRIX = [
    [1.0, 0.0, 0.0],
    [0.0, 1.0, 0.0],
    [0.0, 0.0, 1.0]
]

ALL_CLOSE_TOL = 1e-5
def test_lighthouse_data_init():
    lh_tf2_frames = ["tb1/lighthouse_pose", "tb2/lighthouse_pose"]
    lh_data = LighthouseData(lh_tf2_frames)
    assert len(lh_data.lh_frames) == 2
    assert len(lh_data.lh_poses) == 2

def test_lighthouse_data_set_pose():
    lh_tf2_frames = ["tb1/lighthouse_pose", "tb2/lighthouse_pose"]
    lh_data = LighthouseData(lh_tf2_frames)
    lh_data.set_pose({
        1: Pose(position=Point(x=4.0, y=5.0, z=6.0), orientation=Quaternion(x=0.0, y=0.0, z=0.0, w=1.0)),
        0: Pose(position=Point(x=1.0, y=2.0, z=3.0), orientation=Quaternion(x=0.0, y=0.0, z=0.0, w=1.0))
    })
    assert lh_data.lh_poses[0].position.x == 1.0
    assert lh_data.lh_poses[0].position.y == 2.0
    assert lh_data.lh_poses[0].position.z == 3.0
    assert lh_data.lh_poses[1].position.x == 4.0
    assert lh_data.lh_poses[1].position.y == 5.0
    assert lh_data.lh_poses[1].position.z == 6.0

def test_lighthouse_data_get_lh_config():
    lh_tf2_frames = ["tb1/lighthouse_pose", "tb2/lighthouse_pose"]
    lh_data = LighthouseData(lh_tf2_frames)
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
        1: Pose(position=Point(x=4.0, y=5.0, z=6.0), orientation = Quaternion(x=0.7071068, y = 0.0, z = 0.7071068, w = 0.0)),
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

# Add more tests as needed

if __name__ == '__main__':
    test_lighthouse_data_init()
    test_lighthouse_data_set_pose()
    test_lighthouse_data_get_lh_config()