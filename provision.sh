#!/bin/bash

MC_HOME=/home/alpine

docker run \
  --restart always \
  --detach \
  --name minecraft \
  --publish 25565:25565 \
  --env EULA=true \
  --env DIFFICULTY=normal \
  --env ALLOW_NETHER=true \
  --env ANNOUNCE_PLAYER_ACHIEVEMENTS=true \
  --env GENERATE_STRUCTURES=true \
  --env MEMORY=2G \
  --volume ${MC_HOME}/minecraft:/data \
  itzg/minecraft-server

cd $(dirname $0)/overviewer && \
  docker build -t overviewer . && \
  docker run \
    --detach \
    --restart always \
    --name overviewer \
    --volume ${MC_HOME}/minecraft:/data \
    --volume ${MC_HOME}/overviewer:/map \
    overviewer

docker pull zzrot/alpine-caddy
docker run \
  --detach \
  --restart always \
  --name caddy \
  --publish 8088:80 \
  --volume ${MC_HOME}/overviewer:/var/www/html \
  zzrot/alpine-caddy
