#!/bin/bash

cp /home/webapp/FootGo-release-1.0.0/src/main/resources/application.properties.example /home/webapp/FootGo-release-1.0.0/src/main/resources/application.properties

echo "[mysqld]
skip-grant-tables" >> /etc/mysql/my.cnf

echo '-- create the footgo database
CREATE DATABASE footgo;' > /home/webapp/footgo.sql

service mysql start
mysql < /home/webapp/footgo.sql
