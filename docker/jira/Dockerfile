ARG JIRA_VERSION=9.4.10
ARG IMAGE_PREFIX=''
FROM atlassian/jira-software:${JIRA_VERSION}

LABEL maintainer="xSharp <xsharp@hi3w.com>" version="${JIRA_VERSION}"

ENV AGENT_INSTALL_DIR                          /opt/atlassian/agent
ENV MYSQL_DRIVER_VERSION                       8.0.33

# ENV AGENT_VERSION                            1.3.1
# https://gitee.com/pengzhile/atlassian-agent/attach_files/832832/download/atlassian-agent-v${AGENT_VERSION}.tar.gz
# https://homelab.trac.cn/atlassian-agent-v1.3.1.tar.gz
# https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.31/mysql-connector-j-8.0.31.jar

#curl -o mysql-connector-j.jar https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar
#RUN mkdir -p   ${AGENT_INSTALL_DIR} \
#    && curl -o ${JIRA_INSTALL_DIR}/lib/mysql-connector-java-${MYSQL_DRIVER_VERSION}.jar https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/${MYSQL_DRIVER_VERSION}/mysql-connector-j-${MYSQL_DRIVER_VERSION}.jar -L
RUN mkdir -p   ${AGENT_INSTALL_DIR}
COPY mysql-connector-j.jar ${JIRA_INSTALL_DIR}/lib/
COPY atlassian-agent.jar /opt/atlassian/agent/

ENV JAVA_OPTS="-javaagent:${AGENT_INSTALL_DIR}/atlassian-agent.jar ${JAVA_OPTS}"

WORKDIR ${JIRA_INSTALL_DIR}


