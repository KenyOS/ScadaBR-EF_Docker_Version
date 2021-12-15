FROM ubuntu:xenial

RUN apt-get update && apt-get install -y software-properties-common systemd
RUN apt-get update
RUN apt-get install -y wget vim zip unzip cron
COPY ScadaBR.war /root
COPY install_scadabr-ef.sh /root
COPY apache-tomcat.tar.gz /root
COPY tomcat9.service /root
COPY OpenJDK8U-jre_aarch64_linux_hotspot_8u302b08.tar.gz /root
COPY OpenJDK8U-jre_arm_linux_hotspot_8u292b10.tar.gz /root
COPY OpenJDK8U-jre_x64_linux_hotspot_8u302b08.tar.gz /root
COPY openlogic-openjdk-jre-8u292-b10-linux-x32.tar.gz /root
COPY libraryPath.class /root
RUN ["chmod", "+x", "/root/install_scadabr-ef.sh"]
ENTRYPOINT ["/bin/sh", "-c", "/root/install_scadabr-ef.sh", "silent"]
