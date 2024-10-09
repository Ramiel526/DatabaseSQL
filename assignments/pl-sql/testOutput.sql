-- insert and delete rows to test triggers

-- Insert a new student
insert into student (student_id, student_name, dob)
values (1, 'John Doe', TO_DATE('2000-01-01', 'YYYY-MM-DD'));


-- Update the address
UPDATE student
SET address = '123 Old Street'
WHERE student_id = 1;


-- Update the address again to trigger history capture
UPDATE student
SET address = '456 New Street'
WHERE student_id = 1;


-- Verify the old address has been inserted into the address_history table
SELECT * FROM address_history
WHERE student_id = 1;


-- Delete the student (this will trigger the student_history trigger)
DELETE FROM student
WHERE student_id = 1;


-- Verify that the student record has been inserted into the student_history table
SELECT * FROM student_history
WHERE student_id = 1;

