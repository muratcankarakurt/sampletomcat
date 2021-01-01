FROM tomcat

RUN chown 1001:1001 -R /usr/local/tomcat
USER 1001
ADD --chown=1001:1001 https://tomcat.apache.org/tomcat-8.0-doc/appdev/sample/sample.war /usr/local/tomcat/webapps/sample.war