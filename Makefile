# Include environment variables from the .envrc file
include .envrc

# =========================== #
# HELPERS
# =========================== #

## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /'

.PHONY: confirm
confirm:
	@echo -n 'Are you sure? [y/N] ' && read ans && [ $${ans:-N} = y ]

# =========================== #
# DEV
# =========================== #

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

# =========================== #
# QUALITY CONTROL
# =========================== #

## audit: tidy dependencies and format, vet and test all code
.PHONY: audit
audit:
	@echo 'Tidying and verifying module dependencies...'
	go mod tidy
	go mod verify
	@echo 'Formatting code...'
	go fmt ./...
	@echo 'Vetting code...'
	go vet ./...
	staticcheck ./...
	@echo 'Running tests...'
	go test -race -vet=off ./...