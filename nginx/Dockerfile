FROM debian:12

ARG DOMAIN_NAME=sgaspari.42.fr

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/CN=${DOMAIN_NAME}"

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

RUN sed -i "s|SERVER_NAME|${DOMAIN_NAME}|g" /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]