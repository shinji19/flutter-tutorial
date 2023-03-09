build:
	docker compose build

up:
	docker compose up -d

app:
	docker compose exec app bash

down:
	docker compose down
