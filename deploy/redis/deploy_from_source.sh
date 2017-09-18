#! /bin/sh
# deploy redis from source
# prepare redis installation packages
REDIS=redis
VERSION=4.0.1

wget http://download.redis.io/releases/${REDIS}-${VERSION}.tar.gz
tar xzf ${REDIS}-${VERSION}.tar.gz
cd ${REDIS}-${VERSION}
make