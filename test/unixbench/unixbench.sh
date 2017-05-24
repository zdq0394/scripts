#!/bin/bash
echo "========================================================================="
echo "Thanks for using UnixBench 5.1.3 for CentOS Auto-Install Script"
echo "========================================================================="
yum -y install wget make gcc gcc-c automake autoconf libtool gcc-c++ time perl-Time-HiRes SDL-devel mesa-libGL-devel
git clone http://github.com/zdq0394/scripts.git
cd scripts/test/unixbench
tar xzf UnixBench5.1.3.tar
cd UnixBench
make
./Run
echo "========================================================================="
echo "test end"
echo "========================================================================="
echo ""
echo "http://bbs.itzmx.com"
echo ""
echo "Thank you!"
echo "========================================================================="
