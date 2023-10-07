#sudo docker build -t uereg:latest -f Dockerfile .
FROM golang:1.17.13-buster AS builder
#FROM golang:1.14 AS builder

WORKDIR /build
RUN git clone --recursive -b main -j $(nproc) https://github.com/HenokBerhanu/free5gc-populate.git
WORKDIR /build/free5gc-populate
RUN go build -o populate -x main.go

#FROM debian:buster-slim
FROM ubuntu:focal
WORKDIR /populate
RUN apt-get update && DEBIAN_FRONTEND=non-interactive apt-get install -qy --no-install-recommends --no-install-suggests \
    iproute2 iptables procps tcpdump iputils-ping \
    && rm -rf /var/lib/apt/lists/*
COPY --from=builder /build/free5gc-populate/populate /usr/local/sbin/

ENTRYPOINT ["populate"]
CMD ["--help"]