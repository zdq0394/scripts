#! /bin/sh
EtcdIP_0="192.168.12.50"
EtcdIP_1="192.168.12.51"
EtcdIP_2="192.168.12.52"

EtcdName=etcd0
HostIP=$EtcdIP_0

#EtcdName=etcd1
#HostIP=$EtcdIP_1

#EtcdName=etcd2
#HostIP=$EtcdIP_2

# Run the docker
docker run -d -v /usr/share/ca-certificates/:/etc/ssl/certs -p 4001:4001 -p 2380:2380 -p 2379:2379 \
 --name etcd quay.io/coreos/etcd:v2.3.8 \
 -name $EtcdName \
 -advertise-client-urls http://$HostIP:2379,http://$HostIP:4001 \
 -listen-client-urls http://0.0.0.0:2379,http://0.0.0.0:4001 \
 -initial-advertise-peer-urls http://$HostIP:2380 \
 -listen-peer-urls http://0.0.0.0:2380 \
 -initial-cluster-token etcd-cluster-1 \
 -initial-cluster etcd0=http://$EtcdIP_0:2380,etcd1=http://$EtcdIP_1:2380,etcd2=http://$EtcdIP_2:2380 \
 -initial-cluster-state new
