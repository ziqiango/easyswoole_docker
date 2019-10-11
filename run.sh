#!/bin/bash
FILE="/easyswoole/easyswoole"

if [ ! -f "$FILE" ]; then
  /easyswoole/docker/create_easyswoole.sh
fi
if [ -f "$FILE" ]; then
  cd /easyswoole
  php easyswoole start
fi
