#!/bin/bash
# Config etcd nodes
CLUSTER_IP_1=""
CLUSTER_IP_2=""
CLUSTER_IP_3=""
HOST_IP=$CLUSTER_IP_1

yum install -y etcd

tee /etc/etcd/etcd.conf <<-'EOF'
ETCD_NAME=etcd03
ETCD_DATA_DIR="/var/lib/etcd/etcd03"
ETCD_LISTEN_PEER_URLS="http://$HOST_IP:2380"
ETCD_LISTEN_CLIENT_URLS="http://$HOST_IP:2379,http://127.0.0.1:2379"
ETCD_INITIAL_ADVERTISE_PEER_URLS="http://$HOST_IP:2380"
ETCD_ADVERTISE_CLIENT_URLS="http://$HOST_IP:2379"
ETCD_INITIAL_CLUSTER_STATE="new"
ETCD_INITIAL_CLUSTER_TOKEN="etcd-cluster1"
ETCD_INITIAL_CLUSTER="etcd01=http://$CLUSTER_IP_1:2380,etcd02=http://$CLUSTER_IP_2:2380,etcd03=http://$CLUSTER_IP_3:2380"
EOF

tee  /usr/lib/systemd/system/etcd.service <<-'EOF'
[Unit]
Description=Etcd Server
After=network.target
After=network-online.target
Wants=network-online.target

[Service]
Type=notify
WorkingDirectory=/var/lib/etcd/
EnvironmentFile=-/etc/etcd/etcd.conf
User=etcd
# set GOMAXPROCS to number of processors
ExecStart=/bin/bash -c "GOMAXPROCS=$(nproc) /usr/bin/etcd --name=\"${ETCD_NAME}\" --data-dir=\"${ETCD_DATA_DIR}\" --listen-client-urls=\"${ETCD_LISTEN_CLIENT_URLS}\" --listen-peer-urls=\"${ETCD_LISTEN_PEER_URLS}\" --advertise-client-urls=\"${ETCD_ADVERTISE_CLIENT_URLS}\" --initial-cluster-token=\"${ETCD_INITIAL_CLUSTER_TOKEN}\" --initial-cluster=\"${ETCD_INITIAL_CLUSTER}\" --initial-cluster-state=\"${ETCD_INITIAL_CLUSTER_STATE}\" "
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF