// Copyright 2021 Intelligent Robotics Lab
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

#ifndef MOCAP_CONTROL__AUXILIARNODE_HPP_
#define MOCAP_CONTROL__AUXILIARNODE_HPP_

#include <string>

#include "mocap_control/ControlledLifecycleNode.hpp"

#include "rclcpp/rclcpp.hpp"
#include "rclcpp_lifecycle/lifecycle_node.hpp"

namespace mocap_control
{
class AuxiliarNode : public ControlledLifecycleNode
{
public:
  explicit AuxiliarNode(const std::string & system_id);

protected:
  using CallbackReturnT =
    rclcpp_lifecycle::node_interfaces::LifecycleNodeInterface::CallbackReturn;

  CallbackReturnT on_configure(const rclcpp_lifecycle::State & state);

  void control_start(const mocap_control_msgs::msg::Control::SharedPtr msg) final;
  void control_stop(const mocap_control_msgs::msg::Control::SharedPtr msg) final;
};

}  // namespace mocap_control

#endif  // MOCAP_CONTROL__AUXILIARNODE_HPP_
