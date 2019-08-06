FROM openjdk:8-stretch

LABEL maintainer="haxqer <haxqer666@gmail.com>" version="8.3.0"

ENV JIRA_HOME=/var/jira \
    JVM_MINIMUM_MEMORY=1g \
    JVM_MAXIMUM_MEMORY=3g \
    JVM_CODE_CACHE_ARGS='-XX:InitialCodeCacheSize=1g -XX:ReservedCodeCacheSize=2g' \
    JIRA_INSTALL=/opt/jira \
    AGENT_PATH=/var/agent/atlassian-agent.jar

ENV JAVA_OPTS="-javaagent:${AGENT_PATH} ${JAVA_OPTS}"

ADD . $JIRA_INSTALL
ADD ./temp/atlassian-agent.jar $AGENT_PATH

WORKDIR $JIRA_INSTALL
EXPOSE 8080

ENTRYPOINT ["/opt/jira/bin/start-jira.sh", "-fg"]
