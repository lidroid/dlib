#!/bin/sh

export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_NDK=$ANDROID_HOME/ndk/22.1.7171670
export CMAKE_HOME=$ANDROID_HOME/cmake/3.18.1/bin
export CMAKE=$CMAKE_HOME/cmake
export NINJA=$CMAKE_HOME/ninja
export CMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake
export DLIB_PATH=`pwd`

mkdir -p build/android
cd build/android
$CMAKE -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_TOOLCHAIN_FILE=$CMAKE_TOOLCHAIN_FILE \
    -DCMAKE_INSTALL_PREFIX=$DLIB_PATH/release/android \
    -DANDROID_NDK=$ANDROID_NDK \
    -DANDROID_TOOLCHAIN=clang \
    -DCMAKE_ANDROID_ARCH_ABI=armeabi-v7a \
    -DANDROID_ABI=armeabi-v7a \
    -DANDROID_LINKER_FLAGS="-landroid -llog" \
    -DANDROID_NATIVE_API_LEVEL=27 \
    -DANDROID_STL=c++_static \
    -DDLIB_PNG_SUPPORT=ON \
    -DDLIB_JPEG_SUPPORT=ON \
    -DDLIB_NO_GUI_SUPPORT=TRUE \
    -DDLIB_USE_BLAS=FALSE \
    -DDLIB_USE_LAPACK=FALSE \
    -DANDROID_CPP_FEATURES="rtti exceptions" \
    -DCMAKE_MAKE_PROGRAM=$NINJA \
    ../../
$NINJA
$NINJA install
