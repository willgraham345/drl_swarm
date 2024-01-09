
#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  
"""
This file defines the classes used to represent a swarm in ros2 and webots.

Author: Will Graham
"""


import os
import json
import typing


class cf():
    """
    Class that represents a crazyflie in both webots and experiments
    :param name: Name of crazyflie
    :type name: str
    :param start_position: Starting position of crazyflie
    :type start_position: list
    :param URI_address: URI address of crazyflie
    :type URI_address: str
    :param start_orientation: Starting orientation of crazyflie
    :type start_orientation: list

    """
    def __init__(self, name, start_position, URI_address=None, start_orientation=None):
        self.name = name
        self.URI_address = URI_address
        self.start_position = start_position
        self.start_orientation = start_orientation


class tb(): 
    """
    Class that represents a turtlebot in both webots and experiments
    :param name: Name of turtlebot
    :type name: str
    :param start_position: Starting position of turtlebot
    :type start_position: list
    :param ROS2_address: ROS2 address of turtlebot
    :type ROS2_address: str
    :param start_orientation: Starting orientation of turtlebot
    :type start_orientation: list
    """
    def __init__(self, name, start_position, ROS2_address=None, start_orientation=None):
        self.name = name
        self.ROS2_address = ROS2_address
        self.start_position = start_position
        self.start_orientation = start_orientation


class cf_dict2json(cf): #TODO: Refactor into cf class
    def __init__(self, cf_name, start_position, json_file_path: str=None):
        super().__init__(cf_name, start_position)
        self.json_file_path = json_file_path
        self.cf_dict = {}
        self.create_cf_dict(cf_name, start_position)
        if json_file_path is None:
          self.json_file_path = 'test_cf.json'
        self.json_file_path = json_file_path

    def create_cf_dict(self, cf_name, start_position):
      self.cf_dict = {
      "Robot": {
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
      }

    def write_dict_to_json(self):
        if self.json_file_path is None:
            self.json_file_path = 'test_cf.json'
        cf_robot = self.cf_dict["Robot"]
        with open(self.json_file_path, 'w') as f:
            f.write("Robot ")
            f.write(json.dumps(cf_robot, indent=1))

class tb_dict2json(tb):
    def __init__(self, tb_name, tb_start_position, json_file_path=None):
        super().__init__(tb_name, tb_start_position)
        self.json_file_path = json_file_path
        self.tb_dict = {}
        self.create_tb_dict(tb_name, tb_start_position)
        if json_file_path is None:
          self.json_file_path = 'test_tb.json'
        self.json_file_path = json_file_path
     
    def create_tb_dict(self, name_unit, translation_unit):
        self.tb_dict = {
        "TurtleBot3Burger": {
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
        }

    def write_dict_to_json(self):
        if self.json_file_path is None:
            self.json_file_path = 'test_tb.json'

        tb_robot = self.tb_dict["TurtleBot3Burger"]

        with open(self.json_file_path, 'w') as f:
            f.write("TurtleBot3Burger ")
            f.write(json.dumps(tb_robot, indent=1))

class Swarm():
    """
    Swarm class, represents a swarm of turtlebots and crazyflies in both webots and experiments
    
    :param turtlebots: List of Turtlebot objects
    :type turtlebots: Turtlebot()
    :param crazyflies: List of Crazyflie objects
    :type crazyflies: Crazyflie()
    :param world_file: Path to webots world file we want to edit
    :type world_file: str
    

    """
    def __init__(self, turtlebots, crazyflies, world_file = None):
        self.turtlebots = []
        self.crazyflies = []
        if turtlebots is not None:
          for tb in turtlebots:
            self.turtlebots.append(tb)
        if crazyflies is not None:
          for cf in crazyflies:
            self.crazyflies.append(cf)
        if world_file is None:
          self.world_file = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
             "worlds/apartment.wbt")
        else:
            self.world_file = world_file

    def write_swarm_to_json(self, json_file_path):
            """
            Write the swarm information to a JSON file.

            Parameters:
            - json_file_path (str): The path to the JSON file.

            Returns:
            None
            """
            cf_dict2json_instances = []
            tb_dict2json_instances = []
            # raise("Not yet tested")
            for cf in self.crazyflies:
                cf_instance = cf_dict2json(cf.name, cf.start_position, json_file_path)
                cf_dict2json_instances.append(cf_instance)
            for tb in self.turtlebots:
                tb_instance = tb_dict2json(tb.name, tb.start_position, json_file_path)
                tb_dict2json_instances.append(tb_instance)

            for cf in cf_dict2json_instances:
                cf.write_dict_to_json() # FIXME: This is not writing to the json file
            for tb in tb_dict2json_instances:
                tb.write_dict_to_json()


if __name__ == "__main__":
    # Create a swarm of turtlebots and crazyflies
    tb1 = tb("tb1", start_position=[-1.5, -1.5, 0])
    tb2 = tb("tb2", start_position=[-1.5, -2.5, 0])
    cf1 = cf("cf1", start_position=[-2, -3, 0.015])
    cf2 = cf("cf2", start_position=[-2, -2, 0.015])
    # Create swarm
    swarm1 = Swarm([tb1, tb2], [cf1, cf2])
