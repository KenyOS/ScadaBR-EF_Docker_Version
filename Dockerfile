FROM tomcat:9.0.53
COPY ScadaBR.war /usr/local/tomcat/webapps/
COPY install_scadabr-ef.sh /root
COPY libraryPath.class /root