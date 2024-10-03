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

