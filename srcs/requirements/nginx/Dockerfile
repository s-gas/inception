FROM debian:12

RUN apt-get update
RUN apt-get install nginx -y
RUN rm /var/www/html/index.nginx-debian.html

COPY ./index.html /var/www/html/

CMD ["nginx", "-g", "daemon off;"]