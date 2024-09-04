-- create messages table
drop table messages;

-- messages_from and message_to foreign keys in the student table
create table messages (

    student_number number primary key,
    student_name varchar2(20),
    message_from number not null,
    message_to number not null,
    message varchar2(50) not null,  -- messages cannot be 'NULL'

-- message from and to are student_ids
foreign key (message_from) references student(student_id), 
foreign key (message_to) references student(student_id));

-- ex message mary to jane is "hello"
-- inner  join 
-- where

-- create a table called club_time_spent 
drop table phone;

-- cols are student_id and time_in_minutes
create table phone (

student_id number primary key,
time number, 

foreign key (student_id) references student(student_id));

