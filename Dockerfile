FROM python:3.9

COPY sources.list /etc/apt/sources.list

RUN     apt-get update && \
        apt-get install -y \
            automake \
            bison \
            build-essential \
            cmake \
            libboost-dev \
            libgl1-mesa-dev \
            libglu1-mesa-dev \
            libharfbuzz-dev \
            libpcre3-dev \
            libsm6 \
            wget

WORKDIR /tmp/build

ARG SWIG_VERSION=4.0.2
ARG FREETYPE_VERSION=2.13.0
ARG OCE_VERSION=7.7.0
ARG SMESH_VERSION=6.7.6
ARG PYTHONOCC_CORE_VERSION=7.7.0

COPY usr/local/include/ /usr/local/include/

COPY build-files/build_swig.sh /tmp
RUN bash ../build_swig.sh $SWIG_VERSION

COPY build-files/build_freetype.sh /tmp
RUN bash ../build_freetype.sh $FREETYPE_VERSION

COPY build-files/opencascade-$OCE_VERSION.tgz /tmp
COPY build-files/build_oce.sh /tmp
RUN bash ../build_oce.sh $OCE_VERSION

COPY build-files/build_smesh.sh /tmp
RUN bash ../build_smesh.sh $SMESH_VERSION

COPY build-files/build_pythonocc_core.sh /tmp
RUN bash ../build_pythonocc_core.sh $PYTHONOCC_CORE_VERSION

RUN pip install six

RUN echo "export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH" >> /etc/bash.bashrc
RUN export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

WORKDIR /

RUN     apt-get remove --auto-remove -y \
            automake \
            bison \
            build-essential \
            cmake \
            libboost-dev \
            libpcre3-dev \
            wget && \
        rm -rf /var/lib/apt/lists/*
