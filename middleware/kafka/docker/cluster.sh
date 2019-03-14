#! /bin/sh
KAFKA_IMG="zdq0394/kafka:2.11-0.11.0.3"
ZK_SERVERS="172.17.0.2:2181,172.17.0.3:2181,172.17.0.4:2181"

# kafka-0
ID="0"
KAFKA_NAME="kafka-$ID"
LOGS_DIR="/tmp/kafka$ID"
mkdir -p $LOGS_DIR
docker run -d --name=$KAFKA_NAME --hostname=$KAFKA_NAME -v $LOGS_DIR:/var/log/kafka \
  --env "KAFKA_BROKER_ID"="$ID" \
  --env "KAFKA_ZOOKEEPER_CONNECT"="$ZK_SERVERS" \
  --env "KAFKA_LISTENERS"="PLAINTEXT://:9092" \
  --env "KAFKA_LOG_DIRS"="/var/log/kafka" \
  --env "KAFKA_HEAP_OPTS"="-Xmx6g -Xms1g" \
  --env "KAFKA_NUM_IO_THREADS"="2" \
  $KAFKA_IMG

# kafka-1
ID="1"
KAFKA_NAME="kafka-$ID"
LOGS_DIR="/tmp/kafka$ID"
mkdir -p $LOGS_DIR
docker run -d --name=$KAFKA_NAME --hostname=$KAFKA_NAME -v $LOGS_DIR:/var/log/kafka \
  --env "KAFKA_BROKER_ID"="$ID" \
  --env "KAFKA_ZOOKEEPER_CONNECT"="$ZK_SERVERS" \
  --env "KAFKA_LISTENERS"="PLAINTEXT://:9092" \
  --env "KAFKA_LOG_DIRS"="/var/log/kafka" \
  --env "KAFKA_HEAP_OPTS"="-Xmx6g -Xms1g" \
  --env "KAFKA_NUM_IO_THREADS"="2" \
  $KAFKA_IMG

# kafka-2
ID="2"
KAFKA_NAME="kafka-$ID"
LOGS_DIR="/tmp/kafka$ID"
mkdir -p $LOGS_DIR
docker run -d --name=$KAFKA_NAME --hostname=$KAFKA_NAME -v $LOGS_DIR:/var/log/kafka \
  --env "KAFKA_BROKER_ID"="$ID" \
  --env "KAFKA_ZOOKEEPER_CONNECT"="$ZK_SERVERS" \
  --env "KAFKA_LISTENERS"="PLAINTEXT://:9092" \
  --env "KAFKA_LOG_DIRS"="/var/log/kafka" \
  --env "KAFKA_HEAP_OPTS"="-Xmx6g -Xms1g" \
  --env "KAFKA_NUM_IO_THREADS"="2" \
  $KAFKA_IMG