-- create student table
-- number 
-- varchar
-- date
DROP TABLE STUDENT;
-- Create student talbe
CREATE TABLE student (
    student_id NUMBER PRIMARY KEY,
    name VARCHAR2(20) NOT NULL,
    dob DATE NOT NULL
);

-- Drop the sequence
DROP SEQUENCE student_id_seq;

-- create sequence for student ID 
CREATE SEQUENCE student_id_seq
START WITH 1
INCREMENT BY 1;

-- load table with student information 
-- Mary 
INSERT INTO STUDENT ( 
    STUDENT_ID,
    NAME,
    DOB) 

VALUES (student_id_seq.nextval, 'Mary', '03-SEP-2024');

-- update new student Jane 
INSERT INTO STUDENT ( 
    STUDENT_ID,
    NAME,
    DOB) 

VALUES (student_id_seq.nextval, 'Jane', '01-SEP-2024');

select * from student;

-- test null values
INSERT INTO STUDENT (
    STUDENT_ID,
    NAME,
    DOB) 
VALUES ('', '', '');

-- Show table
select * from student;

-- test primary key values
INSERT INTO STUDENT (
    STUDENT_ID,
    NAME,
    DOB) 
VALUES (1, 'Michael', '30-AUG-2024');

-- Show table
select * from student;

