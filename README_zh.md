[![docker pulls](https://img.shields.io/docker/pulls/haxqer/jira.svg)](https://hub.docker.com/r/haxqer/jira/)  [![docker stars](https://img.shields.io/docker/stars/haxqer/jira.svg)](https://hub.docker.com/r/haxqer/jira/) [![image metadata](https://images.microbadger.com/badges/image/haxqer/jira.svg)](https://microbadger.com/images/haxqer/jira "haxqer/jira image metadata")

[kubernetes helm charts](https://github.com/haxqer/charts)

# jira

[README](README.md) | [中文文档](README_zh.md)

默认端口: `8080`

## 环境要求
- docker: 17.09.0+
- docker-compose: 1.24.0+

## 如何使用 docker-compose 启动 jira

-  启动 jira & mysql

```
    git clone https://github.com/haxqer/jira.git \
        && cd jira \
        && git checkout rm \
        && docker-compose pull \
        && docker-compose up
```

- 以守护进程的方式启动 jira & mysql

```
    docker-compose up -d
```

- 默认的 数据库(mysql5.7) 配置:

```bash
    driver=mysql5.7+
    host=mysql-jira
    port=3306
    db=jira
    user=jira
    passwd=123123
```

## 如果使用 docker 启动

- 启动 jira

```
    docker run -p 8080:8080 -v jira_home_data:/var/jira --network jira-network --name jira-srv -e TZ='Asia/Shanghai' haxqer/jira:rm
```

- 然后配置你的数据库


## 如何破解 jira

```
docker exec jira-srv java -jar /var/agent/atlassian-agent.jar \
    -p jira \
    -m haxqer666@gmail.com \
    -n haxqer666@gmail.com \
    -o http://website \
    -s you-server-id-xxxx
```

## 如何破解 jira 的插件

- 例如: 你想要破解 BigGantt 插件
1. 从 jira marketplace 中安装 BigGantt 插件
2. 查看 BigGantt 的 `App Key` 是 : `eu.softwareplant.biggantt`
3. 然后执行 :

```
docker exec jira-srv java -jar /var/agent/atlassian-agent.jar \
    -p eu.softwareplant.biggantt \
    -m haxqer666@gmail.com \
    -n haxqer666@gmail.com \
    -o http://website \
    -s you-server-id-xxxx
```

4. 最后粘贴生成的 licence

## 如何升级

```shell
cd jira && git pull
docker pull haxqer/jira:rm && docker-compose stop
docker-compose rm
```

输入 `y` 之后重启 jira:

```shell
docker-compose up -d
```

## 安装 docker & docker-compose
- 如果你使用的是 `debian` 操作系统, 可以使用如下脚本:
```
    ./script/debian-install-docker.sh
    ./script/linux-install-docker-compose.sh
```


