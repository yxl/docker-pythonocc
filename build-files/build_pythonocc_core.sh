#!/bin/bash

PYTHON_OCC_CORE_VERSION=$1

wget -q https://github.com/tpaviot/pythonocc-core/archive/$PYTHON_OCC_CORE_VERSION.tar.gz
tar -xf $PYTHON_OCC_CORE_VERSION.tar.gz

cmake ./pythonocc-core-$PYTHON_OCC_CORE_VERSION

make -j$(nproc --all)
make install
rm -rf * .*
echo -en "\007"

