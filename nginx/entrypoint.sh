#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/CN=${DOMAIN_NAME}"

sed -i "s|SERVER_NAME|${DOMAIN_NAME}|g" /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'