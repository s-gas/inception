FROM    debian:12

WORKDIR /db

RUN     apt-get update && apt-get install -y mariadb-server

COPY    ./db_setup.sh .

RUN     chmod +x db_setup.sh

CMD     ["./db_setup.sh"]