#sudo docker build -t ausf:v3.1.1 -f Dockerfile .
FROM f5gc:base AS ausf-builder
FROM ubuntu:focal

LABEL description="Free5GC open source 5G Core Network" \
    version="Stage 3"

# RUN apt-get update \
#     && apt-get install -qy vim strace net-tools curl netcat-openbsd

# Set working dir
WORKDIR /free5gc
#RUN mkdir -p config/ log/ config/TLS/

# Copy executable and default certs
# COPY --from=ausf-builder /go/src/free5gc/bin/ausf ./
# COPY --from=ausf-builder /go/src/free5gc/config/TLS/ausf.pem ./config/TLS/
# COPY --from=ausf-builder /go/src/free5gc/config/TLS/ausf.pem ./config/TLS/
COPY --from=ausf-builder /go/src/free5gc/bin/ausf /usr/local/bin/ausf

ENTRYPOINT ["ausf"]

CMD ["-h"]
# # Config files volume
# VOLUME [ "/free5gc/config" ]

# # Certificates (if not using default) volume
# VOLUME [ "/free5gc/config/TLS" ]

# # Exposed ports
# EXPOSE 8000