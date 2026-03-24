FROM    debian:12

RUN     apt-get update && apt-get install nginx openssl -y

COPY    conf/nginx.conf /etc/nginx/conf.d/

RUN     rm /var/www/html/index.nginx-debian.html
COPY    ./html/index.html /var/www/html/

EXPOSE  443

COPY    ./tools/nginx_setup.sh .
RUN     chmod +x nginx_setup.sh

CMD     ["./nginx_setup.sh"]