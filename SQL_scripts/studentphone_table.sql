-- create table student phone
create table student_phone (
	studentID number,
	phoneNumber varchar2(10),
	phoneType char(1),
	primary key (StudentID, PhoneNumber)
);

-- Insert data into table above
insert into student_phone (studentID, phoneNumber, phoneType) values (1, '555-1234', 'H');
insert into student_phone (studentID, phoneNumber, phoneType) values (2, '572-1148', 'C');
insert into student_phone (studentID, phoneNumber, phoneType) values (3, '589-1083', 'H');
insert into student_phone (studentID, phoneNumber, phoneType) values (student_seq.nextval, '555-8765', 'W');

-- verify results
select * from student_phone;


