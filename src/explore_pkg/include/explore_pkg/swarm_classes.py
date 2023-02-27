class Crazyflie():
    def __init__(URI_address, start_position):
        self.URI_address = URI_address
        self.start_position = start_position

class Turtlebot():
    def __init__(ROS2_address, start_position):
        self.ROS2_address = ROS2_address
        self.start_position = start_position

class Swarm():
    def __init__():
        self.turtlebots = {}
        self.crazyflies = []
    def add_turtlebot(tb):
        self.turtlebots.append(tb)
    def add_crazyflie(cf, tb_parent):
        self.crazyflies.append(cf)
        # self.turtlebots(tb_parent).add_crazyflie(cf)