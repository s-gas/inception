#!/bin/bash
set -e

MARKER_FILE="/var/lib/mysql/.db_initialized"

if [ ! -f "$MARKER_FILE" ]; then
    mariadb-install-db --user=mysql --ldata=/var/lib/mysql

    mysqld_safe --datadir=/var/lib/mysql &
    pid="$!"

    while [ ! -S /var/run/mysqld/mysqld.sock ]; do
        sleep 1
    done

    mariadb -u root -S /var/run/mysqld/mysqld.sock -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"
    mariadb -u root -S /var/run/mysqld/mysqld.sock -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
    mariadb -u root -S /var/run/mysqld/mysqld.sock -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO '${MARIADB_USER}'@'%';"
    mariadb -u root -S /var/run/mysqld/mysqld.sock -e "FLUSH PRIVILEGES;"

    touch "$MARKER_FILE"
    echo "[MariaDB] Initialization complete"

    mysqladmin -u root -S /var/run/mysqld/mysqld.sock shutdown
    wait "$pid"
fi

exec mysqld_safe --datadir=/var/lib/mysql --bind-address=0.0.0.0