-- SQL views

/*
CREATE OR REPLACE VIEW customer_credit_limit AS
SELECT customer.customer_name, customer.credit_limit FROM customer;
select * from customer_credit_limit;
drop view customer_credit_limit;
*/

create or replace view student_nickname as
select student.student name from student;

select * from
