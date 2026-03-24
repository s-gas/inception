#!/bin/bash

mysqld --user=mysql --bootstrap << EOF
CREATE DATABASE IF NOT EXISTS db;
EOF

exec mysqld --user=mysql