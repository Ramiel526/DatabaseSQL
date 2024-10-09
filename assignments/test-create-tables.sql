drop table messages;

-- drop sequence if exists msg_seq;
drop sequence msg_seq;

create sequence msg_seq start with 1 increment by 1;

create table messages (
	msg_id int not null primary key,
	message varchar2(30)

);

insert into messages (msg_id, message) values (
	msg_seq.nextval,
	'This is the first'
);

insert into messages (msg_id, message) values (
	msg_seq.nextval,
	'this is a welcome message'
);

insert into messages (msg_id, message) values (
	msg_seq.nextval,
	'cooking burgers on saturday'
);

