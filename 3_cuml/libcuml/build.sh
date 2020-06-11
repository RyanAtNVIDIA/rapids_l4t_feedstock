#!/bin/sh

set -e
set -x

mkdir cpp/build
pushd cpp/build

cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      -DCMAKE_CXX11_ABI=ON \
      -DBLAS_LIBRARIES=${PREFIX}/lib/libopenblas.so.0 \
      -DGPU_ARCHS="62;72" \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_CUML_C_LIBRARY=ON \
      -DBUILD_CUML_STD_COMMS=ON \
      -DWITH_UCX=ON \
      -DBUILD_CUML_MPI_COMMS=ON \
      -DNVTX=ON \
      -DPARALLEL_LEVEL=${PARALLEL_LEVEL} \
      -DNCCL_PATH=${PREFIX} \
      -DDISABLE_DEPRECATION_WARNING=ON \
      -DCMAKE_PREFIX_PATH=${PREFIX} \
      ..

make -j${PARALLEL_LEVEL} cuml++ cuml ml ml_mg install
