class Crazyflie():
    def __init__(self, name, URI_address, start_position, start_orientation):
        self.name = name
        self.URI_address = URI_address
        self.start_position = start_position
        self.start_orientation = start_orientation


class Turtlebot():
    def __init__(self, name, ROS2_address, start_position, start_orientation):
        self.name = name
        self.ROS2_address = ROS2_address
        self.start_position = start_position
        self.start_orientation = start_orientation

class Swarm():
    def __init__(self, turtlebots, crazyflies):
        self.turtlebots = []
        self.crazyflies = []
        for tb in turtlebots:
            self.turtlebots.append(tb)
        for cf in crazyflies:
            self.crazyflies.append(cf)