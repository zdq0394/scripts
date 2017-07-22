#! /bin/bash
iperf -c 192.168.100.14 -b 10000M  -l 8k -t 20 -P 10