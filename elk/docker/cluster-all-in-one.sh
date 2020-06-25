#! /bin/bash
mkdir /elastic/data/es01
mkdir /elastic/data/es02
mkdir /elastic/data/es03

chmod -R 777 /elastic/data

docker network create elastic

docker run -d --name es01 --hostname es01\
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

docker run -d --name es02 --hostname es02\
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
  --net "elastic" \
  -e "node.name=es03" \
  -e "cluster.name=es-docker-cluster" \
  -e "discovery.seed_hosts=es01,es02" \
  -e "cluster.initial_master_nodes=es01,es02,es03" \
  -e "bootstrap.memory_lock=false" \
  -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
  -v /elastic/data/es03:/usr/share/elasticsearch/data:rw \
  -it elastic/elasticsearch:7.8.0
  