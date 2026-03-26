FILE=./src/docker-compose.yml

up:
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress
	docker compose -f $(FILE) up
build:
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress
	docker compose -f $(FILE) up --build
down:
	docker compose -f $(FILE) down
erase:
	docker compose -f $(FILE) down -v
	sudo rm -rf ~/data
ps:
	docker compose -f $(FILE) ps
exec_mariadb:
	docker compose -f $(FILE) exec mariadb bash
exec_nginx:
	docker compose -f $(FILE) exec nginx bash
exec_wordpress:
	docker compose -f $(FILE) exec wordpress bash

.PHONY: up build down erase ps exec_mariadb exec_nginx exec_wordpress