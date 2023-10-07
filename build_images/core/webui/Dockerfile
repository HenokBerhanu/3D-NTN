#sudo docker build -t webui:v3.1.1 -f Dockerfile .
FROM f5gc:base AS webui-builder
FROM ubuntu:focal

LABEL description="Free5GC open source 5G Core Network" \
    version="Stage 3"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y vim strace net-tools curl netcat-openbsd

# Set working dir
WORKDIR /free5gc
RUN mkdir -p config/ public/

# copy from builder
COPY --from=webui-builder /go/src/free5gc/webconsole/bin/webconsole ./
COPY --from=webui-builder /go/src/free5gc/webconsole/public ./public

# Config files volume
VOLUME [ "/free5gc/config" ]

# Exposed ports
EXPOSE 5000