#!/bin/bash

apt-get update

apt -y install git gcc cmake autoconf libtool pkg-config libmnl-dev libyaml-dev

apt-get install -qq \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

cd /tmp &&
    rm -rf gtp5g
    git clone https://github.com/free5gc/gtp5g &&
    cd gtp5g &&
    make clean &&
    make &&
    make install