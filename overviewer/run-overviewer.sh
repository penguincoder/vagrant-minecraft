#!/bin/bash

SLEEP=${1}

function update_map() {
  nice -n 19 overviewer/overviewer.py --config=config.py
}

update_map

while [ ! -z ${SLEEP} ] ; do
  while [ true ] ; do
    sleep ${SLEEP}
    update_map
  done
done
