#! /bin/sh
consul agent -config-dir /etc/consul.d/
CONSUL_IMAGE=registry.docker-cn.com/library/consul:1.4.0
WORKDIR=`pwd`

CONF0_OPTIONS="-p 8500:8500 -v $WORKDIR:/etc/consul.d:ro"
CONF1_OPTIONS="-p 8501:8500 -v $WORKDIR:/etc/consul.d:ro"
CONF2_OPTIONS="-p 8502:8500 -v $WORKDIR:/etc/consul.d:ro"

docker run -d --name=consul0 --hostname=consul0 $CONF0_OPTIONS $CONSUL_IMAGE agent -config-dir=/etc/consul.d

docker run -d --name=consul1 --hostname=consul1 $CONF1_OPTIONS $CONSUL_IMAGE agent -config-dir=/etc/consul.d

docker run -d --name=consul2 --hostname=consul2 $CONF2_OPTIONS $CONSUL_IMAGE agent -config-dir=/etc/consul.d
