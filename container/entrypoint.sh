#!/bin/sh

set -ex

WORKDIR="/opt/etherpad-lite"

cd $WORKDIR/src

npm install @mapbox/node-pre-gyp

npm install sqlite3

cd $WORKDIR

./bin/run.sh

