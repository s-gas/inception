#!/bin/bash
set -e

MARKER_FILE="/var/lib/mysql/.db_initialized"

if [ ! -f "$MARKER_FILE" ]; then
    echo "marker_file does not exist"
    echo "bootstrapping mariadb..."
    mariadb-install-db --user=mysql --ldata=/var/lib/mysql

    mysqld_safe --datadir=/var/lib/mysql &
    pid="$!"

    while [ ! -S /var/run/mysqld/mysqld.sock ]; do
        sleep 1
    done

    mariadb -u root -S /var/run/mysqld/mysqld.sock -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
    mariadb -u root -S /var/run/mysqld/mysqld.sock -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
    mariadb -u root -S /var/run/mysqld/mysqld.sock -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';"
    mariadb -u root -S /var/run/mysqld/mysqld.sock -e "FLUSH PRIVILEGES;"

    touch "$MARKER_FILE"

    mysqladmin -u root -S /var/run/mysqld/mysqld.sock shutdown
    wait "$pid"
    echo "bootstrap completed"
fi

echo "mariadb container running"
exec mysqld_safe --datadir=/var/lib/mysql --bind-address=0.0.0.0