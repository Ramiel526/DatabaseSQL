-- Q2 create club table
DROP TABLE CLUB;
CREATE TABLE CLUB (
    club_id NUMBER PRIMARY KEY,
    club_name VARCHAR2(20) not null
);

-- drop sequence
drop sequence club_id_seq;

-- generate sequence for club ID
CREATE SEQUENCE club_id_seq
START WITH 1
INCREMENT BY 1;

-- insert new rows for hiking, running and tennis
INSERT INTO CLUB (club_id, club_name)
VALUES (club_id_seq.nextval, 'HIKING');

INSERT INTO CLUB (club_id, club_name)
VALUES (club_id_seq.nextval, 'RUNNING');

INSERT INTO CLUB (club_id, club_name)
VALUES (club_id_seq.nextval, 'TENNIS');

-- test primary key and "NULL" values
INSERT INTO CLUB (club_id, club_name)
VALUES (1,'HIKING');

-- check output
select * from club;
insert into club (club_id, club_name) values (5, '');

-- check output
select * from club;
