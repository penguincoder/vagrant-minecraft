#!/bin/bash

MC_HOME=${MC_HOME:-/home/alpine}

docker pull itzg/minecraft-server
docker pull zzrot/alpine-caddy
make -C $(dirname $0)/minecraft-server
make -C $(dirname $0)/overviewer
make -C $(dirname $0)/caddy
