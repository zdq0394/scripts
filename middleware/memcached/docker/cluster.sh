#! /bin/sh
IMG=memcached:1.5.12

docker run --name memcached-0 -p 21210:11211 -d $IMG

docker run --name memcached-1 -p 21211:11211 -d $IMG

docker run --name memcached-2 -p 21212:11211 -d $IMG