#! /bin/sh
REDIS_IMAGE=registry.docker-cn.com/library/redis:5.0.1
CONF_OPTIONS="-v /opt/gopath/src/github.com/zdq0394/scripts/deploy/redis/cluster/redis-conf:/etc/redis"
docker run -d --name=redis0 --hostname=redis0 $CONF_OPTIONS $REDIS_IMAGE redis-server /etc/redis/redis0.conf 
docker run -d --name=redis1 --hostname=redis1 $CONF_OPTIONS $REDIS_IMAGE redis-server /etc/redis/redis1.conf 
docker run -d --name=redis2 --hostname=redis2 $CONF_OPTIONS $REDIS_IMAGE redis-server /etc/redis/redis2.conf
docker run -d --name=redis3 --hostname=redis3 $CONF_OPTIONS $REDIS_IMAGE redis-server /etc/redis/redis3.conf 
docker run -d --name=redis4 --hostname=redis4 $CONF_OPTIONS $REDIS_IMAGE redis-server /etc/redis/redis4.conf 
docker run -d --name=redis5 --hostname=redis5 $CONF_OPTIONS $REDIS_IMAGE redis-server /etc/redis/redis5.conf