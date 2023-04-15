import math

from geometry_msgs.msg import Twist

import rclpy
from rclpy.node import Node

from tf2_ros import TransformException
from tf2_ros.buffer import Buffer
from tf2_ros.transform_listener import TransformListener

from turtlesim.srv import Spawn


class potentialField(Node): # MODIFY NAME
    def __init__(self):
        super().__init__("potential_field") # MODIFY NAME
        self.cf_frame = self.declare_parameter('cf_frame', 'cf1').get_parameter_value().string_value
        self.tf_buffer = Buffer()
        self.tf_listener = TransformListener(self.tf_buffer, self)


def main(args=None):
    rclpy.init(args=None)
    node = potentialField()
    rclpy.spin(node)
    rclpy.shutdown()
    

if __name__ == "__main__":
    main()