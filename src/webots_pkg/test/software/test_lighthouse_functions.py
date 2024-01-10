#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  

"""
This file is used to test the functions in webots_pkg/lighthouse_functions.py
Usage: pytest -v test_lighthouse_functions.py

Author: Will Graham
"""

#TODO_tests: Confirm that the functions in webots_pkg/lighthouse_functions.py work as expected

import os
import sys
import pytest
import time

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..')))
from webots_pkg.lighthouse_functions import get_cf_pose_according_to_lh, get_only_cf_kalman_pos, compare_kalman_to_lh_pos

def test_get_only_cf_kalman_pos():
    start_time = time.time()
    while time.time() - start_time < 3:
        get_only_cf_kalman_pos()

def test_kalm_vs_lh():
    start_time = time.time()
    while time.time() - start_time < 10:
        compare_kalman_to_lh_pos()

def test_get_cf_pose_according_to_lh(): #FIXME: cf_pose_according to lh isn't consistent with logging framework
    start_time = time.time()
    while time.time() - start_time < 3:
        get_cf_pose_according_to_lh()

if __name__ == "__main__":
    # test_ReadLHMem()
    # test_WriteLHMem()
    test_get_cf_pose()
    test_get_cf_pose_according_to_lh()