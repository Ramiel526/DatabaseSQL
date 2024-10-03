drop table if exists phone_purpose;
create table phone_purpose (
	phone_type varchar(4) not null primary key
);
insert into phone_purpose (phone_type) values ('cell');
insert into phone_purpose (phone_type) values ('work');
insert into phone_purpose (phone_type) values ('home');
