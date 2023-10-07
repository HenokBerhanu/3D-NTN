#sudo docker build -t pcf:v3.1.1 -f Dockerfile .
FROM f5gc:base AS pcf-builder
FROM ubuntu:focal

LABEL description="Free5GC open source 5G Core Network" \
    version="Stage 3"

# RUN apt-get update \
#     && apt-get install -qy vim strace net-tools curl netcat-openbsd

# Set working dir
WORKDIR /free5gc
#RUN mkdir -p config/ log/ config/TLS/

# copy from builder
# COPY --from=pcf-builder /go/src/free5gc/bin/pcf ./
# COPY --from=pcf-builder /go/src/free5gc/config/TLS/pcf.pem ./config/TLS/
# COPY --from=pcf-builder /go/src/free5gc/config/TLS/pcf.key ./config/TLS/

COPY --from=pcf-builder /go/src/free5gc/bin/pcf /usr/local/bin/pcf

ENTRYPOINT ["pcf"]

CMD ["-h"]


# # Config files volume
# VOLUME [ "/free5gc/config" ]

# # Certificates (if not using default) volume
# VOLUME [ "/free5gc/config/TLS" ]

# # Exposed ports
# EXPOSE 8000

