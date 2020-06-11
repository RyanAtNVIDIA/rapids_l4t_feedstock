#!/bin/bash

set -xeuo pipefail

CUDA_GDB_EXECUTABLE=$(which cuda-gdb || exit 0)
if [[ -n "$CUDA_GDB_EXECUTABLE" ]]
then
    CUDA_HOME=$(dirname $(dirname $CUDA_GDB_EXECUTABLE))
else
    echo "Cannot determine CUDA_HOME: cuda-gdb not in PATH"
    return 1
fi

./autogen.sh

mkdir build
pushd build

../contrib/configure-release \
    --prefix=$PREFIX \
    --disable-numa \
    --with-cuda=$CUDA_HOME \
    --enable-mt \
    CPPFLAGS="-I/$CUDA_HOME/include"

make -j${CPU_COUNT} install
