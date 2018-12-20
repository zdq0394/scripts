FROM ubuntu:latest
RUN apt-get update \
    && apt-get install -y vim wget python2.7 python-pip redis-tools dnsutils
RUN pip install redis-trib

WORKDIR /boot
COPY boot.sh /boot/boot.sh
