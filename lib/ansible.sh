#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

install-ansible-centos() {
    yum install -y ansible
}