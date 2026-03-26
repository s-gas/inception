#!/bin/bash
set -e

MARKER_FILE="/var/lib/mysql/.db_initialized"
DB_PASSWORD=$(cat /run/secrets/password)

if [ ! -f "$MARKER_FILE" ]; then
    echo "Marker file does not exist"
    echo "Initializing mariadb..."
    mariadb-install-db --user=mysql --ldata=/var/lib/mysql

    mysqld_safe --datadir=/var/lib/mysql &
    pid="$!"

    while [ ! -S /var/run/mysqld/mysqld.sock ]; do
        echo "Waiting for UNIX socket"
        sleep 2
    done

    mariadb -u root -S /var/run/mysqld/mysqld.sock -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
    mariadb -u root -S /var/run/mysqld/mysqld.sock -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
    mariadb -u root -S /var/run/mysqld/mysqld.sock -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';"
    mariadb -u root -S /var/run/mysqld/mysqld.sock -e "FLUSH PRIVILEGES;"

    touch "$MARKER_FILE"

    mysqladmin -u root -S /var/run/mysqld/mysqld.sock shutdown
    wait "$pid"
    echo "Initialization completed"
fi

echo "Container running ✅"
exec mysqld_safe --datadir=/var/lib/mysql --bind-address=0.0.0.0