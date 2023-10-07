#sudo docker build -t nssf:v3.1.1 -f Dockerfile .
FROM f5gc:base AS nssf-builder
FROM ubuntu:focal

LABEL description="Free5GC open source 5G Core Network" \
    version="Stage 3"

# RUN apt-get update \
#     && apt-get install -qy vim strace net-tools curl netcat-openbsd

# Set working dir
WORKDIR /free5gc
#RUN mkdir -p config/ log/ config/TLS/

# copy from builder
# COPY --from=nssf-builder /go/src/free5gc/bin/nssf ./
# COPY --from=nssf-builder /go/src/free5gc/config/TLS/nssf.pem ./config/TLS/
# COPY --from=nssf-builder /go/src/free5gc/config/TLS/nssf.key ./config/TLS/

COPY --from=nssf-builder /go/src/free5gc/bin/nssf /usr/local/bin/nssf

ENTRYPOINT ["nssf"]

CMD ["-h"]

# # Config files volume
# VOLUME [ "/free5gc/config" ]

# # Certificates (if not using default) volume
# VOLUME [ "/free5gc/config/TLS" ]

# # Exposed ports
# EXPOSE 8000
