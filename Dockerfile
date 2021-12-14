FROM ubuntu:xenial

RUN apt-get update && apt-get install -y software-properties-common
RUN apt-get update
RUN apt-get install -y wget vim
COPY ScadaBR.war /root
COPY install_scadabr.sh /root
COPY OpenJDK8U-jre_aarch64_linux_hotspot_8u302b08.tar.gz /root
COPY OpenJDK8U-jre_arm_linux_hotspot_8u292b10.tar.gz /root
COPY OpenJDK8U-jre_x64_linux_hotspot_8u302b08.tar.gz /root
COPY openlogic-openjdk-jre-8u292-b10-linux-x32.tar.gz /root
COPY libraryPath.class /root
COPY apache-tomcat.tar.gz /root

ENTRYPOINT ["/root/install_scadabr.sh"]
