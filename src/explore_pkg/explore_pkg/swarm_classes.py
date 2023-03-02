class Crazyflie():
    def __init__(self, URI_address, start_position):
        self.URI_address = URI_address
        self.start_position = start_position

class Turtlebot():
    def __init__(self, ROS2_address, start_position):
        self.ROS2_address = ROS2_address
        self.start_position = start_position

class Swarm():
    def __init__(self, tutorialbots, crazyflies):
        self.turtlebots = {}
        self.crazyflies = []
    def add_turtlebot(self, tb):
        # self.turtlebots.append(tb)
        pass
    def add_crazyflie(self, cf, tb_parent):
        self.crazyflies.append(cf)
        # self.turtlebots(tb_parent).add_crazyflie(cf)