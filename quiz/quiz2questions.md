##### Q1:
```SQL
-- drop sequence if exists id_seq;
drop sequence id_seq;

create sequence id_seq
	start with 1
	increment by 1
	nocache;

drop table student_roster;
-- drop table if exists student_roster;

create table student_roster (
	id_num int primary key,
	student_name varchar2(25) not null,
	dateofbirth date not null
);

insert into student_roster (
	id_num,
	student_name,
	dateofbirth
	)

select id_seq.nextval, name, dob
from quiz2data
where dob is not null;

drop table if exists phone_purpose;
create table phone_purpose (
	phone_type varchar(4) not null primary key
);
insert into phone_purpose (phone_type) values ('cell');
insert into phone_purpose (phone_type) values ('work');
insert into phone_purpose (phone_type) values ('home');

create table club_titles (
	club_name varchar2(50) not null primary key
);
insert into club_titles (club_name) values ('hiking');
insert into club_titles (club_name) values ('Tennis');
insert into club_titles (club_name) values ('Running');

-- club roster
/*drop table if exists club_roster;*/

drop table club_roster;
create table club_roster (
	date_joined timestamp not null,
	student_id_num int not null,
	name_of_club varchar2(15) not null,
-- primary key defined
	constraint pk_club_roster primary key (date_joined, student_id_num, name_of_club),
-- foreign keys defined
	foreign key (name_of_club) references club_titles(club_name),
	foreign key (student_id_num) references student_roster(id_num)
);

/* ??? DEBUG ???

select club
from quiz2data
where club is not null;

 ??? DEBUG ??? */

INSERT INTO club_roster (date_joined, student_id_num, name_of_club)
SELECT
    CURRENT_TIMESTAMP,  -- Using the current timestamp as the date_joined
    sr.id_num,          -- Fetching the student ID from student_roster
    q.club              -- Fetching the club name from quiz2data
FROM
    quiz2data q
JOIN
    student_roster sr
ON
    q.name = sr.student_name
WHERE
    q.club IS NOT NULL;

/* *** Table create before use ***
--create change logs
create table club_roster_log (
    date_joined timestamp,
    student_id_num int,
    log_club_name varchar2(15)
);

create table student_roster_log (
    id_num int,
    old_name varchar(25),
    new_name varchar(25),
    update_date timestamp
);
*/
create or replace trigger club_roster_update
before update on club_roster
for each row
begin
	insert into club_roster_log (date_joined, student_id_num, name_of_club)
  values (:OLD.date_joined, :OLD.student_id_num, :OLD.name_of_club);
end;

create or replace trigger student_roster_update
before update on student_roster
for each row
begin
	insert into student_roster_log (id_num, old_name, new_name, update_date)
	values (:OLD.id_num, :OLD.student_name, :New.student_name, SYSDATE);
end;

drop sequence msg_id_seq;

create sequence msg_id_seq
    start with 1
    increment by 1
    nocache;

drop table message_log;

create table message_log (
    msg_id int primary key,
    msg_to int not null,
    msg_from int not null
,
    message_body VARCHAR2(50),
    FOREIGN KEY (msg_to) REFERENCES student_roster(id_num),
    FOREIGN KEY (msg_from) REFERENCES student_roster(id_num)
);

INSERT INTO message_log (msg_id, msg_to, msg_from, message_body)
SELECT
    msg_id_seq.nextval,       -- Use the sequence for the msg_id
    sr_to.id_num AS msg_to,   -- Insert the "to" student ID
    sr_from.id_num AS msg_from, -- Insert the "from" student ID
    qd.message AS message_body -- Insert the message content
FROM
    quiz2data qd
JOIN
    student_roster sr_to
    ON qd.message_to = sr_to.student_name
JOIN
    student_roster sr_from
    ON qd.name = sr_from.student_name
WHERE
    qd.message IS NOT NULL;
/* insert into message_log (
	msg_id,
	msg_to,
	msg_from,
	message_body
	)

select msg_id_seq.nextval, name, dob
from quiz2data
where dob is not null;
*/

```
##### Q2:
`see pdf diagram uploaded`
##### Q3:

##### Q4:

**Answer the following briefly and to the point. (30)**

a) What is the purpose of the web.xml file for running a Java servlet ?

- `web.xml` is for configuring and running Java servlets in a web container

b) If the HelloNPSServlet sends text instead of HTML5 back to the browser, will it be displayed ?

- **Yes** but not in HTML format the browser will attempt to render as plain text if the html syntax is not used.

c) If HelloServletDB connects to a 2nd database with a different account/password and schema, what code changes are needed, explain (no coding/testing needed).

- For a second connection to be make the java code would have to include the login credentials for the subsequent database connection.

d) Can you use Java in command  prompt to run the Servlet class file, explain ?

- no like in `question 1.)` the `web.xml` is configures the code, the servlet will need to run on the apache tomcat instance no on the machine terminal or shell.

e) If there is a bug in the HTML how would one debug it on the client side ?

- using the dev tops in the browser interface will allow you to inspect the html for bugs.

f) Where does HelloServletDB find the driver file ?

- `'apache-tomcat\apache-tomcat-6.0.28\webapps\web-inf\lib'`

g) How many network ports are used for each of the following, HelloNPSServlet and HelloServletDB

- One

h) What are different ways for a developer to see the output of the Servlet ?

- tomcat logs

- using powershell or curl

i) In AskTheServer.html what is purpose of the code "req.onreadystatechange = handleServerResponse;"

- Ensures function is executed when the server req values change.

j) Why does SubmitQuery need to use the ResultSet Metadata ?

- to retrieve column infomation from the database metadata when column names are unknown or not part of the table data.

##### Q5:

*https://cle.nps.edu/access/content/attachment/930f68cd-11e3-47b3-a81e-f05e71d8bed5/Assignments/de55f006-f941-4477-9cf6-bd7ba366d8e6/Quiz2.txt*Answer briefly, no coding/testing needed (20).**

   a) In BruteForceDB.java how do you test passwords of length 9, specifically what code change is needed ?
```Java
    BruteForce bf = new BruteForce(charset, 9);
```

   b) In BruteForceDB, if you want to include uppercase letters and numbers, how do you do it ?

```Java
char[] charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
```

c)  In the wordsSelectorDB.java there is the following line of code. Why is the Java code commented out ?

       //String words = br.readLine(); *Fix by BT, AY22Q2

- potentially notes from the dev. annotating bug and fix in the code.

d) In the rockyou.txt file does it matter if the chosen password is located at the bottom of the file, explain ?

- It will take longer to find during brute force because the program sequentially from top to bottom. This means the cracking process will only find it after attempting all previous passwords.

e) The oraclehash Python programs works with the Oracle XE 11G, if one were to upgrade to a higher version of the Oracle DB will the same password hash algorithms work ? Explain.

- no because oracle would change the interface between python oracle sqldeveloper.

##### Q6: MapReduce Steps for Hadoop

1. Input:

> Divide into across four compute nodes to decrease the work per compute node.

2. Map Phase:

> Input keys are the positions of the characters, and the values are the characters themselves.

> Each character is mapped to a count of 1 (e.g., A -> 1, B -> 1).

3. Shuffle and Sort:

> Data is shuffled such that all identical keys are moved to the same reducer. In this case, all identical characters are grouped together.

4. Reduce Phase:

> Each reducer sums up the counts for each character.
