drop student_history
-- create history table with the old student row w/ timestamp
create table student_history ( 

    old_student ,
    time_stamp sysdate,
    foreign key () references ()
);
-- test by creating update in student row, should generate student_history table row as well.
create or replace trigger
before update of 
on
for each row
begin
insert into
values
(old.student_id,
)
end;
