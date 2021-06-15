# RAPIDS-L4T
This repository is dedicated to maintaining a "Feedstock"-like set of build scripts to create necessary libraries for building the NVIDIA RAPIDS ecosystem for the NVIDIA Jetson ecosystem of products.  Starting with v0.14.0 the RAPIDS ecosystem has made changes necessary to allow building of products for aarch64 architecture.  Official support remains for CUDA CC 6.+, meaning the Jetson Nano is not officially supported.  However, RAPIDS cuDF does not rely on any 6.+ functionality and is unofficially built and tested for the Jetson Nano.  All other RAPIDS libraries require a TX2, AGX Xavier, or Xavier NX product in order to run.

## Initial setup
1) Fresh install of jetpack
2) Update to cuda 11.0
