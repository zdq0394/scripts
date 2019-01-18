#! /bin/sh
ZK_IMG="zookeeper:3.4.13"
### zk1
node=zk1
rm -fr /tmp/$node
mkdir -p /tmp/$node/conf
mkdir -p /tmp/$node/data
mkdir -p /tmp/$node/datalog
mkdir -p /tmp/$node/logs
VOLUME_OPTIONS="-v /tmp/$node/conf:/conf -v /tmp/$node/data:/data -v /tmp/$node/datalog:/datalog -v /tmp/$node/logs:/logs"

docker run -d --name=$node --hostname=$node $VOLUME_OPTIONS $ZK_IMG

### zk2
node=zk2
rm -fr /tmp/$node
mkdir -p /tmp/$node/conf
mkdir -p /tmp/$node/data
mkdir -p /tmp/$node/datalog
mkdir -p /tmp/$node/logs
VOLUME_OPTIONS="-v /tmp/$node/conf:/conf -v /tmp/$node/data:/data -v /tmp/$node/datalog:/datalog -v /tmp/$node/logs:/logs"

docker run -d --name=$node --hostname=$node $VOLUME_OPTIONS $ZK_IMG

### zk3
node=zk3
rm -fr /tmp/$node
mkdir -p /tmp/$node/conf
mkdir -p /tmp/$node/data
mkdir -p /tmp/$node/datalog
mkdir -p /tmp/$node/logs
VOLUME_OPTIONS="-v /tmp/$node/conf:/conf -v /tmp/$node/data:/data -v /tmp/$node/datalog:/datalog -v /tmp/$node/logs:/logs"

docker run -d --name=$node --hostname=$node $VOLUME_OPTIONS $ZK_IMG