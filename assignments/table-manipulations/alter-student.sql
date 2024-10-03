-- Add Foreign Key constraints for club_roster and student_roster

-- Foreign key between club_roster and student (club_roster references student)
ALTER TABLE club_roster
ADD CONSTRAINT fk_club_roster_student FOREIGN KEY (STUDENT_ID_NUM)
REFERENCES student(STUDENT_ID)
ON DELETE CASCADE;

-- Foreign key between student_roster and student
ALTER TABLE student_roster
ADD CONSTRAINT fk_student_roster_student FOREIGN KEY (ID_NUM)
REFERENCES student(STUDENT_ID)
ON DELETE CASCADE;

-- Check Tables
SELECT * FROM student_roster;
SELECT * FROM club_roster;

-- Add Check constraint to phone_purpose for valid phone types
ALTER TABLE phone_purpose
ADD CONSTRAINT chk_phone_type CHECK (PHONE_TYPE IN ('cell', 'home', 'work'));

-- Test the inserts and deletes

-- Inserting valid data in student_roster, club_roster, and student
INSERT INTO student (STUDENT_ID, NAME, DOB) VALUES (4, 'Alice', TO_DATE('05-SEP-99', 'DD-MON-YY'));
INSERT INTO student_roster (ID_NUM, STUDENT_NAME, DATEOFBIRTH) VALUES (4, 'Alice', TO_DATE('05-SEP-99', 'DD-MON-YY'));
INSERT INTO club_roster (DATE_JOINED, STUDENT_ID_NUM, NAME_OF_CLUB) VALUES (SYSDATE, 4, 'chess');

-- Inserting invalid data that violates foreign key
INSERT INTO club_roster (DATE_JOINED, STUDENT_ID_NUM, NAME_OF_CLUB) VALUES (SYSDATE, 999, 'climbing'); -- This should fail as Student_ID 999 doesn't exist

-- Test deleting a student and see if it cascades to student_roster and club_roster
DELETE FROM student WHERE STUDENT_ID = 4;

-- Check if the records in club_roster and student_roster are also deleted
SELECT * FROM student_roster;
SELECT * FROM club_roster;

