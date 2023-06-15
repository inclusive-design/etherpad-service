#!/bin/sh

set -ex 

if ! ls ./sqlite.db > /dev/null 2>&1; then
  echo "Decompressing sqlite.db.xz"
  xz -vd ./sqlite.db.xz
fi

# Last tested version of the etherpad image:
# https://hub.docker.com/layers/etherpad/etherpad/latest/images/sha256-7d97804b5a9751f9fabdbdbdb003fa5644690a6b845e91a1450b15246bf06a83
ETHERPAD_IMAGE="etherpad/etherpad@sha256:7d97804b5a9751f9fabdbdbdb003fa5644690a6b845e91a1450b15246bf06a83"

docker pull $ETHERPAD_IMAGE

docker run \
--platform linux/amd64 \
--expose 9001 \
-p 127.0.0.1:38097:9001/tcp \
-v ./entrypoint.sh:/opt/etherpad-lite/entrypoint.sh:rw,Z \
-v ./sqlite.db:/opt/etherpad-lite/var/sqlite.db:rw,Z \
-v ./settings.json:/opt/etherpad-lite/settings.json:rw,Z \
--name idi-etherpad \
--entrypoint "/opt/etherpad-lite/entrypoint.sh" \
$ETHERPAD_IMAGE

