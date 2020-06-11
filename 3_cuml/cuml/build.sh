#!/usr/bin/env bash

cd python
python setup.py build_ext --inplace --singlegpu
python setup.py install --single-version-externally-managed --record=record.txt --singlegpu
