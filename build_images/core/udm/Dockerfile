#sudo docker build -t udm:v3.1.1 -f Dockerfile .
FROM f5gc:base AS udm-builder
FROM ubuntu:focal

LABEL description="Free5GC open source 5G Core Network" \
    version="Stage 3"

# RUN apt-get update \
#     && apt-get install -qy vim strace net-tools curl netcat-openbsd

# Set working dir
WORKDIR /free5gc
#RUN mkdir -p config/ log/ config/TLS/

# copy from builder
# COPY --from=udm-builder /go/src/free5gc/bin/udm ./
# COPY --from=udm-builder /go/src/free5gc/config/TLS/udm.pem ./config/TLS/
# COPY --from=udm-builder /go/src/free5gc/config/TLS/udm.key ./config/TLS/

COPY --from=udm-builder /go/src/free5gc/bin/udm /usr/local/bin/udm

ENTRYPOINT ["udm"]

CMD ["-h"]

# # Config files volume
# VOLUME [ "/free5gc/config" ]

# # Certificates (if not using default) volume
# VOLUME [ "/free5gc/config/TLS" ]

# # Exposed ports
# EXPOSE 8000