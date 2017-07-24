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

pwd_dir=`pwd`
config_file="${pwd_dir}/alertmanager.yml"

docker run -d --name alertmanager -p 9093:9093 \
 -v $pwd_dir:/alertmanager-conf \
 prom/alertmanager:v0.8.0 \
 -config.file=/alertmanager-conf/alertmanager.yml 
