#!/bin/bash

set -e

cd /home/rlevinso/Projects/models/benchmarks/common/tensorflow
chmod +x start.sh
NOINSTALL=True BATCH_SIZE=128 ./start.sh
# intel/models/benchmarks/common/tensorflow/