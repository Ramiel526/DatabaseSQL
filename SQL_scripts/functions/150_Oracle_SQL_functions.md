## NUMERIC

> numeric functions are `ROUND()` `TRUNC()`

```SQL
SELECT item_name, price, ROUND(price, 0) AS rounded_price
FROM item;

SELECT item_name, price, TRUNC(price, 1) AS truncated_price
FROM item;
```

## CHARACTER

> character functions are `UPPER()`

```SQL
SELECT UPPER(customer_name) AS customer_name_upper
FROM customer;
```

## DATE_TIME

> Date functions include `MONTH`

```SQL
SELECT item_name, catalog_date
FROM item
WHERE EXTRACT(MONTH FROM catalog_date) IN (6, 7, 8);
```

## CONVERSION

> Conversion types will format data types

```SQL
SELECT
    TO_CHAR(ORDERNUMBER) AS order_number,   -- Convert ORDERNUMBER to string
    TO_CHAR(SKU) AS sku,                    -- Convert SKU to string
    TO_NUMBER(QUANTITY) AS quantity,        -- Keep QUANTITY as a number (integer)
    TO_NUMBER(PRICE, '9999.99') AS price,   -- Convert PRICE to a floating-point number
    TO_NUMBER(EXTENDEDPRICE, '9999.99') AS extended_price -- Convert EXTENDEDPRICE to a floating-point number
FROM
    orders_item;  -- Replace 'orders' with your actual table name
```

## AGGREGATE

> `sum()`, `avg()`, `count()`
```SQL
-- 1. SUM(): Returns the sum of a set of values
SELECT SUM(salary) AS total_salary FROM rep;

-- 2. AVG(): Returns the average value of a set of values
SELECT AVG(salary) AS average_salary FROM rep;

-- 3. COUNT(): Returns the number of rows
SELECT COUNT(*) AS num_rows FROM customer;
```
