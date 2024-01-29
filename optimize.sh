#!/usr/bin/env bash

shDir=$(cd $(dirname $0) && pwd)
ENVFILE=${shDir}/docker/.env

echo ${ENVFILE}

# sed 's/IMAGE_PREFIX=.*/IMAGE_PREFIX=harbor.trac.cn/g' ./docker/.env

# PROXY=http:\\/\\/192.168.0.215:1088
# sed "s/^HTTP_PROXY=.*/HTTP_PROXY=$PROXY/g; s/^HTTPS_PROXY=.*/HTTPS_PROXY=$PROXY/g" ./docker/.env
