#! /bin/sh
REDIS_IMAGE=registry.docker-cn.com/library/redis:5.0.1
docker run -d --name=master --hostname=master -v /redis-conf:/etc/redis $REDIS_IMAGE redis-server /etc/redis/redis-master.conf 
docker run -d --name=slave1 --hostname=slave1 -v /redis-conf:/etc/redis $REDIS_IMAGE redis-server /etc/redis/redis-slave1.conf 
docker run -d --name=slave2 --hostname=slave2 -v /redis-conf:/etc/redis $REDIS_IMAGE redis-server /etc/redis/redis-slave2.conf 