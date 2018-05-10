#! /bin/bash
# You would have to ensure your image can talk over to the monitors. 
# If it needs access to your host's network stack you might need to add --net=host to the above command. 
# It makes the port mapping redundant so the -p flag can be removed.

docker run -d --name ceph-exporter -p 9128:9128 \
  -v "/etc/ceph:/etc/ceph" \
  -it digitalocean/ceph_exporter:1.1.0