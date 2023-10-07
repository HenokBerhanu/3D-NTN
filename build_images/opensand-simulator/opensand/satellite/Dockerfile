# sudo docker build -t opensand:satellite -f Dockerfile .
FROM pavja2/qpep:satellite 
RUN rm /etc/apt/sources.list.d/opensand.list

#RUN apt-get install -y  apt-transport-https ca-certificates
#RUN echo "deb [trusted=yes] http://raw.githubusercontent.com/CNES/net4sat-packages/master/ focal stable" |  tee /etc/apt/sources.list.d/opensand.list
#RUN apt-get install -y curl
#RUN curl -sS https://raw.githubusercontent.com/CNES/net4sat-packages/master/gpg/net4sat.gpg.key | apt-key add
#RUN apt-get update

#RUN apt-cache madison opensand
#RUN apt-get install -y opensand
#RUN apt-get install -y opensand-manager
#RUN apt-get install -y opensand-collector
#RUN DEBIAN_FRONTEND=noninteractive apt-get -y install wireshark
#EXPOSE 3141
#EXPOSE 5358
#EXPOSE 5926
#RUN mkdir /root/.opensand
RUN apt-get update
RUN apt-get install -y xvfb
COPY config/sat.conf /etc/opensand/daemon.conf
COPY config/topology.conf /usr/share/opensand/topology.conf
#COPY config/core_global.conf /usr/share/opensand/core_global.conf
COPY config/entrypoint.sh /root/entrypoint.sh
#RUN chmod +x /tmp/entrypoint.sh
#ENTRYPOINT /bin/bash /tmp/entrypoint.sh