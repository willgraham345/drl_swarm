import os
import sys
import pytest
import json
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.swarm_classes import cf_dict2json, tb_dict2json, Swarm, Crazyflie, Turtlebot

name = "Robot3"
translation_unit = [1, 2, 3]

def test_create_cf_dict_json_file():
    
    cf = cf_dict2json(name, translation_unit)

    # cf_robot = cf.cf_dict["Robot"]
    cf.write_dict_to_json()

@pytest.mark.dependency(depends=["test_create_cf_dict_json_file"])
def test_read_cf_dict_json_file():
    # Remove Robot from the first line 
    with open('test_cf.json', 'r') as f:
        first_line = f.readline()
        rest= f.read()
        assert first_line == 'Robot {\n'

    with open('test_cf.json', 'w') as f:
        f.write("{")
        f.write(rest)
    
    with open('test_cf.json', 'r') as f:
        cf_robot = json.load(f)
        print(cf_robot)


    assert cf_robot["name"] == name
    assert cf_robot["translation"] == translation_unit
    assert cf_robot["children"][0]["DEF"] == "Multiranger"  

    # os.remove('test_cf.json')

def test_create_tb_dict_json_file():
    tb = tb_dict2json(name, translation_unit)

    # tb_robot = tb.tb_dict["Turtlebot3Burger"]
    tb.write_dict_to_json()
    assert 1 == 1

@pytest.mark.dependency(depends=["test_create_tb_dict_json_file"])
def test_read_tb_dict_json_file():
    # Remove Robot from the first line 
    with open('test_tb.json', 'r') as f:
        first_line = f.readline()
    
    with open('test_tb.json', 'r') as f:
        rest= f.read()
    
    with open('test_tb.json', 'w') as f:
        f.write("{")
        f.write(rest)
    assert first_line == 'TurtleBot3Burger {\n'

    os.remove('test_tb.json')




# Define Swarm
cf1 = Crazyflie("cf1", [-1, -1, 0.015])
cf2 = Crazyflie("cf2", [-2, -2, 0.015])
tb1 = Turtlebot("tb1", [-1.5, -1.5, 0.015])
tb2 = Turtlebot("tb2", [-2.5, -2.5, 0.015])
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