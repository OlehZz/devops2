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

#configure Footgo app and mysql db 
ADD https://github.com/OlehZz/devops2/archive/master.zip /home/webapp/
RUN unzip -j /home/webapp/master.zip devops2-master/sqlsetup.sh
# chmod +x /home/webapp/sqlsetup.sh
RUN echo ls /home/webapp
RUN /home/webapp/sqlsetup.sh

#create working app
RUN mvn -f /home/webapp/FootGo-release-1.0.0/ package

# Set the working directory.
WORKDIR /home/webapp/FootGo-release-1.0.0/target

#run website
ENTRYPOINT java -jar /home/webapp/FootGo-release-1.0.0/target/ROOT.war

