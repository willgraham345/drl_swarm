import os
from glob import glob
from setuptools import setup


package_name = 'drl_pkg'
data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ]

def package_files(data_files, directory_list):
    paths_dict = {}
    for directory in directory_list:
        for (path, directories, filenames) in os.walk(directory):
            for filename in filenames:
                file_path = os.path.join(path, filename)
                install_path = os.path.join('share', package_name, path)
                if install_path in paths_dict.keys():
                    paths_dict[install_path].append(file_path)
                else:
                    paths_dict[install_path] = [file_path]

    for key in paths_dict.keys():
        data_files.append((key, paths_dict[key]))

    return data_files


setup(
    name=package_name,
    version='0.0.0',
    packages=[package_name],
    data_files=package_files(data_files, ['config/', 'resource/', 'launch/', 'worlds/', 'params/']),
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='will',
    maintainer_email='willgraham345@gmail.com',
    description='Controlling package to launch heterogeneous multi-robo ROS2 system in both simulation and experimentation',
    license='Apache License 2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'drl_pkg_driver = drl_pkg.drl_pkg_driver:main',
            'cf_publisher = drl_pkg.crazyflie_publisher:main',
            'potential_field = drl_pkg.potential_field_node:main',
            'simple_mapper = drl_pkg.simple_mapper:main',
            'crazyflie_controller = drl_pkg.crazyflie_controller:main'
            'webots_world_launch = drl_pkg.webots_world_launch:main'
        ],
    },
)