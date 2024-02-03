// Copyright 2022 Intelligent Robotics Lab
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

#include <memory>

#include "mocap_robot_gt/set_gt_component.hpp"

#include "rclcpp/rclcpp.hpp"

int main(int argc, char * argv[])
{
  rclcpp::init(argc, argv);

  if (argc == 2 && strcmp(argv[1], "-h") == 0) {
    std::cout << "Usage: " << std::endl;
    std::cerr << "\tset_gt_cli\t# Set GT origin to curren pos" << std::endl;
    std::cerr << "\tset_gt_cli x y z roll ptch yaw\t# Set GT origin to a pos" << std::endl;
  } else {
    auto set_gt_node = std::make_shared<mocap_robot_gt::SetGTNode>();

    std::vector<double> coords(argc - 1, 0.0);
    for (int i = 0; i < argc - 1; i++) {
      coords[i] = atof(argv[i + 1]);
    }
    set_gt_node->set_gt(coords);
  }

  rclcpp::shutdown();
  return 0;
}
