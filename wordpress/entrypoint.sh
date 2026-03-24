#!/bin/bash

cp -r /tmp/wordpress/* /var/www/html/
rm -rf /tmp/wordpress/*

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

exec php-fpm8.2 -F