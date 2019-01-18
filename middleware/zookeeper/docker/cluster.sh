#! /bin/sh
ZK_IMG="zookeeper:3.4.13"
ZKS_ENV="server.1=172.17.0.2:2888:3888 server.2=172.17.0.3:2888:3888 server.3=172.17.0.4:2888:3888"

### zk1
node=zk1
rm -fr /tmp/$node
cp -R $node /tmp/$node
VOLUME_OPTIONS="-v /tmp/$node/conf:/conf -v /tmp/$node/data:/data -v /tmp/$node/datalog:/datalog -v /tmp/$node/logs:/logs"

docker run -d --name=$node --hostname=$node $VOLUME_OPTIONS --env ZOO_SERVERS=$ZKS_ENV $ZK_IMG

### zk2
node=zk2
rm -fr /tmp/$node
cp -R $node /tmp/$node
VOLUME_OPTIONS="-v /tmp/$node/conf:/conf -v /tmp/$node/data:/data -v /tmp/$node/datalog:/datalog -v /tmp/$node/logs:/logs"

docker run -d --name=$node --hostname=$node $VOLUME_OPTIONS --env ZOO_SERVERS=$ZKS_ENV $ZK_IMG

### zk3
node=zk3
rm -fr /tmp/$node
cp -R $node /tmp/$node
VOLUME_OPTIONS="-v /tmp/$node/conf:/conf -v /tmp/$node/data:/data -v /tmp/$node/datalog:/datalog -v /tmp/$node/logs:/logs"

docker run -d --name=$node --hostname=$node $VOLUME_OPTIONS --env ZOO_SERVERS=$ZKS_ENV $ZK_IMG