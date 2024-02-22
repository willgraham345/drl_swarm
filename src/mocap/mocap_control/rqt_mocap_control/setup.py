
#!/usr/bin/env python

from distutils.core import setup
from catkin_pkg.python_setup import generate_distutils_setup

d = generate_distutils_setup(
    packages=['rqt_mocap_control'],
    package_dir={'': 'src'},
    scripts=['scripts/rqt_mocap_control']
)

setup(**d)