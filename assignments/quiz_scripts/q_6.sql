drop table student_history;

-- create history table with the old student row w/ timestamp
create table student_history (
    old_student_id number,
    old_name varchar2(20),
    time_stamp timestamp default systimestamp, -- sysdate or systimestamp
    foreign key (old_student_id) references student(student_id)
);
-- test by creating update in student row, should generate student_history table row as well.
create or replace trigger student_update_history
before update on student
for each row
begin
insert into student_history (old_student_id, old_name, time_stamp)
values ( :old.student_id, :old.name, systimestamp );
end;
/
--test trigger
update student
set name = 'Bob Saget'
where student_id = 1;

select * from student_history;
