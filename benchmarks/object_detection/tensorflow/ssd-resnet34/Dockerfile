
#FROM docker-registry.default.svc:5000/mlperf/object-detection-cpu@sha256:60be4c52a7f3e7131fc3b7295e852269c3675db3b4829183b423d2886c544afb
FROM centos:7
#FROM nvidia/cuda:10.0-cudnn7-devel-ubi7

WORKDIR /intel

#WORKDIR /intel/models/benchmarks/object_detection/tensorflow/ssd-resnet34
#RUN curl -O https://raw.githubusercontent.com/raynalee4/models/object-detection/benchmarks/object_detection/tensorflow/ssd-resnet34/run_and_time.sh
#WORKDIR /intel/models/benchmarks
#RUN curl -O https://raw.githubusercontent.com/raynalee4/models/object-detection/benchmarks/launch_benchmark.py
#WORKDIR /intel/models/benchmarks/common/tensorflow
#RUN curl -O https://raw.githubusercontent.com/raynalee4/models/object-detection/benchmarks/common/tensorflow/start_noinstall.sh


ENV CUDA_VISIBLE_DEVICES=''
ENV PATH $PATH:$CUDA_HOME/bin
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN yum update -y && yum install -y \
    ca-certificates \
    build-essential \
    git \
    curl \
    wget \
    unzip \
    which \
    python-setuptools \
    cmake tkinter numactl google-perftools \
    libSM libXext \
    openmpi-devel \
    openssh openssh-server

# Use this block with CentOS image base
RUN yum install -y centos-release-scl
RUN yum install rh-python36 -y devtoolset-8

#Use this block with ubi7 image base
#RUN yum-config-manager --enable rhel-server-rhscl-7-rpms rhel-7-server-devtools-rpms && \    
#  yum install -y scl-utils devtoolset-8 rh-python36

RUN git clone https://github.com/raynalee4/models.git -b object-detection

WORKDIR /intel/models/benchmarks/object_detection/tensorflow/ssd-resnet34
RUN source scl_source enable devtoolset-8 rh-python36 && \
    pip install --upgrade pip && \
    pip install numpy==1.17.4 Cython && \
    pip install -r requirements.txt && \
    pip install intel-tensorflow==2.1.0 requests && \
    yum install python-setuptools

WORKDIR /intel
RUN source scl_source enable devtoolset-8 rh-python36 && \
    git clone https://github.com/tensorflow/models.git tensorflow-models && \
	cd tensorflow-models && \
	git clone https://github.com/cocodataset/cocoapi.git && \
	cd cocoapi/PythonAPI && \
	make && \
	cp -r pycocotools /intel/research/

WORKDIR /intel/tensorflow-models/research

ENV PYTHONPATH /intel/models/benchmarks:/opt/rh/rh-python36/root/usr/bin/python:/intel/tensorflow-models/research:/intel/tensorflow-models/research/slim:/intel/tensorflow-models/research/object_detection/

RUN source scl_source enable devtoolset-8 rh-python36 && \
	python setup.py build && \
	python setup.py install && \
	wget -O protobuf.zip https://github.com/google/protobuf/releases/download/v3.0.0/protoc-3.0.0-linux-x86_64.zip && \
	unzip protobuf.zip && \
    ./bin/protoc object_detection/protos/*.proto --python_out=.



#	git checkout f505cecde2d8ebf6fe15f40fb8bc350b2b1ed5dc && \
