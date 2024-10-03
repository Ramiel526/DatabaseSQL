-- create view 
/*
View must have 
FROM -> TO
order by DOB of from 
date is a col not string
DOB is date format MM-DD-YYYY

phone nubmer is XXX-XXX-XXXX
*/

-- `CREATE OR REPLACE` **updates or modifies** an existing view without needing to first `drop`

create or replace student_message_view as
select 
    student_message_table.message_from,
    student_message_table.message_to,
    student_message_table.message,
from student_message_table;


-- This view selects the name from the student table where the student_id matches message_from and message_to in the student_message_table.

create or replace view student_message_view as
select
    (select name from student where student.student_id = student_message_table.message_from) as MessageFROM,
    (select name from student where student.student_id = student_message_table.message_to) as MessageTO,
    student_message_table.message
from student_message_table;


-- adding dob to the view. 

create or replace view student_message_view as
select

    (select name from student where student.student_id = student_message_table.message_from) as sender, 
    (select dob from student where student.id = student_message_table.message_from) as senderDoB, 
    (select phone_number from student where student.student_id = student_message_table.message_to) as fromNumber, 


    (select name from student where student.student_id = student_message_table.message_to) as recipient, 
    (select dob from student where student.id = student_message_table.message_to) as recieverDoB, 
    (select phone_number from student where student.student_id = student_message_table.message_to) as toNumber,

    student_message_table.message
from student_message_table;


/*CREATE VIEW student_message_view AS
SELECT 
FROM student_message_table as from

WHERE condition;

select * from student message view
*/
