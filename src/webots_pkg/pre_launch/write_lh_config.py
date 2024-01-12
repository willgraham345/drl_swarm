#                     ____  _            __          __                                            
#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  

"""
This file is used to write the lighthouse rotation matrices and starting position origins to the Crazyflie embedded memory 
Usage: python3 write_lh_config.py

Author: Will Graham
"""



import os
import sys
import argparse
import pytest

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.lighthouse_classes import ReadLHMem, WriteLHGeoMem, WriteLHMem
from cflib.crazyflie import Crazyflie

import cflib.crtp
from cflib.crazyflie.mem import LighthouseBsGeometry
from cflib.utils import uri_helper
import tf_transformations
import rclpy
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from webots_pkg.lighthouse_node import LighthousePose

# ...
# Define the z offset value here
Z_OFFSET = 0.09  #TODO: Confirm that this is in meters


ROTATION_MATRIX = [
    [0.0, 0.0, -1.0],
    [0.0, 1.0, 0.0],
    [1.0, 0.0, 0.0],]
# ...




def parse_arguments():
    parser = argparse.ArgumentParser(description='Process integer pairs and save them into lists.')
    parser.add_argument('-uri', type=str, help='URI of the Crazyflie to connect to', required=False, default="radio://0/80/2M/E7E7E7E7E7")
    parser.add_argument('--bs0', nargs=2, type=float, required=True, help='First pair of integers')
    parser.add_argument('--bs1', nargs=2, type=float, required=True, help='Second pair of integers')
    parser.add_argument('--bs2', nargs=2, type=float, required=False, help='Third pair of integers', default=None)
    parser.add_argument('--bs3', nargs=2, type=float, required=False, help='Fourth pair of integers', default=None)

    args = parser.parse_args()

    # # Convert ints to floats
    # args.bs0 = [float(x) for x in args.bs0]
    # args.bs1 = [float(x) for x in args.bs1]
    # if args.bs2 is not None:
    #     args.bs2 = [float(x) for x in args.bs2]
    # if args.bs3 is not None:
    #     args.bs3 = [float(x) for x in args.bs3]
    
    # Append z offset to all existing lists in args variable
    args.bs0.append(Z_OFFSET)
    args.bs1.append(Z_OFFSET)
    if args.bs2 is not None:
        args.bs2.append(Z_OFFSET)
    if args.bs3 is not None:
        args.bs3.append(Z_OFFSET)

    return args

def main():
    args = parse_arguments()

    cflib.crtp.init_drivers(args.uri)

    geo_dict = {}
    
    for i, bs in enumerate([args.bs0, args.bs1, args.bs2, args.bs3]):
        if bs is None:
            continue
        bs_geo = LighthouseBsGeometry()
        bs_geo.origin = bs
        bs_geo.rotation_matrix = ROTATION_MATRIX
        bs_geo.valid = True
        geo_dict = {i: bs_geo}
        WriteLHGeoMem(args.uri, geo_dict)
    


if __name__ == '__main__':
    main()