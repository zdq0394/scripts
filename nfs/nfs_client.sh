#! /bin/bash
SHARE_DIR="/nfs/share"
NFS_SERVER=""
mkdir ${SHARE_DIR}
yum install -y nfs-utils

showmount -e ${NFS_SERVER}

mkdir /tmp/nfsmount
mount -t nfs ${NFS_SERVER}:${SHARE_DIR} /tmp/nfsmount