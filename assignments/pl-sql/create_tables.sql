drop table student cascade constraints;
drop table address_history cascade constraints;
drop table student_history cascade constraints;


-- Create student table
create table student (
	student_id number not null primary key,
	student_name varchar2(70) not null,
	dob date not null
	);

-- Create tables for address history and student history
create table address_history (
    history_id number primary key,
    student_id number,
    old_address varchar2(250),
    DateOfChange date default sysdate,
foreign key (student_id) references student(student_id) on delete cascade
);

-- Create history of student log
create table student_history (
	record_id_history number primary key,
	student_id number,
	student_name varchar2(70),
	dob date,
foreign key (student_id) references student(student_id) on delete cascade
);
