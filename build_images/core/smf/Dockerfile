#sudo docker build -t smf:v3.1.1 -f Dockerfile .
#sudo docker build -t smf:v3.1.1b -f Dockerfile . for sat support entrypoint and cmd are commented
FROM f5gc:base AS smf-builder
FROM ubuntu:focal

LABEL description="Free5GC open source 5G Core Network" \
    version="Stage 3"

RUN apt-get update \
    && apt-get install -qy vim strace net-tools curl netcat-openbsd iproute2

# Set working dir
WORKDIR /free5gc
#RUN mkdir -p config/ log/ config/TLS/

# copy from builder
# COPY --from=smf-builder /go/src/free5gc/bin/smf ./
# COPY --from=smf-builder /go/src/free5gc/config/TLS/smf.pem ./config/TLS/
# COPY --from=smf-builder /go/src/free5gc/config/TLS/smf.key ./config/TLS/

COPY --from=smf-builder /go/src/free5gc/bin/smf /usr/local/bin/smf

# ENTRYPOINT ["smf"]

# CMD ["-h"]

# # Config files volume
# VOLUME [ "/free5gc/config" ]

# # Certificates (if not using default) volume
# VOLUME [ "/free5gc/config/TLS" ]

# # Exposed ports
# EXPOSE 8000

