# 
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# <tetractius@gmail.com> wrote this file.  As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.   Poul-Henning Kamp
# ----------------------------------------------------------------------------
# 

#!/bin/bash

mkdir -p /qt-source 
mkdir -p /qt-build 

pushd /qt-source

wget https://download.qt.io/official_releases/qt/5.10/5.10.1/single/qt-everywhere-src-5.10.1.tar.xz 
tar -I pxz -xvf qt-everywhere-src-5.10.1.tar.xz 

pushd /qt-build

/qt-source/qt-everywhere-src-5.10.1/configure \
  -opensource \
  -confirm-license \
  -system-zlib \
  -system-libpng \
  -system-libjpeg \
  -no-gtk \
  -prefix /opt/Qt5.10.1 

make -j$(nproc) VERBOSE=1 
make -j$(nproc) install 

popd 
popd  

find /opt/Qt5.10.1 

rm -rf /qt-source 

rm -rf /qt-build
