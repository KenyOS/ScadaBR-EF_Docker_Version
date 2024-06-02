FROM tomcat:9.0-jre8-temurin-focal
LABEL maintainer="mail.kenyos.me"
COPY context.xml /usr/local/tomcat/conf/context.xml
COPY mysql-connector-java-5.1.49.jar /usr/local/tomcat/lib/mysql-connector-java-5.1.49.jar
COPY ScadaBR.war /usr/local/tomcat/webapps/
