## List of available Tomcat versions: https://registry.hub.docker.com/_/tomcat/
FROM tomcat:8

# Dockerfile author/maintainer
MAINTAINER Saidimu Apale (saidimu@gmail.com)

## List of Openboxes releases: https://github.com/openboxes/openboxes/releases
ENV OPENBOXES_VERSION=v0.6.8
ENV TOMCAT_HOME=/usr/local/tomcat/

ADD https://github.com/openboxes/openboxes/releases/download/${OPENBOXES_VERSION}/openboxes.war ${TOMCAT_HOME}/webapps/
COPY setenv.sh ${TOMCAT_HOME}/bin/
COPY tomcat-users.xml ${TOMCAT_HOME}/conf/tomcat-users.xml:ro
COPY openboxes-config.properties:/root/.grails/openboxes-config.properties

RUN service tomcat7 restart

CMD [""]
