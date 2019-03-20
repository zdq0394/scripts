#! /bin/sh
IMG=memcached:1.5.12

docker run --name memcached-0 -p 11211:11211 -d $IMG