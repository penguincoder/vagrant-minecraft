#!/bin/bash

SLEEP=${1}

overviewer.py --config=/config.py

while [ ! -z ${SLEEP} ] ; do
  while [ true ] ; do
    sleep ${SLEEP}
    overviewer.py --config=/config.py
  done
done
