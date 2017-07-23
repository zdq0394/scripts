#! /bin/sh
os=`uname -s`
if test $os = "Darwin" ; then
    echo "Darwin"
    sysctl -w net.inet.ip.forwarding=1
fi

if test $os = "Linux" ; then
    echo "Linux"
    echo "1" > /proc/sys/net/ipv4/ip_forward
fi

docker run -d --name node-exporter -p 9100:9100 \
  -v "/proc:/host/proc:ro" \
  -v "/sys:/host/sys:ro" \
  -v "/:/rootfs:ro" \
  --net="host" \
  quay.io/prometheus/node-exporter:v0.14.0 \
    -collector.procfs /host/proc \
    -collector.sysfs /host/sys \
    -collector.filesystem.ignored-mount-points "^/(sys|proc|dev|host|etc)($|/)"