import os

tb_dict = {
    "Turtlebot3Burger": {
        "translation": translation_unit,
        "name": name_unit,
        "controller": controller_unit
        "controllerArgs": {
            "extensionSlot": {
                "Solid": {
                    "name": imu_link
                }
                "GPS": {
                }
                "InertialUnit": {
                    "name": inertial_unit
                }
                "RobotisLds01": {
                }
                "Commpass": {
                }
            }
        }
}

cf_dict = {
    "Robot": {
        "translation": translation_unit,
        "name": name_unit,
        "children": {
            "Multiranger": {
                "translation": translation_unit,
                "children": {
                    "DistanceSensor": {
                        "rotation": rotation_unit,
                        "name": name_unit,
                        "lookupTable": {
                            "0": 0,
                            "3.5": 3500
                        }
                    }
                }
            }
            "Solid": {
                "translation": translation_unit,
                "children": {
                    "battery": {
                        "appearance": {
                            "baseColor": baseColor_unit,
                            "metalness": metalness_unit,
                            "emissiveIntensity": emissiveIntensity_unit
                        }
                        "geometry": {
                            "url": url_unit
                        }
                    }
                }
            }
        }
    }
}

# Create a Webots Appending Class
class WebotsAppender:

    def __init__(self, swarm_instance, world_filepath, new_world_filename):
        self.swarm = swarm_instance
        self.world_filepath = world_filepath
        self.new_world_filename = new_world_filename

    def generate_tb_string(self, name, translation_unit):
        imu_link = "imu_link"
        inertial_unit = "inertial_unit"
        tb_string = '''
        TurtleBot3Burger { '''
        + f'''
            translation {translation_unit}
            name "{name}"
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
                    name "{inertial_unit}"
                }
                RobotisLds01 {
                }
                Compass {
                }
            ]
        }
        '''
        return tb_string

    def generate_cf_string(self, name, translation_unit):
        cf_string = '''
        Robot {
        ''' + \
        f'''
            translation {translation_unit}
            name "{name}" 
        ''' + \
        '''    
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
        

