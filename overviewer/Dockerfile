FROM ubuntu:trusty
MAINTAINER Andrew Coleman <penguincoder@gmail.com>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apt-transport-https apt-utils cron gettext-base lsb-release wget && \
    echo "deb https://overviewer.org/debian ./" > /etc/apt/sources.list.d/overviewer.list && \
    wget -q -O - https://overviewer.org/debian/overviewer.gpg.asc | apt-key add - && \
    apt-get update && \
    apt-get install -y minecraft-overviewer && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    useradd --create-home --uid 1000 --gid 100 notch

USER notch
ENV MINECRAFT_VERSION 1.11
RUN mkdir -p /home/notch/.minecraft/versions/${MINECRAFT_VERSION} && \
    wget -q -P /home/notch/.minecraft/versions/${MINECRAFT_VERSION} https://s3.amazonaws.com/Minecraft.Download/versions/${MINECRAFT_VERSION}/${MINECRAFT_VERSION}.jar
VOLUME /map
VOLUME /data
ADD config.py /
ADD run-overviewer.sh /
CMD /run-overviewer.sh 15m
