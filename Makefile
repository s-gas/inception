up:
	docker compose up
build:
	docker compose up --build
down:
	docker compose down
erase:
	docker compose down -v
ps:
	docker compose ps

.PHONY: up build down clear ps