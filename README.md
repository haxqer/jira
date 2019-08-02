# jira

## requirement
- docker-compose: 17.09.0+

## How to run

- start jira

`docker-compose up`

- start jira daemon

`docker-compose up -d`

## How to hack jira

`docker exec jira-srv java -jar /var/agent/atlassian-agent.jar  -p jira -m haxqer666@gmail.com -n haxqer666@gmail.com -o http://ip -s you-server-id-xxxx`

## How to hack jira plugin

- .eg I want to use BigGantt plugin
1. Install BigGantt from jira marketplace.
2. Find `App Key` of BigGantt is : `eu.softwareplant.biggantt`
3. Execute :

`docker exec jira-srv java -jar /var/agent/atlassian-agent.jar -p eu.softwareplant.biggantt -m haxqer666@gmail.com -n haxqer666@gmail.com -o http://ip -s you-server-id-xxxx`

4. Paste your license 

## install docker & docker-compose
- If you use `debian`, just do it.

`./script/debian-install-docker.sh`

`./script/linux-install-docker-compose.sh`
