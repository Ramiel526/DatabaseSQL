--Q5
--student id, phone_num, phone_purpose(
-- purpose is either cell, work, or home

drop table phone_purpose_table;
create table phone_purpose_table (
phone_type char(4) primary key);

-- Insert allowed phone purposes into phone_purpose_table
insert into phone_purpose_table (phone_type) values ('cell');
insert into phone_purpose_table (phone_type) values ('work');
insert into phone_purpose_table (phone_type) values ('home');

drop table phone_table;
-- add phone table
create table phone_table (
    student_id number,
    phone varchar2(10) not null,
    phone_purpose char(4) not null,
    primary key (student_id, phone_purpose),
    foreign key (phone_purpose) references phone_purpose_table(phone_type),
    foreign key (student_id) references student(student_id)
);

-- insert new entry for mary and her phone
insert into phone_table (student_id, phone, phone_purpose)
values ((select student_id from student where name = 'Mary'),'1234567890','cell');

insert into phone_table (student_id, phone, phone_purpose)
values ((select student_id from student where name = 'Mary'),'0987654321','work');

select * from phone_table;

insert into phone_table (student_id, phone, phone_purpose)
values ((select student_id from student where name = 'Mary'),'0987654321','mobl');

select * from phone_table;
