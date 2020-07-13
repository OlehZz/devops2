FROM tomcat

RUN apt-get update
RUN apt-get install maven
RUN apt-get install tomcat
