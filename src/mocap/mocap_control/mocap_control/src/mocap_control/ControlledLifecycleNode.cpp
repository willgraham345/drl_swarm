// Copyright 2020 Intelligent Robotics Lab
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <string>

#include "mocap_control_msgs/msg/control.hpp"
#include "mocap_control_msgs/msg/mocap_info.hpp"
#include "lifecycle_msgs/msg/state.hpp"
#include "lifecycle_msgs/msg/transition.hpp"

#include "rclcpp/rclcpp.hpp"
#include "rclcpp_lifecycle/lifecycle_node.hpp"

#include "mocap_control/ControlledLifecycleNode.hpp"

namespace mocap_control
{

using std::placeholders::_1;

ControlledLifecycleNode::ControlledLifecycleNode(
  const std::string & system_id,
  const rclcpp::NodeOptions & node_options)
: LifecycleNode(system_id, node_options)
{
  mocap_control_sub_ = create_subscription<mocap_control_msgs::msg::Control>(
    "mocap_control", rclcpp::QoS(100).reliable(),
    std::bind(&ControlledLifecycleNode::control_callback, this, _1));

  mocap_control_pub_ = create_publisher<mocap_control_msgs::msg::Control>(
    "mocap_control", rclcpp::QoS(100).reliable());

  mocap_info_pub_ = create_publisher<mocap_control_msgs::msg::MocapInfo>(
    "mocap_environment", rclcpp::QoS(1000).reliable().transient_local().keep_all());

  mocap_control_pub_->on_activate();
  mocap_info_pub_->on_activate();
}

using CallbackReturnT =
  rclcpp_lifecycle::node_interfaces::LifecycleNodeInterface::CallbackReturn;

CallbackReturnT
ControlledLifecycleNode::on_configure(const rclcpp_lifecycle::State & state)
{
  (void)state;
  mocap_control_msgs::msg::MocapInfo msg;
  msg.mocap_source = get_name();
  msg.topics.assign(topics_.begin(), topics_.end());

  mocap_info_pub_->publish(msg);

  return CallbackReturnT::SUCCESS;
}
CallbackReturnT
ControlledLifecycleNode::on_activate(const rclcpp_lifecycle::State & state)
{
  (void)state;
  return CallbackReturnT::SUCCESS;
}

CallbackReturnT
ControlledLifecycleNode::on_deactivate(const rclcpp_lifecycle::State & state)
{
  (void)state;
  return CallbackReturnT::SUCCESS;
}

CallbackReturnT
ControlledLifecycleNode::on_shutdown(const rclcpp_lifecycle::State & state)
{
  (void)state;
  return CallbackReturnT::SUCCESS;
}

CallbackReturnT
ControlledLifecycleNode::on_cleanup(const rclcpp_lifecycle::State & state)
{
  (void)state;
  return CallbackReturnT::SUCCESS;
}


void
ControlledLifecycleNode::control_callback(const mocap_control_msgs::msg::Control::SharedPtr msg)
{
  if (!msg->mocap_systems.empty() &&
    std::find(msg->mocap_systems.begin(), msg->mocap_systems.end(), get_name()) ==
    msg->mocap_systems.end())
  {
    return;
  }

  switch (msg->control_type) {
    case mocap_control_msgs::msg::Control::START:
      if (get_current_state().id() == lifecycle_msgs::msg::State::PRIMARY_STATE_INACTIVE) {
        trigger_transition(lifecycle_msgs::msg::Transition::TRANSITION_ACTIVATE);
        mocap_control_msgs::msg::Control msg_reply;
        msg_reply.control_type = mocap_control_msgs::msg::Control::ACK_START;
        msg_reply.stamp = now();
        msg_reply.mocap_source = get_name();
        mocap_control_pub_->publish(msg_reply);

        control_start(msg);
      } else {
        RCLCPP_WARN_STREAM(
          get_logger(),
          "Activation requested in state " << get_current_state().label());
      }
      break;

    case mocap_control_msgs::msg::Control::STOP:
      if (get_current_state().id() == lifecycle_msgs::msg::State::PRIMARY_STATE_ACTIVE) {
        trigger_transition(lifecycle_msgs::msg::Transition::TRANSITION_DEACTIVATE);
        mocap_control_msgs::msg::Control msg_reply;
        msg_reply.control_type = mocap_control_msgs::msg::Control::ACK_STOP;
        msg_reply.stamp = now();
        msg_reply.mocap_source = get_name();
        mocap_control_pub_->publish(msg_reply);

        control_stop(msg);
      }
      break;

    default:
      break;
  }
}

}  // namespace mocap_control
