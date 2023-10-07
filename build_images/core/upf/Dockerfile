#sudo docker build -t upf:v3.1.1 -f Dockerfile .
FROM f5gc:base AS upf-builder

LABEL description="Free5GC open source 5G Core Network" \
    version="Stage 3"

# RUN git clone https://github.com/free5gc/go-gtp5gnl.git && mkdir "go-gtp5gnl/bin" && \
#     cd "go-gtp5gnl/cmd/gogtp5g-tunnel" &&  go build -o "${GOPATH}/gtp5g-tunnel" . && \
#     cd -

FROM ubuntu:focal

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y vim strace net-tools iputils-ping curl netcat libmnl0 libyaml-0-2 iproute2 iptables tcpdump iperf3 \
    && apt-get clean

# Set working dir
WORKDIR /free5gc
#RUN mkdir -p config/ log/
#RUN touch app.sh
#RUN mkdir -p results/

# Copy executable
COPY --from=upf-builder /go/src/free5gc/NFs/upf/build/bin/free5gc-upfd /usr/local/bin/free5gc-upfd
COPY --from=upf-builder /go/src/free5gc/NFs/upf/build/updk/src/third_party/libgtp5gnl/lib/libgtp5gnl.so.0 /usr/local/lib/libgtp5gnl.so.0
COPY --from=upf-builder /go/src/free5gc/NFs/upf/build/utlt_logger/liblogger.so /usr/local/lib/liblogger.so
#COPY --from=upf-builder /go/src/free5gc/NFs/upf ./NFs/upf
#COPY --from=upf-builder /go/src/free5gc/webconsole ./
# COPY --from=upf-builder /go/src/free5gc/config/* ./config/
# COPY --from=upf-builder /go/gtp5g-tunnel ./gtp5g-tunnel

# Update links
RUN ldconfig

#VOLUME [ "/free5gc/config" ]