-- Q4
-- create messages table
drop table messages;

-- messages_from and message_to foreign keys in the student table
create table messages ( 
    message_id number primary key,
    message_from number not null,
    message_to number not null,
    message varchar2(50) not null,  -- messages cannot be 'NULL'

-- message from and to are student_ids
foreign key (message_from) references student(student_id), 
foreign key (message_to) references student(student_id));

-- Create a sequence for message_id
create sequence message_id_seq
start with 1
increment by 1;

-- Test message Mary to Jane is "hello"
insert into messages (message_id, message_from, message_to, message)
values (message_id_seq.nextval, 
        (select student_id from STUDENT where name = 'Mary'), 
        (select student_id from STUDENT where name = 'Jane'),
        'Hello');

-- show output 
select * from messages;

-- Test foreign key constraint 
-- (non-existent student_id 999 for message_from)
insert into messages (message_id, message_from, message_to, message)
values (message_id_seq.nextval, 
        (select student_id from STUDENT where student_id = 999), 
        (select student_id from STUDENT where student_id = 1),
        'Hello');

-- Test NULL constraint
insert into messages (message_id, message_from, message_to, message)
values (message_id_seq.nextval, 
        (select student_id from STUDENT where name = 'Mary'), 
        (select student_id from STUDENT where name = 'Jane'),
        NULL);

-- show output
select * from messages;

-- create a table called club_time_spent 
drop table club_time_spent;

-- cols are student_id and time_in_minutes
create table club_time_spent(

foreign key (student_id) references student(student_id));

