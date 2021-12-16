FROM tomcat:9.0.53
COPY ScadaBR.war /usr/local/tomcat/webapps/
COPY context.xml /usr/local/tomcat/conf/context.xml
COPY libraryPath.class /root