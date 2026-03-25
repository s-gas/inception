FROM debian:12

RUN apt-get update && \
    apt-get install -y php8.2-fpm php8.2-mysql wget unzip mariadb-client && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html

RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip -d /tmp && \
    rm latest.zip

RUN sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|' /etc/php/8.2/fpm/pool.d/www.conf

COPY ./entrypoint.sh .
RUN chmod +x entrypoint.sh

EXPOSE 9000

CMD ["./entrypoint.sh"]