FROM debian:12

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld

EXPOSE 3306

CMD ["mysqld", "--user=mysql"]