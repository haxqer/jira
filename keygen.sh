#!/usr/bin/env bash

shDir=$(cd $(dirname $0) && pwd)
ENVFILE=${shDir}/docker/.env
if [ ! -f "$ENVFILE" ]; then
  echo "File docker/.env NOT exists."
  exit
fi

. ${ENVFILE}

if ! [ -x "$(command -v docker)" ]; then
  echo 'Error: docker is not installed.' >&2
  exit 1
fi

if [ ! "$(docker ps -q -f name=jira-mysql)" ]; then
  echo 'Docker container: jira-mysql IS NOT running'
  exit 1
fi

if [ ! "$(docker ps -q -f name=jira-app)" ]; then
  echo 'Docker container: jira-app IS NOT running'
  exit 1
fi

# check SERVERID exists
SERVERID=$(docker exec -it jira-mysql mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "select propertyvalue from jira.propertystring where id in (select id from jira.propertyentry where PROPERTY_KEY='jira.sid.key');" | egrep -o '([0-9A-Z]{4}\-?){4}')

if [[ -z "${SERVERID}" ]]; then
  echo "Jira unavailable."
  exit
else
  echo "Jira installed, SERVERID: "${SERVERID}
fi

while getopts "p:" opt; do
  case "$opt" in
  p) PROD="$OPTARG" ;;
  ?) helpFunction ;; # Print helpFunction in case parameter is non-existent
  esac
done

if [[ -z "${PROD}" ]]; then
  PROD="jira"
else
  echo "PROD: "${PROD}
fi

docker exec -it jira-app /opt/java/openjdk/bin/java -jar /opt/atlassian/agent/atlassian-agent.jar -m stuff@apache.org -n Apache -o Apache.org -d -s ${SERVERID} -p ${PROD}
