#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  


"""
This file is used to test the functions in pre_launch_deploy_swarm.py
Usage: pytest -v test_pre_launch_deploy_swarm.py

Author: Will Graham
"""

import os
import sys
import pytest
import json
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..')))
from webots_pkg.swarm_classes import cf_dict2json, tb_dict2json, Swarm, cf, tb, JSONReadHandler
import os
import json
import pytest
from webots_pkg.swarm_classes import JSONReadHandler

name = "Robot3"
translation_unit = [1, 2, 3]


def test_json_read_handler():
    # Create a temporary JSON file
    json_file_path = "test_json_file.json"
    with open(json_file_path, 'w') as f:
        f.write('{"name": "Robot3", "translation": [1, 2, 3], "children": [{"DEF": "Multiranger"}]}')

    # Test reading the JSON file using JSONReadHandler
    handler = JSONReadHandler(json_file_path)
    assert handler.get_name() == "Robot3"
    assert handler.get_translation() == [1, 2, 3]
    assert handler.get_children() == [{"DEF": "Multiranger"}]

    # Clean up the temporary JSON file
    os.remove(json_file_path)

#FIXME: These tests are pretty bad, need lots of work.
# def test_create_cf_dict_json_file():
    
#     cf = cf_dict2json(name, translation_unit)

#     cf.write_dict_to_json()

# @pytest.mark.dependency(depends=["test_create_cf_dict_json_file"])
# def test_read_cf_dict_json_file():
#     #TODO: Remove this test in favor of testing the JSONReadHandler
#     # Remove Robot from the first line 
#     with open('test_cf.json', 'r') as f:
#         first_line = f.readline()
#         rest= f.read()
#         assert first_line == 'Robot {\n'

#     with open('test_cf.json', 'w') as f:
#         f.write("{")
#         f.write(rest)
    
#     with open('test_cf.json', 'r') as f:
#         cf_robot = json.load(f)
#         print(cf_robot)


#     assert cf_robot["name"] == name
#     assert cf_robot["translation"] == translation_unit
#     assert cf_robot["children"][0]["DEF"] == "Multiranger"  

#     os.remove('test_cf.json')

# def test_create_tb_dict_json_file():
#     tb = tb_dict2json(name, translation_unit)

#     # tb_robot = tb.tb_dict["Turtlebot3Burger"]
#     tb.write_dict_to_json()
#     assert 1 == 1

# @pytest.mark.dependency(depends=["test_create_tb_dict_json_file"])
# def test_read_tb_dict_json_file():
#     # Remove Robot from the first line 
#     with open('test_tb.json', 'r') as f:
#         first_line = f.readline()
    
#     with open('test_tb.json', 'r') as f:
#         rest= f.read()
    
#     with open('test_tb.json', 'w') as f:
#         f.write("{")
#         f.write(rest)
#     assert first_line == 'TurtleBot3Burger {\n'

#     os.remove('test_tb.json')




# Define Swarm
cf1 = cf("cf1", [-1, -1, 0.015])
cf2 = cf("cf2", [-2, -2, 0.015])
tb1 = tb("tb1", [-1.5, -1.5, 0.015])
tb2 = tb("tb2", [-2.5, -2.5, 0.015])
swarm = Swarm([tb1, tb2], [cf1, cf2])

def test_swarm_dict_json_file():
    json_file_path = "test_swarm.json"
    swarm.write_swarm_to_json(json_file_path)
    print("json file written")
    with open(json_file_path, 'r') as f:
        print("json file opened")
        file_contents = f.read()
        print(file_contents)
    # TODO: add tests to confirm that we're getting the right output
    
    # TODO: Remove the testing files from the test directory
    # os.remove(json_file_path)
        
if __name__ == "__main__":
    # if __name__ == '__main__': run pytest
    pytest.main([__file__])