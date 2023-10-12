#!/bin/bash

# Build nrf
cd /home/vagrant/3D-NTN/build_images/core/nrf
docker build -t nrf:v3.1.1 -f Dockerfile .

# Build amf
cd /home/vagrant/3D-NTN/build_images/core/amf
docker build -t amf:v3.1.1 -f Dockerfile .

# Build smf
cd /home/vagrant/3D-NTN/build_images/core/smf
docker build -t smf:v3.1.1 -f Dockerfile .

# Build upf
cd /home/vagrant/3D-NTN/build_images/core/upf
docker build -t upf:v3.1.1 -f Dockerfile .

# Build ausf
cd /home/vagrant/3D-NTN/build_images/core/ausf
docker build -t ausf:v3.1.1 -f Dockerfile .

# Build nssf
cd /home/vagrant/3D-NTN/build_images/core/nssf
docker build -t nssf:v3.1.1 -f Dockerfile .

# Build udm
cd /home/vagrant/3D-NTN/build_images/core/udm
docker build -t udm:v3.1.1 -f Dockerfile .

# Build udr
cd /home/vagrant/3D-NTN/build_images/core/udr
docker build -t udr:v3.1.1 -f Dockerfile .

# Build pcf
cd /home/vagrant/3D-NTN/build_images/core/pcf
docker build -t pcf:v3.1.1 -f Dockerfile .

# Build n3wf
cd /home/vagrant/3D-NTN/build_images/core/pcf
docker build -t n3wf:v3.1.1 -f Dockerfile .

# Build webui
cd /home/vagrant/3D-NTN/build_images/core/pcf
docker build -t webui:v3.1.1 -f Dockerfile .

# # Build Image 11
# cd /home/vagrant/3D-NTN/build_images/dockerfiles/main/populate
# docker build -t nrntn:populate -f Dockerfile .

# # Build Image 14
# cd /home/vagrant/3D-NTN/build_images/dockerfiles/main/gnb
# docker build -t nrntn:gnb -f Dockerfile .

# # Build Image 15
# cd /home/vagrant/3D-NTN/build_images/dockerfiles/main/ue
# docker build -t nrntn:ue -f Dockerfile .