FROM ubuntu:trusty
MAINTAINER Andrew Coleman <penguincoder@gmail.com>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apt-transport-https apt-utils git build-essential python-imaging python-dev python-numpy rsync wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    useradd --create-home --uid 1000 --gid 100 notch

USER notch
ENV MINECRAFT_VERSION 1.11
RUN mkdir -p /home/notch/.minecraft/versions/${MINECRAFT_VERSION} && \
    wget -q -P /home/notch/.minecraft/versions/${MINECRAFT_VERSION} https://s3.amazonaws.com/Minecraft.Download/versions/${MINECRAFT_VERSION}/${MINECRAFT_VERSION}.jar && \
    git clone git://github.com/overviewer/Minecraft-Overviewer.git /home/notch/overviewer && \
    cd /home/notch/overviewer && \
    git checkout leaflet && \
    python2 setup.py build
VOLUME /map
VOLUME /data
WORKDIR /home/notch
ADD config.py /home/notch/
ADD run-overviewer.sh /home/notch
CMD /home/notch/run-overviewer.sh 1h
