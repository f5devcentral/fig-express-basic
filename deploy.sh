#!/bin/bash

DIR=$(dirname "$(readlink -f "$0")")

cd $DIR

npm install
docker build -t fig-express-basic .
docker run --rm -d -p 8443:443 --name fig-express-basic fig-express-basic:latest

if [ -n "$XDG_RUNTIME_DIR" ]
then
   echo "opening browser with xdg-open"
   sleep 2
   xdg-open "https://localhost:8443/fig-express-basic"
else
   echo "available on https://localhost:8443/fig-express-basic"
fi

docker attach fig-express-basic
