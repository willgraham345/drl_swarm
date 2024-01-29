#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  


"""

A file used to write the configuration of our swarm into the json of the WeBots file.
IMPORTANT: This file must match the configuration specified within the launch file.
"""



import os
import sys
import json
import shutil
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.swarm_classes import Swarm, cf, tb, Swarm_config_storage

# Other configs
dir_path = os.path.dirname(__file__)
COPIED_FILE = os.path.join( dir_path, '..', 'worlds', 'base_worlds', 'apartment.wbt')
DESTINATION_DIR = dir_path

# Macros for swarm configuration
CF1_NAME = "cf1"
CF1_URI = ""
CF1_TRANSLATION = [-1, -1, 0.015]
CF1_ORIENTATION = [0, 0, 0, 1]

CF2_NAME = "cf2"
CF2_URI = ""
CF2_TRANSLATION = [-2, 2, 0.015]
CF2_ORIENTATION = [0, 0, 0, 1]


TB1_NAME = "tb1"
TB1_TRANSLATION = [0, 0, 0.015]
TB1_ORIENTATION = [0, 0, 0, 1]

TB2_NAME = "tb2"
TB2_TRANSLATION = [0, 0, 0.015]
TB2_ORIENTATION = [0, 0, 0, 1]

world_files = 'apartment.wbt'




def create_cf_dict(cf_name, start_position):
    cf_dict = {
        "name": cf_name,
        "controller": "<extern>",
        "translation": start_position,
        "children": [
        {
            "DEF": "Multiranger",
            "Transform": {
            "translation": [0, 0, 0.02],
            "children": [
                {
                "DistanceSensor": {
                    "rotation": [0, 0, 1, -1.57],
                    "name": "range_right",
                    "lookupTable": [
                    [0, 0, 0],
                    [3.5, 3500, 0]
                    ]
                }
                },
                {
                "DistanceSensor": {
                    "rotation": [0, 0, 1, 3.14],
                    "name": "range_back",
                    "lookupTable": [
                    [0, 0, 0],
                    [3.5, 3500, 0]
                    ]
                }
                },
                {
                "DistanceSensor": {
                    "rotation": [0, 0, 1, 1.57],
                    "name": "range_left",
                    "lookupTable": [
                    [0, 0, 0],
                    [3.5, 3500, 0]
                    ]
                }
                },
                {
                "DistanceSensor": {
                    "name": "range_front",
                    "lookupTable": [
                    [0, 0, 0],
                    [3.5, 3500, 0]
                    ]
                }
                }
            ]
            }
        },
        {
            "Solid": {
            "translation": [0, 0, -0.015],
            "children": [
                {
                "DEF": "battery",
                "Shape": {
                    "appearance": {
                    "PBRAppearance": {
                        "baseColor": [0.5, 0.5, 0.6],
                        "metalness": 0.1,
                        "emissiveIntensity": 0
                    }
                    },
                    "geometry": {
                    "Mesh": {
                        "url": ["meshes/battery.stl"]
                    }
                    }
                }
                },
                {
                "DEF": "battery_holder",
                "Shape": {
                    "appearance": {
                    "PBRAppearance": {
                        "baseColor": [0, 0, 0],
                        "metalness": 0.2
                    }
                    },
                    "geometry": {
                    "Mesh": {
                        "url": ["meshes/battery_holder.stl"]
                    }
                    }
                }
                },
                {
                "DEF": "motors",
                "Shape": {
                    "appearance": {
                    "PBRAppearance": {
                        "baseColor": [0.5, 0.5, 0.5],
                        "emissiveColor": [0.4, 0.4, 0.4]
                    }
                    },
                    "geometry": {
                    "Mesh": {
                        "url": ["meshes/4_motors.stl"]
                    }
                    }
                }
                },
                {
                "DEF": "motormounts",
                "Shape": {
                    "appearance": {
                    "PBRAppearance": {
                        "transparency": 0.1,
                        "metalness": 0.2,
                        "emissiveColor": [0.5, 0.5, 0.5]
                    }
                    },
                    "geometry": {
                    "Mesh": {
                        "url": ["meshes/4_motormounts.stl"]
                    }
                    }
                }
                },
                {
                "DEF": "pinheader",
                "Shape": {
                    "appearance": {
                    "DEF": "metal",
                    "PBRAppearance": {
                        "baseColor": [0.5, 0.5, 0.5],
                        "metalness": 0.8,
                        "emissiveColor": [0.4, 0.4, 0.4]
                    }
                    },
                    "geometry": {
                    "Mesh": {
                        "url": ["meshes/2_pinheaders.stl"]
                    }
                    }
                }
                },
                {
                "DEF": "body",
                "Shape": {
                    "appearance": {
                    "DEF": "PCB",
                    "PBRAppearance": {
                        "baseColor": [0, 0, 0],
                        "roughness": 0.3,
                        "metalness": 0.5
                    }
                    },
                    "geometry": {
                    "Mesh": {
                        "url": ["meshes/cf_body.stl"]
                    }
                    }
                }
                }
            ],
            "name": "body"
            }
        },
        {
            "GPS": {}
        },
        {
            "Gyro": {}
        },
        {
            "InertialUnit": {}
        },
        {
            "DEF": "m1",
            "Propeller": {
            "shaftAxis": [0, 0, 1],
            "centerOfThrust": [0.031, -0.031, 0.008],
            "thrustConstants": [-4e-05, 0],
            "torqueConstants": [2.4e-06, 0],
            "device": {
                "RotationalMotor": {
                "name": "m1_motor",
                "maxVelocity": 600,
                "maxTorque": 30
                }
            },
            "slowHelix": {
                "Solid": {
                "translation": [0.031, -0.031, 0.008],
                "children": [
                    {
                    "Shape": {
                        "appearance": {
                        "DEF": "plastic",
                        "PBRAppearance": {
                            "baseColor": [0, 0, 0],
                            "metalness": 0.3
                        }
                        },
                        "geometry": {
                        "Mesh": {
                            "url": ["meshes/ccw_prop.stl"]
                        }
                        }
                    }
                    }
                ]
                }
            }
            }
        },
        {
            "DEF": "m2",
            "Propeller": {
            "shaftAxis": [0, 0, 1],
            "centerOfThrust": [-0.031, -0.031, 0.008],
            "thrustConstants": [4e-05, 0],
            "torqueConstants": [2.4e-06, 0],
            "device": {
                "RotationalMotor": {
                "name": "m2_motor",
                "maxVelocity": 600,
                "maxTorque": 30
                }
            },
            "slowHelix": {
                "Solid": {
                "translation": [-0.031, -0.031, 0.008],
                "children": [
                    {
                    "Shape": {
                        "appearance": {
                        "USE": "plastic"
                        },
                        "geometry": {
                        "Mesh": {
                            "url": ["meshes/cw_prop.stl"]
                        }
                        }
                    }
                    }
                ]
                }
            }
            }
        },
        {
            "DEF": "m3",
            "Propeller": {
            "shaftAxis": [0, 0, 1],
            "centerOfThrust": [-0.031, 0.031, 0.008],
            "thrustConstants": [-4e-05, 0],
            "torqueConstants": [2.4e-06, 0],
            "device": {
                "RotationalMotor": {
                "name": "m3_motor",
                "maxVelocity": 600,
                "maxTorque": 30
                }
            },
            "slowHelix": {
                "Solid": {
                "translation": [-0.031, 0.031, 0.008],
                "children": [
                    {
                    "Shape": {
                        "appearance": {
                        "USE": "plastic"
                        },
                        "geometry": {
                        "Mesh": {
                            "url": ["meshes/ccw_prop.stl"]
                        }
                        }
                    }
                    }
                ]
                }
            }
            }
        },
        {
            "DEF": "m4",
            "Propeller": {
            "shaftAxis": [0, 0, 1],
            "centerOfThrust": [0.031, 0.031, 0.008],
            "thrustConstants": [4e-05, 0],
            "torqueConstants": [2.4e-06, 0],
            "device": {
                "RotationalMotor": {
                "name": "m4_motor",
                "maxVelocity": 600,
                "maxTorque": 30
                }
            },
            "slowHelix": {
                "DEF": "prop",
                "Solid": {
                "translation": [0.031, 0.031, 0.008],
                "children": [
                    {
                    "DEF": "prop",
                    "Shape": {
                        "appearance": {
                        "USE": "plastic"
                        },
                        "geometry": {
                        "Mesh": {
                            "url": ["meshes/cw_prop.stl"]
                        }
                        }
                    }
                    }
                ]
                }
            }
            }
        }
        ],
        "boundingObject": {
        "Cylinder": {
            "height": 0.03,
            "radius": 0.05
        }
        },
        "physics": {
        "Physics": {
            "density": -1,
            "mass": 0.05
        }
        },
    }
    return cf_dict

    
def create_tb_dict(name_unit, translation_unit):
    tb_dict = {
    "name": name_unit,
    "translation": translation_unit,
    "controller": "<extern>",
    "controllerArgs": [""],
    "extensionSlot": [
        {
        "Solid": {
            "name": "imu_link"
        }
        },
        {
        "GPS": {}
        },
        {
        "InertialUnit": {
            "name": "inertial_unit"
        }
        },
        {
        "RobotisLds01": {}
        }
    ]
    }
    
    return tb_dict


def append_json_to_world_files(world_files, swarm_config: Swarm_config_storage):
    for file_path in world_files:
        with open(file_path, 'a') as file:
            file.write("\n")
            for cf_dict in swarm_config.cf_dict_list:
                file.write("Robot ")
                file.write(json.dumps(cf_dict, indent = 4))
                file.write("\n")
                file.write("\n")
            for tb_dict in swarm_config.tb_dict_list:
                file.write("TurtleBot3Burger ")
                file.write(json.dumps(tb_dict, indent = 4))
                file.write("\n")
                file.write("\n")
# Example usage
if __name__ == "__main__":
    cf1_dict = create_cf_dict(CF1_NAME, CF1_TRANSLATION)
    cf2_dict = create_cf_dict(CF2_NAME, CF2_TRANSLATION)
    tb1_dict = create_tb_dict(TB1_NAME, TB1_TRANSLATION)
    tb2_dict = create_tb_dict(TB2_NAME, TB2_TRANSLATION)

    swarm = Swarm_config_storage([cf1_dict, cf2_dict], [tb1_dict, tb2_dict])
    # Remove info in file



    append_json_to_world_files([COPIED_FILE], swarm)
# ...

# Example usage
if __name__ == "__main__":
    cf1_dict = create_cf_dict(CF1_NAME, CF1_TRANSLATION)
    cf2_dict = create_cf_dict(CF2_NAME, CF2_TRANSLATION)
    tb1_dict = create_tb_dict(TB1_NAME, TB1_TRANSLATION)
    tb2_dict = create_tb_dict(TB2_NAME, TB2_TRANSLATION)

    swarm = Swarm_config_storage([cf1_dict, cf2_dict], [tb1_dict, tb2_dict])
    
    # Copy the file to a local directory
    file_path = shutil.copy(COPIED_FILE, DESTINATION_DIR)
    
    # Execute append_json_to_world_files on the copied file
    append_json_to_world_files([file_path], swarm)
