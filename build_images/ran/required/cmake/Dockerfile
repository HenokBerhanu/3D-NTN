#sudo docker build -t cmake:v3.2 -f Dockerfile .
#FROM debian:buster-slim
FROM ubuntu:focal
RUN apt-get update && DEBIAN_FRONTEND=non-interactive apt-get install -qy --no-install-recommends --no-install-suggests \
    make g++ git ca-certificates libssl-dev \
    && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/Kitware/CMake && git -C CMake checkout v3.20.0
WORKDIR CMake
RUN ./bootstrap && make && make install