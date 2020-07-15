FROM ubuntu:18.04

#create variables and home directory
RUN mkdir /home/webapp
ENV MAVEN_HOME=/usr/share/maven

#install app
RUN apt  update
RUN apt-get install -y software-properties-common
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y maven
RUN apt-get install -y libaio1 libaio-dev
RUN apt-get install -y mysql-server mysql-client
ADD https://github.com/WiseHands/FootGo/archive/release/1.0.0.zip /home/webapp
RUN apt-get install -y unzip && unzip /home/webapp/1.0.0.zip
#configure footgo app
RUN cp /home/webapp/FootGo-release-1.0.0/src/main/resources/application.properties.example /home/webapp/FootGo-release-1.0.0/src/main/resources/application.properties
#configure mysql db
ADD https://github.com/OlehZz/devops2/blob/master/sqlsetup.sh /home/webapp/
RUN /home/webapp/sqlsetup.sh

#create working app
RUN mvn -f /home/webapp/FootGo-release-1.0.0/ package
#run website
ENTRYPOINT java -jar ROOT.war

