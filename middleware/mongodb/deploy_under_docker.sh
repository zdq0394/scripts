#! /bin/sh

mkdir -p mongo_data

docker run --name mongo0 \
 -v mongo_data:/data/db \
 -p 27017:27017 \
 -d mongo:3.2.16
