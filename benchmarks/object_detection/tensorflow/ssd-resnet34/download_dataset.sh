#!/bin/bash
set -e

#mkdir /intel/coco
#cd /intel/coco
cd /home/rlevinso/Projects/models

mkdir val
cd val
wget http://images.cocodataset.org/zips/val2017.zip
unzip val2017.zip
cd ..

mkdir annotations
cd annotations
wget http://images.cocodataset.org/annotations/annotations_trainval2017.zip
unzip annotations_trainval2017.zip
cd ..

mkdir empty_dir

cd annotations
echo "{ \"images\": {}, \"categories\": {}}" > empty.json
cd ..
pwd

wget https://storage.googleapis.com/intel-optimized-tensorflow/models/v1_6/ssd_resnet34_int8_bs1_pretrained_model.pb