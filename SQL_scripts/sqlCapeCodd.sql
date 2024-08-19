-- HI ASHLEY !! 
SELECT * FROM catalog_sku_2013;
select * from inventory;
select * from order_item;
select * from retail_order;
select * from sku_data;
select * from warehouse;

SELECT sku_description, department FROM catalog_sku_2013;

--Filter Unique Values: By using DISTINCT, the query filters out any duplicate department names, so each department name will appear only once in the result set.
SELECT DISTINCT department FROM catalog_sku_2013;
SELECT sku_description sku_desc, department dept FROM catalog_sku_2013 WHERE dateonwebsite = '01-Jan-13';
SELECT sku_description, department FROM catalog_sku_2013 WHERE dateonwebsite <> '01-Jan-13';

-- filtering data w/ WHERE on date and number columns
--single column
--SELECT ORDER_NUM, ORDER_DATE, CUSTOMER_NUM FROM orders ORDER BY ORDER_DATE ASC;
select sku, quantity from order_item order by extendedprice;

--multi column
--SELECT ORDER_NUM, ORDER_DATE, CUSTOMER_NUM FROM orders ORDER BY ORDER_DATE DESC, ORDER_NUM ASC;
SELECT * FROM order_item ORDER BY quantityonhand, quantityonorder;
-- Sort orders by date in ascending order
--SELECT ORDER_NUM, ORDER_DATE, CUSTOMER_NUM FROM orders ORDER BY ORDER_DATE ASC;
SELECT sku_description as sku_desc, quantityonhand in_stock, quantityonorder ordered FROM inventory ORDER BY quantityonorder ASC;

-- Sort orders by date in descending order and then by order number in ascending order
--SELECT ORDER_NUM, ORDER_DATE, CUSTOMER_NUM FROM orders ORDER BY ORDER_DATE DESC, ORDER_NUM ASC;
SELECT sku_description as sku_desc FROM inventory ORDER BY quantityonorder desc, warehouseid ASC;
-- 'and' & 'or' operators are used sql to combine multiple conditions in a 'where' clause
-- and requires all conditions while or requries at least one. 
SELECT sku_description, quantityonhand, quantityonorder FROM inventory WHERE  quantityonhand= 0 AND quantityonorder <> 0;
SELECT sku_description, quantityonhand, quantityonorder FROM inventory WHERE  quantityonhand <> 0 AND quantityonorder = 0;
SELECT sku_description, quantityonhand, quantityonorder FROM inventory WHERE  quantityonhand = 0 or quantityonorder = 0;

-- using WHERE with IN and BETWEEN clauses
-- 'IN' allows you to specify multiple values in a 'WHERE' clause
-- 'BETWEEN' allows you to filter the result set within a range of values
-- Select customers in Fullton or Mesa

SELECT sku_description, department, dateonwebsite from catalog_sku_2015 where dateonwebsite between '01-feb-2015' and '01-dec-2015';

SELECT sku_description, department, dateonwebsite from catalog_sku_2015 where dateonwebsite not between '01-feb-2015' and '01-dec-2015';

-- 'LIKE' operator used for pattern matching. Wildcards  '%' and '_' LIKE used for flexible conditions
-- single character wildcard
--SELECT CUSTOMER_NAME, CITY FROM customer WHERE CITY LIKE 'C_ngaree';
SELECT * FROM warehouse where warehousecity LIKE '_tlanta';

--multi char wildcards
SELECT * FROM inventory where sku_description LIKE '%tank%';

-- Null
-- Find customers with a NULL balance
SELECT * FROM catalog_sku_2015 WHERE catalogpage IS NULL;

-- Select customers with a balance greater than the average balance
SELECT * FROM order_item WHERE quantity > (SELECT AVG(quantity) FROM order_item);

