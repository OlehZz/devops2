#!/bin/bash
echo "[mysqld]
skip-grant-tables" >> /etc/mysql/my.cnf
echo '-- create the footgo database
CREATE DATABASE footgo;' > footgo.sql
