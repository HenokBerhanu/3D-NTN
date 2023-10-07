#sudo docker build -t ue:master -f Dockerfile .
#sudo docker build -t ue:masterb -f Dockerfile .    when opensand is included the entrypoint and cmd must be commented
FROM ueransim:base as ue-builder
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

#RUN apt-get update && apt-get install -y build-essential git

# WORKDIR /iperf
# RUN git clone https://git.code.sf.net/p/iperf2/code iperf2-source
# WORKDIR /iperf/iperf2-source
# RUN ./configure
# RUN make
# RUN make install

WORKDIR /ue
#RUN touch app.sh
#RUN mkdir -p results/
# RUN apt-get update && DEBIAN_FRONTEND=non-interactive apt-get install -qy --no-install-recommends --no-install-suggests \
#     lksctp-tools iproute2 tcpdump iputils-ping \
#     && rm -rf /var/lib/apt/lists/*

#RUN mkdir -p config/ binder/ results/

COPY --from=ue-builder /compile/UERANSIM/build/nr-ue /usr/local/bin/nr-ue

# COPY --from=ue-builder /compile/UERANSIM/build/nr-ue .
# COPY --from=ue-builder /compile/UERANSIM/build/nr-cli .
# COPY --from=ue-builder /compile/UERANSIM/build/nr-binder binder/
# COPY --from=ue-builder /compile/UERANSIM/build/libdevbnd.so binder/
# COPY --from=ue-builder /compile/UERANSIM/config/* ./config/

# VOLUME [ "/ue/config" ]

#ENTRYPOINT ["nr-ue"]  # commented for opensand

#CMD ["--help"] # commented for opensand