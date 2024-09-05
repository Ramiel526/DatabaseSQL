--Q5 
--student id, phone_num, phone_purpose(
-- purpose is either cell, work, or home

drop phone_purpose_table
create phone_purpose_table ( 
phone_type char(4));

-- Insert allowed phone purposes into phone_purpose_table
insert into phone_purpose_table (phone_type) values ('cell');
insert into phone_purpose_table (phone_type) values ('work');
insert into phone_purpose_table (phone_type) values ('home');

drop phone_table

create table phone_table (
student_id number primary key,
phone varchar2(10) not null,
phone_purpose char(4), 
foreign key (phone_purpose) references phone_purpose_table(phone_type),
foreign key (student_id) references student(student_id));

insert into phone_table (student_id, phone, phone_purpose)
values (
    (select student_id from student where name = 'Mary'), 
    '1234567890', 
