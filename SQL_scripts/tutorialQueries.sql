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

SELECT CUSTOMER_NAME, CITY, BALANCE FROM customer 
WHERE CITY = 'Fullton' AND BALANCE > 1000;

SELECT CUSTOMER_NAME, CITY, BALANCE FROM customer 
WHERE CITY = 'Fullton' OR BALANCE > 1000;


