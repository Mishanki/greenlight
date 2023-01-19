run:
	go run ./cmd/api

psql:
	psql postgres://postgres:postgres@localhost:9912/greenlight?sslmode=disable

up:
	@echo 'Running up migrations...'
	migrate -path ./migrations -database "postgresql://postgres:postgres@localhost:9912/greenlight?sslmode=disable" up

migration:
	@echo 'Creating migration files for ${name}...'
	migrate create -seq -ext=.sql -dir=./migrations ${name}