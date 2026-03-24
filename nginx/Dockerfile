FROM debian:12

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./entrypoint.sh .
RUN chmod +x entrypoint.sh

EXPOSE 443

CMD ["./entrypoint.sh"]