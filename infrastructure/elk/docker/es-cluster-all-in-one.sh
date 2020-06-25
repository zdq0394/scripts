#! /bin/bash
mkdir -p /elastic/data/es01
mkdir -p /elastic/data/es02
mkdir -p /elastic/data/es03

chmod -R g+rwx /elastic/data
chgrp -R 0 /elastic/data

sysctl -w vm.max_map_count=262144

docker network create elastic

docker run -d --name es01 --hostname es01 \
  --ulimit nofile=65535:65535 \
  --net "elastic" \
  -p 9200:9200 \
  -e "node.name=es01" \
  -e "cluster.name=es-docker-cluster" \
  -e "discovery.seed_hosts=es02,es03" \
  -e "cluster.initial_master_nodes=es01,es02,es03" \
  -e "bootstrap.memory_lock=false" \
  -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
  -v /elastic/data/es01:/usr/share/elasticsearch/data:rw \
  -it elastic/elasticsearch:7.8.0

docker run -d --name es02 --hostname es02 \
  --ulimit nofile=65535:65535 \
  --net "elastic" \
  -e "node.name=es02" \
  -e "cluster.name=es-docker-cluster" \
  -e "discovery.seed_hosts=es01,es03" \
  -e "cluster.initial_master_nodes=es01,es02,es03" \
  -e "bootstrap.memory_lock=false" \
  -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
  -v /elastic/data/es02:/usr/share/elasticsearch/data:rw \
  -it elastic/elasticsearch:7.8.0

docker run -d --name es03 --hostname es03\
  --ulimit nofile=65535:65535 \
  --net "elastic" \
  -e "node.name=es03" \
  -e "cluster.name=es-docker-cluster" \
  -e "discovery.seed_hosts=es01,es02" \
  -e "cluster.initial_master_nodes=es01,es02,es03" \
  -e "bootstrap.memory_lock=false" \
  -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
  -v /elastic/data/es03:/usr/share/elasticsearch/data:rw \
  -it elastic/elasticsearch:7.8.0
  