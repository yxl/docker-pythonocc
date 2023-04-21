#!/bin/bash

OCE_VERSION=$1

tar -xf opencascade-$OCE_VERSION.tar.gz
cmake ./oce-OCE-$OCE_VERSION
make -j$(nproc --all)
make install/strip
#rm -rf * .*
echo -en "\007"

