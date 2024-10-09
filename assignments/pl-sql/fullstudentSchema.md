## Drop tables / Create tables

```SQL
drop table student cascade constraints;
drop table address_history cascade constraints;
drop table student_history cascade constraints;


-- Create student table
create table student (
	student_id number not null primary key,
	student_name varchar2(70) not null,
	dob date not null
	);


-- Create tables for address history and student history
create table address_history (
    history_id number primary key,
    student_id number,
    old_address varchar2(250),
    DateOfChange date default sysdate,
foreign key (student_id) references student(student_id) on delete cascade
);


-- Create history of student log
create table student_history (
	record_id_history number primary key,
	student_id number,
	student_name varchar2(70),
	dob date,
foreign key (student_id) references student(student_id) on delete cascade
);
```
## Output of create table

|TABLE_NAME                   |
|-----------------------------|
|ADDRESS_HISTORY              |
|STUDENT                      |
|STUDENT_HISTORY              |

`describe student`

|Name        | Null     | Type        |
|------------|----------| ------------|
|STUDENT_ID  | NOT NULL | NUMBER      |
|STUDENT_NAME| NOT NULL | VARCHAR2(70)|
|DOB         | NOT NULL | DATE        |

`describe student_history`

|Name             |  Null   |  Type       |
|-----------------| --------| ------------|
|RECORD_ID_HISTORY| NOT NULL| NUMBER      |
|STUDENT_ID       |         | NUMBER      |
|STUDENT_NAME     |         | VARCHAR2(70)|
|DOB              |         | DATE        |

`describe ADDRESS_HISTORY`

|Name        | Null    | Type         |
|------------| --------| -------------|
|HISTORY_ID  | NOT NULL| NUMBER       |
|STUDENT_ID  |         | NUMBER       |
|OLD_ADDRESS |         | VARCHAR2(250)|
|DATEOFCHANGE|         | DATE         |

```
no rows selected

no rows selected

no rows selected

```
## alter scripts

```SQL
-- Alter table add nickname and address columns
alter table student add (
	nickname varchar2(70),
	address varchar2(250)
);
```

## Alter table output

![Running Alter Script](C:\dev\sqlDev\assignments\pl-sql\atlerSuccess.png)

---

![Student Table NEW](C:\dev\sqlDev\assignments\pl-sql\viewNewStudentTable.png)

## Triggers scripts
```SQL

-- TRIGGER for change of address
create or replace trigger address_update
before update of address on student
for each row
begin
	insert into address_history (student_id, old_address, DateOfChange)
	values (:old.student_id, :old.address, sysdate);
end;
/

-- deletion of student record
create or replace trigger student_history
before delete on student for each row
begin
	insert into student_history (student_id, student_name, dob)
	values (:old.student_id, :old.student_name, :old.dob);
end;
/
```

## Output

![Compiler Output](C:\dev\sqlDev\assignments\pl-sql\compiler-out.png)

