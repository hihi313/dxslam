#!/bin/bash -e

PATH_TO_SEQUENCE=/datasets/TUM-RGBD/rgbd_dataset_freiburg1_desk

# 2. Associate RGB images and depth images using the python script 
# cd "${PATH_TO_SEQUENCE}"
# python3 ../associate.py ./rgb.txt ./depth.txt > ./associations.txt

# 3. Get HF-net output
cd /app/src/dxslam/hf-net
# python3 getFeature.py "${PATH_TO_SEQUENCE}/rgb" ./model/output_features

cd /app/src/dxslam
ldconfig
./Examples/RGB-D/rgbd_tum Vocabulary/DXSLAM.fbow "${PATH_TO_SEQUENCE}/../TUM1.yaml" "${PATH_TO_SEQUENCE}" "${PATH_TO_SEQUENCE}/associations.txt" "${PATH_TO_SEQUENCE}/hf_net_features"