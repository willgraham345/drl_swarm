import os
import os
import sys
import pytest
import json
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.swarm_classes import cf_dict2json, tb_dict2json

name = "Robot3"
translation_unit = [1, 2, 3]

@pytest.mark.pre_launch
def test_create_cf_dict_json_file():
    
    cf = cf_dict2json(name, translation_unit)

    # cf_robot = cf.cf_dict["Robot"]
    cf.write_dict_to_json()

@pytest.mark.pre_launch
@pytest.mark.dependency(depends=["test_create_cf_dict_json_file"])
def test_read_cf_dict_json_file():
    # Remove Robot from the first line 
    with open('test_cf.json', 'r') as f:
        first_line = f.readline()
        rest= f.read()
        assert first_line == 'Robot {\n'
        #TODO: Figure out why I can't write "Robot {" to the file

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

@pytest.mark.pre_launch
def test_create_tb_dict_json_file():
    tb = tb_dict2json(name, translation_unit)

    # tb_robot = tb.tb_dict["Turtlebot3Burger"]
    tb.write_dict_to_json()
    assert 1 == 1

@pytest.mark.pre_launch
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
    

    


if __name__ == "__main__":
    # if __name__ == '__main__': run pytest
    pytest.main([__file__])