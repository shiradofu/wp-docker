MAKEFLAGS += --always-make

.DEFAULT_GOAL := daemon

include .env
export

daemon:
	@docker-compose up -d

up:
	@docker-compose up

down:
	@docker-compose down

re: down daemon

app-shell:
	@docker-compose exec app bash

db-client:
	@docker-compose exec db mysql -u $$DB_USERNAME -p$$DB_PASSWORD $$DB_DATABASE

db-shell:
	@docker-compose exec db bash
