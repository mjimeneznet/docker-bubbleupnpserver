from debian:9-slim 
MAINTAINER Manuel Jimenez mjimenez@mjimenez.net

#install unzip and wget
RUN apt-get update && apt-get install -y unzip wget openjdk-8-jdk-headless

#download bubbleupnpserver, ffmpeg and clean up
RUN mkdir -p /opt/bubbleupnpserver && \
  cd /opt/bubbleupnpserver && \
  wget -q http://www.bubblesoftapps.com/bubbleupnpserver/core/ffmpeg_linux.zip -O ffmpeg.zip && \
  wget -q http://www.bubblesoftapps.com/bubbleupnpserver/BubbleUPnPServer-distrib.zip -O bubbleupnpserver.zip && \
  unzip bubbleupnpserver.zip && \
  unzip ffmpeg.zip && \
  rm -rf bubbleupnpserver.zip ffmpeg.zip && \
  chmod +x launch.sh

#the http and https and ssdp ports for bubbleupnpserver
EXPOSE 58050/tcp 58051/tcp 1900/udp

#launch
ENTRYPOINT ["/opt/bubbleupnpserver/launch.sh"]
