FROM debian:12

RUN apt-get update && \
    apt-get install -y php-fpm wget && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz -C /var/www/html --strip-components=1 && \
    rm latest.tar.gz

RUN sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 9000|' /etc/php/8.2/fpm/pool.d/www.conf

CMD ["php-fpm8.2", "-F"] 