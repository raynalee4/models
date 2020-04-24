#!/bin/bash
source scl_source enable devtoolset-8 rh-python36
set -e

cd /intel/models/benchmarks

python launch_benchmark.py \
    --in-graph /home/rlevinso/Projects/ssd_resnet34_int8_bs1_pretrained_model.pb \
    --model-source-dir /home/rlevinso/Projects/tensorflow-models \
    --model-name ssd-resnet34 \
    --framework tensorflow \
    --precision int8 \
    --mode inference \
    --socket-id 0 \
    --batch-size=1 \
    --benchmark-only
    #--docker-image intel/intel-optimized-tensorflow:2.1.0 \
    