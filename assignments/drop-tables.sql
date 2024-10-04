drop table student;
drop table address_history;
drop table student_history;

-- Create student table
create table student (
	student_id number not null primary key,
	student_name varchar2(70) not null,
	dob date not null
	);

-- Alter table add nickname and address columns
alter table student add (
	nickname varchar2(70),
	address varchar2(250)
);

-- Create tables for address history and student history
create table address_history (
    history_id number primary key,
    student_id number,
    old_address varchar2(250),
    DateOfChange date default sysdate,
foreign key (student_id) references student(student_id)
);

-- Create history of student log
create table student_history (
	record_id_history number primary key,
	student_id number,
	student_name varchar2(70),
	dob date,
foreign key (student_id) references student(student_id),
);

-- TRIGGER for change of address
create or replace trigger address_update
before update of address on student
for each row
begin
	insert into address_history (student_id, prev_address, DateOfChange)
	values (:old.student_id, :old.address, sysdate);
end;
/

-- deletion of student record
create or replace trigger student_history
before delete on student for each row
begin
insert into student_history values (
	:old.student_id, :old.student_name, :old.dob
);
end;
/
