#!/bin/sh

set -e
set -x

mkdir cpp/build
pushd cpp/build



cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DDISABLE_DEPRECATION_WARNING=ON \
      -DCMAKE_CUDA_FLAGS="-gencode arch=compute_62,code=sm_62 -gencode arch=compute_72,code=sm_72" \
      ..

make -j${PARALLEL_LEVEL} install
