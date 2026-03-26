#!/bin/bash

DB_PASSWORD=$(cat /run/secrets/password) 

cp -r /tmp/wordpress/* /var/www/html/
rm -rf /tmp/wordpress/*

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

until mariadb -h mariadb -u "$DB_USER" -p"$DB_PASSWORD" -e "SELECT 1;" 2>/dev/null; do
    echo "Waiting for MariaDB..."
    sleep 2
done

if [ ! -f /var/www/html/wp-config.php ]; then
    wp config create \
        --path=/var/www/html \
        --dbname="$DB_NAME" \
        --dbuser="$DB_USER" \
        --dbpass="$DB_PASSWORD" \
        --dbhost="$DB_HOST" \
        --allow-root
    echo "wp-config.php created"
fi

wp core install \
    --path=/var/www/html \
    --url="$DOMAIN_NAME" \
    --title="Inception" \
    --admin_user="mod" \
    --admin_password="$DB_PASSWORD" \
    --admin_email="mod@$DOMAIN_NAME" \
    --allow-root

echo "Container running ✅"
exec php-fpm8.2 -F