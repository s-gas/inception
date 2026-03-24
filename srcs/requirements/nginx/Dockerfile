FROM    debian:12

RUN     apt-get update && apt-get install nginx openssl -y

RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/nginx.key \
        -out /etc/ssl/certs/nginx.crt \
        -subj "/CN=sgaspari.42.fr"

COPY    conf/nginx.conf /etc/nginx/conf.d/

RUN     rm /var/www/html/index.nginx-debian.html
COPY    ./html/index.html /var/www/html/

EXPOSE  443

CMD     ["nginx", "-g", "daemon off;"]