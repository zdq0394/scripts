#! /bin/bash
SHARE_DIR="/nfs/share"
mkdir ${SHARE_DIR}
yum install -y nfs-utils
echo "${SHARE_DIR}/ *(insecure,rw,sync,no_root_squash)">/etc/exports

systemctl enable rpcbind
systemctl enable nfs-server

systemctl start rpcbind
systemctl start nfs-server

exportfs