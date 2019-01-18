#! /bin/sh
ZK_IMG="zookeeper:3.4.13"

mkdir -p /tmp/zk1/conf
mkdir -p /tmp/zk1/data
mkdir -p /tmp/zk1/datalog
mkdir -p /tmp/zk1/logs
VOLUME_OPTIONS1="-v /tmp/zk1/conf:/conf -v /tmp/zk1/data:/data -v /tmp/zk1/datalog:/datalog -v /tmp/zk1/logs:/logs"

docker run -d --name=zk1 $VOLUME_OPTIONS1 $ZK_IMG