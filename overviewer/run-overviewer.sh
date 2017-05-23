#!/bin/bash

SLEEP=${1}

function update_map() {
  overviewer.py --config=/config.py --check-tiles
  sed -i "s/sensor=false/key=${GOOGLE_MAPS_API_KEY}\&sensor=false/" /map/index.html
}

update_map

while [ ! -z ${SLEEP} ] ; do
  while [ true ] ; do
    sleep ${SLEEP}
    update_map
  done
done
