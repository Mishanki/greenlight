# Include variables from the .envrc file
include .envrc

## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /'

.PHONY: confirm
confirm:
	@echo -n 'Are you sure? [y/N] ' && read ans && [ $${ans:-N} = y ]

## run: run the cmd/api application
.PHONY: run/api
run/api:
	go run ./cmd/api

## db: connect to the database using psql
.PHONY: db
db:
	psql ${GREENLIGHT_DB_DSN}

## migration/up: confirm
.PHONY: migration/up
migration/up: confirm
	@echo 'Running up migrations...'
	migrate -path ./migrations -database ${GREENLIGHT_DB_DSN} up

## migration/new name=$1: create a new database migration
.PHONY: migration/new
migration/new:
	@echo 'Creating migration files for ${name}...'
	migrate create -seq -ext=.sql -dir=./migrations ${name}
