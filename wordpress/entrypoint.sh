#!/bin/bash
set -e

cp -r /tmp/wordpress/* /var/www/html/
rm -rf /tmp/wordpress/*

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

wp config create \
    --path=/var/www/html \
    --dbname="$DB_NAME" \
    --dbuser="$DB_USER" \
    --dbpass="$DB_PASSWORD" \
    --dbhost="$DB_HOST" \
    --allow-root
echo "wp-config.php created"

echo "wordpress container running"
exec php-fpm8.2 -F