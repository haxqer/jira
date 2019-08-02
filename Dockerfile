FROM openjdk:8-stretch

LABEL maintainer="haxqer <haxqer666@gmail.com>" version="8.3.0"

ARG work_user=jira
ENV TZ='Asia/Shanghai' \ 
    JIRA_USER=jira \
    JIRA_GROUP=jira \
    JIRA_HOME=/var/jira \
    JIRA_INSTALL=/opt/jira \
    AGENT_PATH=/var/agent/atlassian-agent.jar 

ENV JAVA_OPTS="-javaagent:${AGENT_PATH} ${JAVA_OPTS}" 

RUN export CONTAINER_USER=jira                      &&  \
    export CONTAINER_GROUP=jira                     &&  \
    groupadd $CONTAINER_GROUP                       &&  \
    useradd -g $CONTAINER_GROUP $CONTAINER_USER     

ADD --chown=jira:jira . $JIRA_INSTALL 
ADD --chown=jira:jira ./temp/atlassian-agent.jar $AGENT_PATH
ADD --chown=jira:jira ./temp/dbconfig.xml $JIRA_HOME/dbconfig.xml

USER jira
WORKDIR $JIRA_INSTALL
EXPOSE 8080

ENTRYPOINT ["/opt/jira/bin/start-jira.sh", "-fg"]
