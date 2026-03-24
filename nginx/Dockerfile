FROM debian:12

ARG DOMAIN_NAME=sgaspari.42.fr

RUN apt-get update && apt-get install -y nginx openssl
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 443

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/CN=${DOMAIN_NAME}}"

COPY ./nginx.conf  /etc/nginx/conf.d/

COPY ./index.html /var/www/html/

CMD [ "nginx", "-g", "daemon off;"]