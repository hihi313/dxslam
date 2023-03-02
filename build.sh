#!/bin/bash -e

echo "Configuring and building Thirdparty/cnpy ..."

cd Thirdparty/cnpy
mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -GNinja
# make -j
ninja

echo "configuring and building Thirdparty/fbow"

cd ../../fbow
mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -GNinja
# make -j
ninja


echo "configuring and building Thirdparty/Dbow2"


cd ../../DBoW2
mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -GNinja
# make -j
ninja

cd ../../g2o

echo "Configuring and building Thirdparty/g2o ..."

mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -GNinja
# make -j
ninja

cd ../../../

echo "Download and Uncompress vocabulary ..."

mkdir -p Vocabulary
cd Vocabulary
wget --no-clobber https://github.com/ivipsourcecode/dxslam/releases/download/1.0.0/DXSLAM.tar.xz
tar -xf *.tar.xz
cd ..

cd hf-net
wget --no-clobber https://github.com/ivipsourcecode/dxslam/releases/download/1.0.0/model.tar.xz
tar -xf *.tar.xz
cd ..

echo "Configuring and building DXSLAM ..."

mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -GNinja
# make -j4
ninja
