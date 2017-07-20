#!/bin/bash
echo "========================================================================="
echo "Thanks for using UnixBench 5.1.3 for CentOS Auto-Install Script"
echo "========================================================================="
yum -y install wget make gcc gcc-c automake autoconf libtool gcc-c++ time perl-Time-HiRes SDL-devel mesa-libGL-devel
tar xf UnixBench5.1.3.tar
cd UnixBench
make
./Run
echo "========================================================================="
echo "test end"
echo "Thank you!"
echo "========================================================================="
