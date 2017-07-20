#! /bin/bash
echo "Install epel-release"
yum -y install epel-release
yum clean all
echo "Install fio"
yum -y install fio


ioengine="libaio"
disk="/dev/vdb"
iodepth="128"
runtime="300"
size="100G"

#arg1: block size: 4k,8k,1M
#arg2: test mode: randread, randwrite, read, write, randrw, rw
function fio_test()
{
 fio -ioengine=$ioengine -bs=$1 -direct=1 -thread -rw=$2 -size=$size -filename=$disk -name="test $2 $1" -iodepth=$iodepth -runtime=$runtime
}

fio_test("8K" "randread")
