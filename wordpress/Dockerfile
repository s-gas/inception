FROM debian:12

RUN apt-get update && \
    apt-get install -y php8.2-fpm wget unzip && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html

RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip -d /tmp && \
    rm latest.zip

RUN sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|' /etc/php/8.2/fpm/pool.d/www.conf

COPY ./wordpress_script.sh /wordpress_script.sh
RUN chmod +x /wordpress_script.sh

EXPOSE 9000

CMD ["/wordpress_script.sh"]