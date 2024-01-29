#!/usr/bin/env bash

shDir=$(cd $(dirname $0) && pwd)
ENVFILE=${shDir}/docker/.env
if [ ! -f "$ENVFILE" ]; then
  cp ${shDir}/docker/.env.dist ${ENVFILE}
fi

if ! [ -x "$(command -v docker)" ]; then
  echo 'Error: docker is not installed.' >&2
  exit 1
fi

docker compose -f "docker/docker-compose.yml" up -d --build
