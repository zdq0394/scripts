#! /bin/sh
# git clone source code
git clone http://github.com/dcu/mongodb_exporter.git
# make release
cd mongodb_exporter
make release
# make docker image
docker build -t mongodb_exporter .
# Start the docker image
MONGODB_URI="100.64.0.34:27017/events"
docker run -d --name mongodb_exporter \
    -p 9001:9001 \
    mongodb_exporter --mongodb.uri="${MONGODB_URI}"