alter table movies add constraint movies_runtime_check check (runtime >= 0);
alter table movies add constraint movies_year_check check (year between 1888 and date_part('year', now()));
alter table movies add constraint genres_length_check check (array_length(genres, 1) BETWEEN 1 AND 5);