#!/bin/sh

set -e
set -x

mkdir cpp/build
pushd cpp/build

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
               -DCMAKE_CXX11_ABI=ON \
               -DGPU_ARCHS="53;62;72" \
               -DUSE_NVTX=ON \
               -DBUILD_BENCHMARKS=OFF \
               -DBUILD_TESTS=OFF \
               -DDISABLE_DEPRECATION_WARNING=ON \
               -DCMAKE_BUILD_TYPE=Release ..

make -j${PARALLEL_LEVEL} install_nvstrings
