#!/bin/bash

# Build gNBSat
cd /home/vagrant/3D-NTN/build_images/ran/gnb
docker build -t gnb:masterb -f DockerfileSat .

# Build gNBTer
cd /home/vagrant/3D-NTN/build_images/ran/gnb
docker build -t gnb:master -f DockerfileTer .

# Build UE
cd /home/vagrant/3D-NTN/build_images/ran/ue
docker build -t ue:masterb -f Dockerfile .