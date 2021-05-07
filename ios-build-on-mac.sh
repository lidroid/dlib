#!/bin/sh
export DLIB_PATH=`pwd`

mkdir -p build/ios
cd build/ios
cmake -G Xcode \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$DLIB_PATH/dlib_ios \
    -DDLIB_PNG_SUPPORT=ON \
    -DDLIB_JPEG_SUPPORT=ON \
    -DDLIB_NO_GUI_SUPPORT=TRUE \
    -DDLIB_USE_BLAS=FALSE \
    -DDLIB_USE_LAPACK=FALSE \
    ../../
cmake --build . --config Release
