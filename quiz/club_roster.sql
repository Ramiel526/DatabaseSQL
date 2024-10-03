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
