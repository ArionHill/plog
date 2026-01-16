#!/bin/sh

set -x

SOURCE_DIR=`pwd`
BUILD_DIR=${BUILD_DIR:-../build}
BUILD_TYPE=${BUILD_TYPE:-Debug}
INSTALL_DIR=${INSTALL_DIR:-../${BUILD_TYPE}-install-cpp23}
# CXX=${CXX:-/grid/common/pkgs/gcc/v15.2.0/bin/g++}
# C=${C:-/grid/common/pkgs/gcc/v15.2.0/bin/gcc}

ln -sf $BUILD_DIR/$BUILD_TYPE-cpp23/compile_commands.json

mkdir -p $BUILD_DIR/$BUILD_TYPE-cpp23 \
    && cd $BUILD_DIR/$BUILD_TYPE-cpp23 \
    && cmake \
           -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
           -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
           -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
           $SOURCE_DIR \
    && make $*

# Use the following command to run all the unit tests
# at the dir $BUILD_DIR/$BUILD_TYPE :
# CTEST_OUTPUT_ON_FAILURE=TRUE make test

# cd $SOURCE_DIR && doxygen
