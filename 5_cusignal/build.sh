#!/bin/sh

set -e
set -x

cd python
PARALLEL_LEVEL=${PARALLEL_LEVEL} GPU_ARCH="-DGPU_ARCH=53;62;72" python setup.py install --single-version-externally-managed --record record.txt
