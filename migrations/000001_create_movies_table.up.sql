create table if not exists movies (
    id bigserial PRIMARY KEY,
    created_at timestamp(0) with time zone not null default NOW(),
    title text not null,
    year integer not null,
    runtime integer not null,
    genres text[] not null,
    version integer not null default 1
);