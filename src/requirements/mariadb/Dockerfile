FROM debian:12

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 3306

COPY ./entrypoint.sh .
RUN chmod +x entrypoint.sh

CMD ["./entrypoint.sh"]