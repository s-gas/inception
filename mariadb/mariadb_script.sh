#!/bin/bash

mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

mysqld --user=mysql &
sleep 3

mariadb -e "CREATE DATABASE IF NOT EXISTS db;"

mysqladmin shutdown

exec mysqld --user=mysql