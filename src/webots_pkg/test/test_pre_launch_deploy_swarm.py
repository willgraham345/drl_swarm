import os
import sys
import pytest
# insert the path to the webots_pkg directory
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.swarm_classes import Swarm
from worlds.pre_launch_deploy_swarm import WebotsAppender

cf_list = []
tb_list = []


@pytest.fixture
def webots_appender():
    swarm_instance = Swarm([], [])

    return WebotsAppender(swarm_instance, "test_world.wbt", "new_world.wbt")


def test_generate_tb_string(webots_appender):
    name = "TurtleBot1"
    translation_unit = "1 2 3"
    expected_string = '''
        TurtleBot3Burger { 
            translation 1 2 3
            name "TurtleBot1"
            controller "<extern>"
            controllerArgs [
                ""
            ]
            extensionSlot [
                Solid {
                    name "imu_link"
                }
                GPS {
                }
                InertialUnit {
                    name "inertial_unit"
                }
                RobotisLds01 {
                }
                Compass {
                }
            ]
        }
    '''
    assert webots_appender.generate_tb_string(name, translation_unit) == expected_string

def test_generate_cf_string(webots_appender):
    name = "Crazyflie1"
    translation_unit = "4 5 6"
    expected_string = '''
        Robot {
            translation 4 5 6
            name "Crazyflie1" 
            children [
                DEF Multiranger Transform {
                    translation 0 0 0.02
                    children [
                        DistanceSensor {
                            rotation 0 0 1 -1.57
                            name "range_right"
                            lookupTable [
                                0 0 0
                                3.5 3500 0
                            ]
                        }
                        DistanceSensor {
                            rotation 0 0 1 3.14
                            name "range_back"
                            lookupTable [
                                0 0 0
                                3.5 3500 0
                            ]
                        }
                        DistanceSensor {
                            rotation 0 0 1 1.57
                            name "range_left"
                            lookupTable [
                                0 0 0
                                3.5 3500 0
                            ]
                        }
                        DistanceSensor {
                            name "range_front"
                            lookupTable [
                                0 0 0
                                3.5 3500 0
                            ]
                        }
                    ]
                }
                Solid {
                    translation 0 0 -0.015
                    children [
                        DEF battery Shape {
                            appearance PBRAppearance {
                                baseColor 0.5 0.5 0.6
                                metalness 0.1
                                emissiveIntensity 0
                            }
                            geometry Mesh {
                                url [
                                    "meshes/battery.stl"
                                ]
                            }
                        }
                    ]
                }
            ]
        }
    '''
    assert webots_appender.generate_cf_string(name, translation_unit) == expected_string

# Add more tests for other methods in the WebotsAppender class


# def test_append_to_world(webots_appender):
#     # Create a mock world file for testing
#     world_filepath = ...  # Provide the path to a test world file
#     new_world_filename = ...  # Provide a new filename for the updated world file
#     webots_appender.world_filepath = world_filepath
#     webots_appender.new_world_filename = new_world_filename

#     # Call the append_to_world method
#     webots_appender.append_to_world()

#     # Assert that the new world file is created
#     assert os.path.exists(new_world_filename)

#     # Assert that the content of the new world file is correct
#     with open(new_world_filename, 'r') as file:
#         new_world_data = file.read()
#     assert new_world_data == ...

# # Add more tests for other scenarios in the append_to_world method