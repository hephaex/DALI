#!/bin/bash -e
# used pip packages
pip_packages="nose numpy opencv-python"
target_dir=./dali/test/python

# populate epilog and prolog with variants to enable/disable conda
# every test will be executed for bellow configs
prolog=(: enable_conda)
epilog=(: disable_conda)

test_body() {
    # workaround for the CI
    put_optflow_libs
    nosetests --verbose test_optical_flow.py
}

pushd ../..
source ./qa/test_template.sh
popd
