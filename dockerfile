FROM ubuntu
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install maven -y
RUN apt-get install openjdk-8-jdk -y
COPY gamutkart2 /root
RUN cd /root/gamutkart2 && mvn install
RUN apt-get install wget -y
RUN apt-get install tar -y
RUN cd /opt && wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.81/bin/apache-tomcat-8.5.81.tar.gz && tar -zxvf apache-tomcat-8.5.81.tar.gz
RUN cp /root/gamutkart2/target/gamutgurus.war /opt/apache-tomcat-8.5.81/webapps
CMD /opt/apache-tomcat-8.5.81/bin/startup.sh && /bin/bash

