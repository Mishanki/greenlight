alter table movies drop constraint if exists movies_runtime_check;
alter table movies drop constraint if exists movies_year_check;
alter table movies drop constraint if exists genres_length_check;