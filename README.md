# jira

## requirement
- docker-compose: 17.09.0+

## How to run with docker-compose

- start jira & mysql

```
    docker-compose up
```

- start jira & mysql daemon

```
    docker-compose up -d
```

- default db(mysql5.7) configure:

```bash
    driver=mysql5.7+
    host=mysql-jira
    port=3306
    db=jira
    user=jira
    passwd=123123
```

## How to run with docker

- start jira

```
    docker run -p 8080:8080 -v ./jira:/var/jira --network jira-network --name jira-srv -e TZ='Asia/Shanghai' haxqer/jira
```

- config your own db:


## How to hack jira

```
docker exec jira-srv java -jar /var/agent/atlassian-agent.jar \
    -p jira \
    -m haxqer666@gmail.com \
    -n haxqer666@gmail.com \
    -o http://website \
    -s you-server-id-xxxx
```

## How to hack jira plugin

- .eg I want to use BigGantt plugin
1. Install BigGantt from jira marketplace.
2. Find `App Key` of BigGantt is : `eu.softwareplant.biggantt`
3. Execute :

```
docker exec jira-srv java -jar /var/agent/atlassian-agent.jar \
    -p eu.softwareplant.biggantt \
    -m haxqer666@gmail.com \
    -n haxqer666@gmail.com \
    -o http://website \
    -s you-server-id-xxxx
```

4. Paste your license 

## Install docker & docker-compose
- If you use `debian`, just do it.
```
    ./script/debian-install-docker.sh
    ./script/linux-install-docker-compose.sh
```

## Set Proxy

path : `~/.docker/config.json`

content : 
```
{
    "proxies": {
        "default": {
         "httpProxy": "http://ip:port",
         "httpsProxy": "http://ip:port"
        }
    }
}
```

