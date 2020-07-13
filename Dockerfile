FROM ubuntu:18.04

RUN apt-get update
RUN apt install mysql-server
RUN apt-get install maven
