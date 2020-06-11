#!/bin/bash

set -e
set -x

git clean -xdf
./build.sh -v clean librmm
