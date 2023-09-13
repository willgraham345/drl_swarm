import os


class Crazyflie():
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


class Turtlebot():
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

class Swarm():
    """
    Swarm class, represents a swarm of turtlebots and crazyflies in both webots and experiments
    
    :param turtlebots: List of Turtlebot objects
    :type turtlebots: Turtlebot()
    :param crazyflies: List of Crazyflie objects
    :type crazyflies: Crazyflie()
    :param world_file: Path to webots world file
    :type world_file: str
    

    """
    def __init__(self, turtlebots, crazyflies, world_file = None):
        self.turtlebots = []
        self.crazyflies = []
        for tb in turtlebots:
            self.turtlebots.append(tb)
        for cf in crazyflies:
            self.crazyflies.append(cf)
        if world_file is None:
            self.world_file = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
             "worlds/apartment.wbt")
        else:
            self.world_file = world_file

    def swarm_writer(self, existing_world_file, new_world_file="new_world.wbt"):
        """
        Writes a new Webots world file with the swarm of turtlebots and crazyflies
        :param existing_world_file: Path to existing world file
        :type existing_world_file: str
        :param new_world_file: Path to new world file
        :type new_world_file: str

        :returns: None
        """
        with open(existing_world_file, 'r') as file:
            filedata = file.read()
        with open(new_world_file, 'w') as file:
            file.write(filedata)
        for cf in self.crazyflies:
            my_str = cf_webots_formatted_string.replace("<NAME>", cf.name)
            my_str = my_str.replace("<TRANSLATION>", str(cf.start_position[0]) + " " + str(cf.start_position[1]) + " " + str(cf.start_position[2]))
            if cf.start_orientation is not None:
                my_str = my_str.replace("0 0 0 1", str(cf.start_orientation[0]) + " " + str(cf.start_orientation[1]) + " " + str(cf.start_orientation[2]) + " " + str(cf.start_orientation[3]))
            with open(new_world_file, 'a') as file:
            # Add the target string
                file.write(my_str)
        for tb in self.turtlebots:
            # Add the target string
            my_str = tb_webots_formatted_string.replace("<NAME>", tb.name)
            my_str = my_str.replace("<TRANSLATION>", str(tb.start_position[0]) + " " + str(tb.start_position[1]) + " " + str(tb.start_position[2]))
            my_str = my_str.replace("<COMPASS_NAME", tb.name + "_compass")
            if tb.start_orientation is not None:
                my_str = my_str.replace("0 0 0 1", str(tb.start_orientation[0]) + " " + str(tb.start_orientation[1]) + " " + str(tb.start_orientation[2]) + " " + str(tb.start_orientation[3]))
            with open(new_world_file, 'a') as file:
                # Add the target string
                file.write(my_str)
        print("Swarm written to " + new_world_file)


cf_webots_formatted_string = """Robot {
  translation <TRANSLATION>
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
        DEF battery_holder Shape {
          appearance PBRAppearance {
            baseColor 0 0 0
            metalness 0.2
          }
          geometry Mesh {
            url [
              "meshes/battery_holder.stl"
            ]
          }
        }
        DEF motors Shape {
          appearance PBRAppearance {
            baseColor 0.5 0.5 0.5
            emissiveColor 0.4 0.4 0.4
          }
          geometry Mesh {
            url [
              "meshes/4_motors.stl"
            ]
          }
        }
        DEF motormounts Shape {
          appearance PBRAppearance {
            transparency 0.1
            metalness 0.2
            emissiveColor 0.5 0.5 0.5
          }
          geometry Mesh {
            url [
              "meshes/4_motormounts.stl"
            ]
          }
        }
        DEF pinheader Shape {
          appearance DEF metal PBRAppearance {
            baseColor 0.5 0.5 0.5
            metalness 0.8
            emissiveColor 0.4 0.4 0.4
          }
          geometry Mesh {
            url [
              "meshes/2_pinheaders.stl"
            ]
          }
        }
        DEF body Shape {
          appearance DEF PCB PBRAppearance {
            baseColor 0 0 0
            roughness 0.3
            metalness 0.5
          }
          geometry Mesh {
            url [
              "meshes/cf_body.stl"
            ]
          }
        }
      ]
      name "body"
    }
    GPS {
    }
    Gyro {
    }
    InertialUnit {
    }
    DEF m1 Propeller {
      shaftAxis 0 0 1
      centerOfThrust 0.031 -0.031 0.008
      thrustConstants -4e-05 0
      torqueConstants 2.4e-06 0
      device RotationalMotor {
        name "m1_motor"
        maxVelocity 600
        maxTorque 30
      }
      slowHelix Solid {
        translation 0.031 -0.031 0.008
        children [
          Shape {
            appearance DEF plastic PBRAppearance {
              baseColor 0 0 0
              metalness 0.3
            }
            geometry Mesh {
              url [
                "meshes/ccw_prop.stl"
              ]
            }
          }
        ]
      }
    }
    DEF m2 Propeller {
      shaftAxis 0 0 1
      centerOfThrust -0.031 -0.031 0.008
      thrustConstants 4e-05 0
      torqueConstants 2.4e-06 0
      device RotationalMotor {
        name "m2_motor"
        maxVelocity 600
        maxTorque 30
      }
      slowHelix Solid {
        translation -0.031 -0.031 0.008
        children [
          Shape {
            appearance USE plastic
            geometry Mesh {
              url [
                "meshes/cw_prop.stl"
              ]
            }
          }
        ]
      }
    }
    DEF m3 Propeller {
      shaftAxis 0 0 1
      centerOfThrust -0.031 0.031 0.008
      thrustConstants -4e-05 0
      torqueConstants 2.4e-06 0
      device RotationalMotor {
        name "m3_motor"
        maxVelocity 600
        maxTorque 30
      }
      slowHelix Solid {
        translation -0.031 0.031 0.008
        children [
          Shape {
            appearance USE plastic
            geometry Mesh {
              url [
                "meshes/ccw_prop.stl"
              ]
            }
          }
        ]
      }
    }
    DEF m4 Propeller {
      shaftAxis 0 0 1
      centerOfThrust 0.031 0.031 0.008
      thrustConstants 4e-05 0
      torqueConstants 2.4e-06 0
      device RotationalMotor {
        name "m4_motor"
        maxVelocity 600
        maxTorque 30
      }
      slowHelix DEF prop Solid {
        translation 0.031 0.031 0.008
        children [
          DEF prop Shape {
            appearance USE plastic
            geometry Mesh {
              url [
                "meshes/cw_prop.stl"
              ]
            }
          }
        ]
      }
    }
  ]
  name "<NAME>"
  boundingObject Cylinder {
    height 0.03
    radius 0.05
  }
  physics Physics {
    density -1
    mass 0.05
  }
  controller "<extern>"
}
"""

tb_webots_formatted_string = """
TurtleBot3Burger {
  translation <TRANSLATION>
  name "<NAME>"
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
      name "<COMPASS_NAME>"
    }
  ]
}
"""


if __name__ == "__main__":
    # Create a swarm of turtlebots and crazyflies
    tb1 = Turtlebot("tb1", start_position=[-1.5, -1.5, 0])
    tb2 = Turtlebot("tb2", start_position=[-1.5, -2.5, 0])
    cf1 = Crazyflie("cf1", start_position=[-2, -3, 0.015])
    cf2 = Crazyflie("cf2", start_position=[-2, -2, 0.015])
    # Create swarm
    swarm1 = Swarm([tb1, tb2], [cf1, cf2])

    # Locate world files
    world_path = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
     "worlds/apartment.wbt")
    new_world_filename = "new_world.wbt"
    swarm1.swarm_writer(world_path, new_world_filename)
