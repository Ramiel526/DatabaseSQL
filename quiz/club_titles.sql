drop table if exists club_titles;

-- club titles
create table club_titles (
	club_name varchar2(50) not null primary key
);

insert into club_titles (club_name) values ('hiking');
insert into club_titles (club_name) values ('Tennis');
insert into club_titles (club_name) values ('Running');

