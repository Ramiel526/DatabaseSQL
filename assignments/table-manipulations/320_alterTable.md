## alter tables

```SQL
-- Step 1: Modify student_roster and student tables by adding/renaming columns

-- Add a column 'Phone_Number' to student_roster
ALTER TABLE student_roster
ADD Phone_Number VARCHAR2(15);

-- Rename 'STUDENT_ALIAS_NAME' to 'Nickname'
ALTER TABLE student_roster
RENAME COLUMN STUDENT_ALIAS_NAME TO Nickname;

-- Add a column 'Email' to student table
ALTER TABLE student
ADD Email VARCHAR2(50);

-- Modify 'NAME' column in student to increase size
ALTER TABLE student
MODIFY NAME VARCHAR2(40);

-- Verify changes using DESCRIBE
DESCRIBE student;
DESCRIBE student_roster;
```

## Output from SQL

```
table STUDENT_ROSTER altered.
table STUDENT_ROSTER altered.
table STUDENT altered.
table STUDENT altered.
DESCRIBE student
Name       Null     Type
---------- -------- ------------
STUDENT_ID NOT NULL NUMBER
NAME       NOT NULL VARCHAR2(40)
DOB        NOT NULL DATE
EMAIL               VARCHAR2(50)

DESCRIBE student_roster
Name         Null     Type
------------ -------- ------------
ID_NUM       NOT NULL NUMBER(38)
STUDENT_NAME NOT NULL VARCHAR2(25)
NICKNAME              CHAR(10)
DATEOFBIRTH  NOT NULL DATE
PHONE_NUMBER          VARCHAR2(15)
```
