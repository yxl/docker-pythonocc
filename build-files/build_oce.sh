#!/bin/bash

OCE_VERSION=$1

ln -s /usr/local/lib/libTKV3d.so.7.7 /usr/lib/libTKV3d.so.7.7
ln -s /usr/local/lib/libTKBRep.so.7.7 /usr/lib/libTKBRep.so.7.7
tar -xzf ../opencascade-$OCE_VERSION.tgz
cmake ./opencascade-$OCE_VERSION -D BUILD_RELEASE_DISABLE_EXCEPTIONS=OFF
make -j$(nproc --all)
make install/strip
rm -rf * .*
echo -en "\007"
