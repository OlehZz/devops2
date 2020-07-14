FROM ubuntu:18.04

#install programs and variables
RUN apt  update
RUN apt-get install -y software-properties-common
RUN apt-get install -y openjdk-8-jdk
ENV MAVEN_HOME=/usr/share/maven
RUN apt-get install -y maven
RUN mkdir /home/webapp
ADD https://github.com/WiseHands/FootGo/archive/release/1.0.0.zip /home/webapp
RUN apt-get install -y unzip && unzip /home/webapp/1.0.0.zip
COPY 

RUN cp /home/webapp/FootGo-release-1.0.0/src/main/resources/application.properties.example /home/webapp/FootGo-release-1.0.0/src/main/resources/application.properties


RUN mvn -f /home/webapp/FootGo-release-1.0.0/ package
RUN apt-get install -y libaio1 libaio-dev
RUN apt-get install -y mysql-server mysql-client



