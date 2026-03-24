FROM        debian:12

RUN         apt-get update && apt-get install -y mariadb-server

COPY        ./mariadb_script.sh .
RUN         chmod +x mariadb_script.sh

CMD         ["./mariadb_script.sh"]