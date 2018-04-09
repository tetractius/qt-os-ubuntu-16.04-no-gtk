# 
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# <tetractius@gmail.com> wrote this file.  As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.   Poul-Henning Kamp
# ----------------------------------------------------------------------------
# 

FROM ubuntu:16.04

MAINTAINER "Filippo Trimoldi" <filippo.trimoldi@gmail.com>

RUN apt-get update -y # && apt-get upgrade -y
RUN apt-get install -qq -y \
      build-essential \
      libtool \
      curl \
      git \
      libjpeg8-dev \
      libpng12-dev \
      libtiff5-dev \
      libgoogle-glog-dev \
      libgflags-dev \
      libhdf5-dev \
      libxcb-xfixes0-dev \
      libssl-dev \
      pxz \
      wget \
      mesa-common-dev \
      libgl1-mesa-dev \
      python-dev \
      python3-dev

ADD ./qt5.10.1.sh /qt5.10.1.sh

# Download qt and compile opensource without GTK support
RUN bash /qt5.10.1.sh

