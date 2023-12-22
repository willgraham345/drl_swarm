import os
import json




class cf_dict():
    def __init__(self, name, translation_unit):
        self.cf_dict = {}
        self.create_cf_dict(name, translation_unit, rotation_unit)

    def create_cf_dict(self, name_unit, translation_unit, rotation_unit):
        self.cf_dict = {
        "Robot": {
            "name": name_unit,
            "controller": "<extern>",
            "translation": translation_unit,
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
        }


    def write_dict_to_json(self):
        with open('cf_dict.json', 'w') as json_file:
            json.dump(self.cf_dict, json_file, indent=4)


# Create a Webots Appending Class
class WebotsAppender:

    def __init__(self, swarm_instance, world_filepath, new_world_filename):
        self.swarm = swarm_instance
        self.world_filepath = world_filepath
        self.new_world_filename = new_world_filename

    def generate_cf_string(self, name, translation_unit):

        return cf_string

    def generate_swarm_string(self):
        swarm_string = []
        # Iterate through cf instances in the swarm 
        for cf in self.swarm.crazyflies:
            # Generate the string for the cf instance
            cf_string = self.generate_cf_string(cf.name, cf.translation_unit)

            # Append the generated string to the world data
            swarm_string += cf_string
        
        for tb in self.swarm.turtlebots:
            # Generate the string for the cf instance
            tb_string = self.generate_tb_string(tb.name, tb.translation_unit)

            # Append the generated string to the world data
            swarm_string += tb_string
        
        return swarm_string

    def append_to_world(self):
        try:
            swarm_string = self.generate_swarm_string()

            # Read the existing world file
            with open(self.world_filepath, 'r') as file:
                world_data = file.read()

            # Write the updated world data to a new world file
            with open(self.new_world_filename, 'w') as file:
                file.write(world_data)
        
        except FileNotFoundError as e:
            print(f"Error: {e}")
        
        except Exception as e:
            print(f"Error: {e}")