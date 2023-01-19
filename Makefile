## help: print this help message
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /'

confirm:
	@echo -n 'Are you sure? [y/N] ' && read ans && [ $${ans:-N} = y ]

## run: run the cmd/api application
run:
	go run ./cmd/api

## db: connect to the database using psql
db:
	psql postgres://postgres:postgres@localhost:9912/greenlight?sslmode=disable

## migration/up: confirm
migration/up: confirm
	@echo 'Running up migrations...'
	migrate -path ./migrations -database "postgresql://postgres:postgres@localhost:9912/greenlight?sslmode=disable" up

## migration/new name=$1: create a new database migration
migration/new:
	@echo 'Creating migration files for ${name}...'
	migrate create -seq -ext=.sql -dir=./migrations ${name}
