#! /bin/sh
ZK_IMG="zookeeper:3.4.13"

PWD_DIR=`pwd`

VOLUME_OPTIONS1="-v $PWD_DIR/zk1/conf:/conf -v $PWD_DIR/zk1/data:/data -v $PWD_DIR/zk1/datalog:/datalog -v $PWD_DIR/zk1/logs:/logs"

docker run -d --name=zk1 $VOLUME_OPTIONS1 $ZK_IMG