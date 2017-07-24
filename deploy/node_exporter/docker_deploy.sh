#! /bin/sh
os=`uname -s`

if test $os != "Linux" ; then
    echo "Not linux system, can not run node-exporter."
    exit 0
fi

docker run -d --name node-exporter -p 9100:9100 \
  -v "/proc:/host/proc:ro" \
  -v "/sys:/host/sys:ro" \
  -v "/:/rootfs:ro" \
  --net="host" \
  prom/node-exporter:v0.14.0 \
    -collector.procfs /host/proc \
    -collector.sysfs /host/sys \
    -collector.filesystem.ignored-mount-points "^/(sys|proc|dev|host|etc)($|/)"