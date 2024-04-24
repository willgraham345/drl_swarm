#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  

import os
import tf_transformations
import rclpy
from rclpy.node import Node
from rclpy.qos import DurabilityPolicy, HistoryPolicy, QoSProfile

from tf2_ros import StaticTransformBroadcaster
from geometry_msgs.msg import Pose
from geometry_msgs.msg import TransformStamped

class LighthousePose(Node):
    """
    Represents a node that handles the pose of a lighthouse in a ROS system.

    Quick disclaimer, this was never really used. Just a quick example of what was thinking could be implemented.

    """

    def __init__(self):
        super().__init__('LighthousePose')
        print("LighthousePose initializing")

        # Create a static transform broadcaster
        self.static_broadcaster = StaticTransformBroadcaster(self)

        # Add in subscription to turtlebot, with a static transform
        self.subscription = self.create_subscription(
            Pose,
            '/turtlebot/pose',
            self.turtlebot_pose_callback,
            QoSProfile(
                durability=DurabilityPolicy.TRANSIENT_LOCAL,
                history=HistoryPolicy.KEEP_LAST,
                depth=1
            )
        )
        self.lh_x = []
        self.lh_y = []
        self.lh_z = []
        self.lh_qx = []
        self.lh_qy = []
        self.lh_qz = []
        self.lh_qw = []
        self.lh_id = []
        self.tf_broadcaster_TB_2_LH = StaticTransformBroadcaster(self)
        self.tf_broadcaster_LH_2_TB = StaticTransformBroadcaster(self)

    def turtlebot_pose_callback(self, msg, turtlebot_namespace, lighthouse_namespace):
        """
        Callback function for the turtlebot pose subscription.

        Args:
            msg (Pose): The turtlebot's pose message.
            turtlebot_namespace (str): The namespace of the turtlebot.
            lighthouse_namespace (str): The namespace of the lighthouse.

        Returns:
            None
        """
        # Create a transform from the turtlebot's pose
        transform = TransformStamped()
        transform.header.stamp = self.get_clock().now().to_msg()
        transform.header.frame_id = turtlebot_namespace + '/base_link'
        transform.child_frame_id = lighthouse_namespace + '/lighthouse'
        transform.transform.translation.x = msg.position.x
        transform.transform.translation.y = msg.position.y
        transform.transform.translation.z = msg.position.z
        transform.transform.rotation.x = msg.orientation.x
        transform.transform.rotation.y = msg.orientation.y
        transform.transform.rotation.z = msg.orientation.z
        transform.transform.rotation.w = msg.orientation.w

        # Transform the pose to the lighthouse frame
        try:
            self.tf_buffer.can_transform(lighthouse_namespace + '/lighthouse', turtlebot_namespace + '/base_link', transform.header.stamp)
            transformed = self.tf_buffer.transform(transform, lighthouse_namespace + '/lighthouse')
        except (TransformException, ConnectivityException, ExtrapolationException) as e:
            self.get_logger().error('Failed to transform pose: %s' % str(e))
            return

        # Publish the transform
        self.tf_broadcaster_TB_2_LH.sendTransform(transformed)

        # Write the lighthouse's position and orientation to memory
        self.lh_x = transformed.transform.translation.x
        self.lh_y = transformed.transform.translation.y
        self.lh_z = transformed.transform.translation.z
        self.lh_qx = transformed.transform.rotation.x
        self.lh_qy = transformed.transform.rotation.y
        self.lh_qz = transformed.transform.rotation.z
        self.lh_qw = transformed.transform.rotation.w
        self.lh_id = lighthouse_namespace + '/lighthouse'