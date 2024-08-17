-- Select all customers
SELECT * FROM customer;

-- Select specific columns from the customer table
SELECT CUSTOMER_NAME, CITY, BALANCE FROM customer;

--  select w/ DISTINCT Clause select uniqure cities from the customer table
SELECT DISTINCT CITY FROM customer;

-- return the customers in the city of fullton
SELECT CUSTOMER_NAME, CITY, BALANCE FROM customer WHERE CITY = 'Fullton';

-- add the <> 'not' character return queries not in fullton
SELECT CUSTOMER_NAME, CITY, BALANCE FROM customer WHERE CITY <> 'Fullton';

-- filtering data w/ WHERE on date and number columns
-- query 6 
--single column
SELECT ORDER_NUM, ORDER_DATE, CUSTOMER_NUM FROM orders ORDER BY ORDER_DATE ASC;

--multi column
SELECT ORDER_NUM, ORDER_DATE, CUSTOMER_NUM FROM orders ORDER BY ORDER_DATE DESC, ORDER_NUM ASC;

-- Sort orders by date in ascending order
SELECT ORDER_NUM, ORDER_DATE, CUSTOMER_NUM FROM orders ORDER BY ORDER_DATE ASC;

-- Sort orders by date in descending order and then by order number in ascending order
SELECT ORDER_NUM, ORDER_DATE, CUSTOMER_NUM FROM orders ORDER BY ORDER_DATE DESC, ORDER_NUM ASC;
-- 'and' & 'or' operators are used sql to combine multiple conditions in a 'where' clause
-- and requires all conditions while or requries at least one. 
SELECT CUSTOMER_NAME, CITY, BALANCE FROM customer WHERE CITY = 'Fullton' AND BALANCE > 1000;
SELECT CUSTOMER_NAME, CITY, BALANCE FROM customer WHERE CITY = 'Fullton' OR BALANCE > 1000;

-- using WHERE with IN and BETWEEN clauses
-- 'IN' allows you to specify multiple values in a 'WHERE' clause
-- 'BETWEEN' allows you to filter the result set within a range of values
-- Select customers in Fullton or Mesa
SELECT CUSTOMER_NAME, CITY, BALANCE FROM customer WHERE CITY IN ('Fullton', 'Mesa');

-- Select customers with a balance between 1000 and 3000
SELECT CUSTOMER_NAME, BALANCE FROM customer WHERE BALANCE BETWEEN 1000 AND 3000;

-- Select customers with a balance not between 1000 and 3000
SELECT CUSTOMER_NAME, BALANCE FROM customer WHERE BALANCE NOT BETWEEN 1000 AND 3000;

-- 'LIKE' operator used for pattern matching. Wildcards  '%' and '_' LIKE used for flexible conditions
-- single character wildcard
SELECT CUSTOMER_NAME, CITY FROM customer WHERE CITY LIKE 'C_ngaree';

--multi char wildcards
SELECT CUSTOMER_NAME, CITY FROM customer WHERE CUSTOMER_NAME LIKE '%Shop%';

--my experiment 
select customer_name, city from customer where city like '%field%';

-- Null
-- Find customers with a NULL balance
SELECT CUSTOMER_NAME, CITY, BALANCE FROM customer WHERE BALANCE IS NULL;

-- Select customers with a balance greater than the average balance
SELECT CUSTOMER_NAME, BALANCE FROM customer WHERE BALANCE > (SELECT AVG(BALANCE) FROM customer);

