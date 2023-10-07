#sudo docker build -t n3iwf:v3.1.1 -f Dockerfile .
FROM f5gc:base AS n3iwf-builder
FROM ubuntu:focal

LABEL description="Free5GC open source 5G Core Network" \
    version="Stage 3"

RUN apt-get update \
    && apt-get install -qy vim iproute2 strace net-tools curl netcat-openbsd

# Install N3IWF dependencies
#RUN apk add -U iproute2

# Set working dir
WORKDIR /free5gc
RUN mkdir -p config/ log/ config/TLS/

# copy from builder
COPY --from=n3iwf-builder /go/src/free5gc/bin/n3iwf ./
COPY --from=n3iwf-builder /go/src/free5gc/config/TLS/n3iwf.pem ./config/TLS/
COPY --from=n3iwf-builder /go/src/free5gc/config/TLS/n3iwf.key ./config/TLS/

# Config files volume
VOLUME [ "/free5gc/config" ]

# Certificates (if not using default) volume
VOLUME [ "/free5gc/config/TLS" ]