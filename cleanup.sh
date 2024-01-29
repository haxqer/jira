#!/usr/bin/env bash

shDir=$(cd $(dirname $0) && pwd)
ENVFILE=${shDir}/docker/.env
if [ ! -f "$ENVFILE" ]; then
  echo "File docker/.env NOT exists."
  exit
fi

if ! [ -x "$(command -v docker)" ]; then
  echo 'Error: docker is not installed.' >&2
  exit 1
fi

docker compose -f "docker/docker-compose.yml" down

docker images --quiet --filter=dangling=true | xargs --no-run-if-empty docker rmi

docker images -a | grep xsharp/jira | awk '{print $3}' | xargs docker rmi -f
