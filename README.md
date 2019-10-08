[![docker pulls](https://img.shields.io/docker/pulls/haxqer/jira.svg)](https://hub.docker.com/r/haxqer/jira/)  [![docker stars](https://img.shields.io/docker/stars/haxqer/jira.svg)](https://hub.docker.com/r/haxqer/jira/) [![image metadata](https://images.microbadger.com/badges/image/haxqer/jira.svg)](https://microbadger.com/images/haxqer/jira "haxqer/jira image metadata")

# jira
default port: 8080

## requirement
- docker: 17.09.0+
- docker-compose: 1.24.0+

## How to run with docker-compose

- start jira & mysql

```
    git clone https://github.com/haxqer/jira.git \
        && cd jira \
        && docker-compose pull \
        && docker-compose up
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
    docker run -p 8080:8080 -v jira_home_data:/var/jira --network jira-network --name jira-srv -e TZ='Asia/Shanghai' haxqer/jira
```

- config your own db:

## option

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

