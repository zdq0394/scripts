#! /bin/sh

mkdir -p /data/mongo_data

docker run --name mongo0 \
 -v /data/mongo_data:/data/db \
 -d mongo:3.2.16