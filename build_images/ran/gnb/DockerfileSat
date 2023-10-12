#sudo docker build -t gnb:master -f Dockerfile .
#sudo docker build -t gnb:masterb -f Dockerfile .  for sat support entrypoint and cmd are commented
FROM ueransim:base as gnb-builder
FROM ubuntu:focal

#ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && DEBIAN_FRONTEND=non-interactive \
    apt-get install -y --no-install-recommends \
        git \
        build-essential \
        libsctp-dev \
        lksctp-tools \
        iproute2 \
        iptables \
        netbase \
        ifupdown \
        net-tools \
        iputils-ping \
        curl \
        tcpdump \
        iperf3 && \
    apt-get autoremove -y && apt-get autoclean

WORKDIR /gnb
# RUN apt-get update && DEBIAN_FRONTEND=non-interactive apt-get install -qy --no-install-recommends --no-install-suggests \
#     lksctp-tools iproute2 tcpdump iputils-ping iptables \
#     && rm -rf /var/lib/apt/lists/*

#RUN mkdir -p config/ binder/

COPY --from=gnb-builder /compile/UERANSIM/build/nr-gnb /usr/local/bin/nr-gnb

# ENTRYPOINT ["nr-gnb"]

# CMD ["--help"]

# COPY --from=gnb-builder /compile/UERANSIM/build/nr-gnb .
# COPY --from=gnb-builder /compile/UERANSIM/build/nr-cli .
# COPY --from=gnb-builder /compile/UERANSIM/build/nr-binder binder/
# COPY --from=gnb-builder /compile/UERANSIM/build/libdevbnd.so binder/
# COPY --from=gnb-builder /compile/UERANSIM/config/* ./config/

# VOLUME [ "/gnb/config" ]