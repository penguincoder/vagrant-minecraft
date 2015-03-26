#!/bin/bash
VERSION=${1-1.8}
wget -q https://s3.amazonaws.com/Minecraft.Download/versions/${VERSION}/${VERSION}.jar -P /home/notch/mc-overviewer/
