FROM ubuntu
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install maven -y
RUN apt-get install openjdk-8-jdk -y
RUN useradd -md /home/dnyaneshwar -s /bin/bash dnyaneshwar
RUN echo dnyaneshwar:12345678 | chpasswd
COPY gamutkart2 /home/dnyaneshwar
RUN cd /home/dnyaneshwar/gamutkart2 && mvn install
RUN apt-get install wget -y
RUN cd /opt && wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.81/bin/apache-tomcat-8.5.81.tar.gz && tar -zxvf apache-tomcat-8.5.81.tar.gz
RUN cp /home/gamutkart2/target/gamutgurus.war /opt/apache-tomcat-8.5.81/webapps
CMD /opt/apache-tomcat-8.5.81/bin/startup.sh && /bin/bash

