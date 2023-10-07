#
# Dockerfile responsible to create only the base image without compiling free5gc sources
#
# sudo docker build -t f5gc:base -f Dockerfile .

FROM golang:1.17.13-buster AS builder

LABEL maintainer="henok"

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update \
    && apt-get -y install gcc cmake autoconf libtool pkg-config libmnl-dev libyaml-dev apt-transport-https ca-certificates \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y nodejs yarn

# Clean apt cache
#RUN apt-get clean

RUN git -C /go/src clone --recursive -b v3.1.1 -j $(nproc) https://github.com/free5gc/free5gc.git
WORKDIR /go/src/free5gc
RUN make all

# #FROM ubuntu:focal
# WORKDIR /free5gc
# RUN mkdir -p config/TLS/ public

# # Copy executables
# COPY --from=builder /go/src/free5gc/bin/* ./
# COPY --from=builder /go/src/free5gc/NFs/upf/build/bin/* ./
# COPY --from=builder /go/src/free5gc/webconsole/bin/webconsole ./webui

# # Copy static files (webui frontend)
# COPY --from=builder /go/src/free5gc/webconsole/public ./public

# # Copy linked libs
# COPY --from=builder /go/src/free5gc/NFs/upf/build/updk/src/third_party/libgtp5gnl/lib/libgtp5gnl.so.0 ./
# COPY --from=builder /go/src/free5gc/NFs/upf/build/utlt_logger/liblogger.so ./

# # Copy configuration files (not used for now)
# COPY --from=builder /go/src/free5gc/config/* ./config/
# COPY --from=builder /go/src/free5gc/NFs/upf/build/config/* ./config/

# # Copy default certificates (not used for now)
# COPY --from=builder /go/src/free5gc/config/TLS/* ./config/TLS/