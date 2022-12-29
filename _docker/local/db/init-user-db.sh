#!/bin/bash

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER postgres;
    ALTER USER postgres WITH PASSWORD 'postgres';
    CREATE DATABASE postgres;
    GRANT ALL PRIVILEGES ON DATABASE postgres TO postgres;
EOSQL
