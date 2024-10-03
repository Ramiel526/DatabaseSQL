## check foriegn key constraints

```SQL
-- Step 1: Add Foreign Key constraints for club_roster and student_roster

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

-- Step 2: Add Check constraint to phone_purpose for valid phone types
ALTER TABLE phone_purpose
ADD CONSTRAINT chk_phone_type CHECK (PHONE_TYPE IN ('cell', 'home', 'work'));

-- Step 3: Test the inserts and deletes

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

```

## Outputs of constraint checking

```
table CLUB_ROSTER altered.
table STUDENT_ROSTER altered.
    ID_NUM STUDENT_NAME              STUDENT_ALIAS_NAME DATEOFBIRTH
---------- ------------------------- ------------------ -----------
         1 John                                         07-SEP-00
         2 Jane                                         09-FEB-95
         3 Mary                                         01-JAN-02

no rows selected


table PHONE_PURPOSE altered.
1 rows inserted.
1 rows inserted.
1 rows inserted.

Error starting at line : 31 in command -
INSERT INTO club_roster (DATE_JOINED, STUDENT_ID_NUM, NAME_OF_CLUB) VALUES (SYSDATE, 999, 'climbing')
Error report -
SQL Error: ORA-02291: integrity constraint (STUDENT.FK_STUDENT) violated - parent key not found
02291. 00000 - "integrity constraint (%s.%s) violated - parent key not found"
*Cause:    A foreign key value has no matching primary key value.
*Action:   Delete the foreign key or add a matching primary key.
1 rows deleted.
    ID_NUM STUDENT_NAME              STUDENT_ALIAS_NAME DATEOFBIRTH
---------- ------------------------- ------------------ -----------
         1 John                                         07-SEP-00
         2 Jane                                         09-FEB-95
         3 Mary                                         01-JAN-02

no rows selected
```
