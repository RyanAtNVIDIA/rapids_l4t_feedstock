#!/bin/bash

# http://xgboost.readthedocs.io/en/latest/build.html

{
  cmake \
    -D CMAKE_BUILD_TYPE:STRING="Release" \
    -D CMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
    -D USE_CUDA:BOOL=ON \
    -D GPU_COMPUTE_VER:STRING="53;62;72" \
    -D USE_NCCL:BOOL=ON \
    "${SRC_DIR}"
} || {
  cat $SRC_DIR/CMakeFiles/CMakeOutput.log
  cat $SRC_DIR/CMakeFiles/CMakeError.log
  exit 1
}
make -j${CPU_COUNT}
