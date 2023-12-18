[![docker pulls](https://img.shields.io/docker/pulls/haxqer/jira.svg)](https://hub.docker.com/r/haxqer/jira/)  [![docker stars](https://img.shields.io/docker/stars/haxqer/jira.svg)](https://hub.docker.com/r/haxqer/jira/) [![image metadata](https://images.microbadger.com/badges/image/haxqer/jira.svg)](https://microbadger.com/images/haxqer/jira "haxqer/jira image metadata")

[kubernetes helm charts](https://github.com/haxqer/charts)


# jira

[README](README.md) | [中文文档](README_zh.md)

+ Long Term Support Version: v9.4.14
+ Latest Version: v9.12.1


+ [Arm Version](https://github.com/haxqer/jira#arm)


default port: `8080`

## requirement
- docker: 17.09.0+
- docker-compose: 1.24.0+

## How to run with docker-compose

- start jira & mysql

```
git clone https://github.com/haxqer/jira.git \
    && cd jira \
    && git checkout rm \
    && docker-compose pull \
    && docker-compose up
```

- start jira & mysql daemon

```
docker-compose up -d
```

- default db(mysql8.0) configure:

```bash
driver=mysql8.0
host=mysql-jira
port=3306
db=jira
user=root
passwd=123456
```

## How to run with docker

- start jira

```
docker volume create jira_home_data && docker network create jira-network && docker run -p 8080:8080 -v jira_home_data:/var/jira --network jira-network --name jira-srv -e TZ='Asia/Shanghai' haxqer/jira:9.12.1
```

- config your own db:


## How to hack jira

```
docker exec jira-srv java -jar /var/agent/atlassian-agent.jar \
    -d \
    -p jira \
    -m Hello@world.com \
    -n Hello@world.com \
    -o your-org \
    -s you-server-id-xxxx
```

## How to hack jira plugin

- .eg I want to use BigGantt plugin
1. Install BigGantt from jira marketplace.
2. Find `App Key` of BigGantt is : `eu.softwareplant.biggantt`
3. Execute :

```
docker exec jira-srv java -jar /var/agent/atlassian-agent.jar \
    -d \
    -p eu.softwareplant.biggantt \
    -m Hello@world.com \
    -n Hello@world.com \
    -o your-org \
    -s you-server-id-xxxx
```

4. Paste your license

## How to upgrade

```shell
cd jira && git pull
docker pull haxqer/jira:rm && docker-compose stop
docker-compose rm
```

enter `y`, then start server

```shell
docker-compose up -d
```

## Arm
Not completely tested.
Tested machines:
+ Mac mini(M1,2020)

Thanks to:
+ [odidev](https://github.com/odidev) for the Arm image.

```
git clone https://github.com/haxqer/jira.git \
    && cd jira \
    && git checkout rm && cd lts_arm \
    && docker-compose pull \
    && docker-compose up
```

## Hack Jira Service Management(jsm) Plugin

Thanks to:
+ [d1m0nstr](https://github.com/d1m0nstr) for [Jira Service Management](https://github.com/haxqer/jira/issues/11)

```
docker exec jira-srv java -jar /var/agent/atlassian-agent.jar \
    -d \
    -p jsm \
    -m Hello@world.com \
    -n Hello@world.com \
    -o your-org/ \
    -s you-server-id
```

