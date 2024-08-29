-- create sequence
CREATE SEQUENCE TESTSEQ
START WITH 1
INCREMENT BY 1
NOCACHE;
-- create customer rep table
CREATE TABLE cust_rep AS
SELECT TESTSEQ.NEXTVAL AS RepID, customer_name, rep.last_name
FROM customer, rep
WHERE rep.rep_num = customer.rep_num;
-- display cust_rep table
select * from cust_rep;

