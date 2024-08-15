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
