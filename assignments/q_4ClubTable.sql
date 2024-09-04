-- Q4 cont.
-- wrangle data
-- Drop the table if it exists
drop table club_activity_log;

-- Create a table to store start and end times of activities
create table club_activity_log (
    student_id number,
    start_time timestamp,
    end_time timestamp,
    foreign key (student_id) references student(student_id)
);

-- Insert example activity logs
insert into club_activity_log (student_id, start_time, end_time)
values (
    (select student_id from student where name = 'Mary'),
    to_timestamp('2024-09-04 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    to_timestamp('2024-09-04 11:30:00', 'YYYY-MM-DD HH24:MI:SS')
);

insert into club_activity_log (student_id, start_time, end_time)
values (
    (select student_id from student where name = 'Jane'),
    to_timestamp('2024-09-04 09:45:00', 'YYYY-MM-DD HH24:MI:SS'),
    to_timestamp('2024-09-04 10:45:00', 'YYYY-MM-DD HH24:MI:SS')
);

-- Query to calculate time in minutes from start and end times
select student_id, 
       EXTRACT(HOUR FROM (end_time - start_time)) * 60 
       + EXTRACT(MINUTE FROM (end_time - start_time)) AS time_in_minutes
from club_activity_log;

-- create a table called club_time_spent 
drop table club_time_spent;

-- cols are student_id and time_in_minutes
create table club_time_spent( 
    time_in_minutes number not null,
    student_id number,
primary key (time_in_minutes, student_id),
foreign key (student_id) references student(student_id));


-- Insert calculated time into the club_time_spent table
insert into club_time_spent (time_in_minutes, student_id)
select 
    EXTRACT(HOUR FROM (end_time - start_time)) * 60 
    + EXTRACT(MINUTE FROM (end_time - start_time)) AS time_in_minutes,
    student_id
from club_activity_log;

