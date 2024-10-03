-- drop sequence if exists id_seq;
drop sequence id_seq;

create sequence id_seq
	start with 1
	increment by 1
	nocache;

drop table student_roster;
-- drop table if exists student_roster;

create table student_roster (
	id_num int primary key,
	student_name varchar2(25) not null,
	dateofbirth date not null
);

insert into student_roster (
	id_num,
	student_name,
	dateofbirth
	)

select id_seq.nextval, name, dob
from quiz2data
where dob is not null;

drop table if exists phone_purpose;
create table phone_purpose (
	phone_type varchar(4) not null primary key
);
insert into phone_purpose (phone_type) values ('cell');
insert into phone_purpose (phone_type) values ('work');
insert into phone_purpose (phone_type) values ('home');

create table club_titles (
	club_name varchar2(50) not null primary key
);
insert into club_titles (club_name) values ('hiking');
insert into club_titles (club_name) values ('Tennis');
insert into club_titles (club_name) values ('Running');

-- club roster
/*drop table if exists club_roster;*/

drop table club_roster;
create table club_roster (
	date_joined timestamp not null,
	student_id_num int not null,
	name_of_club varchar2(15) not null,
-- primary key defined
	constraint pk_club_roster primary key (date_joined, student_id_num, name_of_club),
-- foreign keys defined
	foreign key (name_of_club) references club_titles(club_name),
	foreign key (student_id_num) references student_roster(id_num)
);

/* ??? DEBUG ???

select club
from quiz2data
where club is not null;

 ??? DEBUG ??? */

INSERT INTO club_roster (date_joined, student_id_num, name_of_club)
SELECT
    CURRENT_TIMESTAMP,  -- Using the current timestamp as the date_joined
    sr.id_num,          -- Fetching the student ID from student_roster
    q.club              -- Fetching the club name from quiz2data
FROM
    quiz2data q
JOIN
    student_roster sr
ON
    q.name = sr.student_name
WHERE
    q.club IS NOT NULL;

/* *** Table create before use ***
--create change logs
create table club_roster_log (
    date_joined timestamp,
    student_id_num int,
    log_club_name varchar2(15)
);

create table student_roster_log (
    id_num int,
    old_name varchar(25),
    new_name varchar(25),
    update_date timestamp
);
*/
create or replace trigger club_roster_update
before update on club_roster
for each row
begin
	insert into club_roster_log (date_joined, student_id_num, name_of_club)
  values (:OLD.date_joined, :OLD.student_id_num, :OLD.name_of_club);
end;

create or replace trigger student_roster_update
before update on student_roster
for each row
begin
	insert into student_roster_log (id_num, old_name, new_name, update_date)
	values (:OLD.id_num, :OLD.student_name, :New.student_name, SYSDATE);
end;

drop sequence msg_id_seq;

create sequence msg_id_seq
    start with 1
    increment by 1
    nocache;

drop table message_log;

create table message_log (
    msg_id int primary key,
    msg_to int not null,
    msg_from int not null
,
    message_body VARCHAR2(50),
    FOREIGN KEY (msg_to) REFERENCES student_roster(id_num),
    FOREIGN KEY (msg_from) REFERENCES student_roster(id_num)
);

INSERT INTO message_log (msg_id, msg_to, msg_from, message_body)
SELECT
    msg_id_seq.nextval,       -- Use the sequence for the msg_id
    sr_to.id_num AS msg_to,   -- Insert the "to" student ID
    sr_from.id_num AS msg_from, -- Insert the "from" student ID
    qd.message AS message_body -- Insert the message content
FROM
    quiz2data qd
JOIN
    student_roster sr_to
    ON qd.message_to = sr_to.student_name
JOIN
    student_roster sr_from
    ON qd.name = sr_from.student_name
WHERE
    qd.message IS NOT NULL;
/* insert into message_log (
	msg_id,
	msg_to,
	msg_from,
	message_body
	)

select msg_id_seq.nextval, name, dob
from quiz2data
where dob is not null;
*/

