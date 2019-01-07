#! /bin/sh
echo "Start consul cluster..."
CONSUL_IMAGE=registry.docker-cn.com/library/consul:1.4.0
WORKDIR=`pwd`

CONF0_OPTIONS="-p 8500:8500 -v $WORKDIR/consul0:/etc/consul.d"
docker run -d --name=consul0 --hostname=consul0 $CONF0_OPTIONS $CONSUL_IMAGE \
    agent -server -bind=0.0.0.0 -bootstrap-expect=3 \
    -node=consul0 -data-dir=/tmp/consul -config-dir=/etc/consul.d \
    -enable-script-checks=true

CONF1_OPTIONS="-v $WORKDIR/consul1:/etc/consul.d"
docker run -d --name=consul1 --hostname=consul1 $CONF1_OPTIONS $CONSUL_IMAGE \
    agent -server -bind=0.0.0.0 \
    -node=consul1 -data-dir=/tmp/consul -config-dir=/etc/consul.d \
    -enable-script-checks=true

CONF2_OPTIONS="-v $WORKDIR/consul2:/etc/consul.d"
docker run -d --name=consul2 --hostname=consul2 $CONF2_OPTIONS $CONSUL_IMAGE \
    agent -server -bind=0.0.0.0 \
    -node=consul2 -data-dir=/tmp/consul -config-dir=/etc/consul.d \
    -enable-script-checks=true

docker exec -it consul1 consul join 172.17.0.2
docker exec -it consul2 consul join 172.17.0.2