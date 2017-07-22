#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

install-docker-ubuntu() {
    apt-get update
    apt-get install -y docker.io
    systemctl enable docker
    systemctl start docker
}

install-docker-centos() {
    yum install -y docker
    systemctl enable docker
    systemctl start docker
}

install-docker-linux() {
    curl -fsSL get.docker.com -o get-docker.sh
    sh get-docker.sh
}