# Advanced SQL topics
---
## Join
> JOIN operations, which are used to combine rows from two or more tables based on related columns.


### Inner Join 
- combines rows from two tables where join condition is met
- only returns rows where match in both tables
Ex.
---
```SQL
select customer_name, first name from customer inner join rep on customer.rep_num = rep.rep_num;
```
### Left Outer Join
- ret all rows from hte left table 
- if no match result is 'NULL' on the side of the right table

Ex.
---
```SQL
SELECT customer_name, first_name 
FROM customer
LEFT OUTER JOIN rep ON customer.rep_num = rep.rep_num;
```

### Right Outer Join
- ret all rows from the right table matched to the rows from left table
- if no match result is 'NULL' on the side of the right table

Ex.
---
```SQL
SELECT customer_name, first_name 
FROM customer
RIGHT OUTER JOIN rep ON customer.rep_num = rep.rep_num;
```

### Full Outer Join
- rets all rows when there is a match in one of the tables 
- if no match result is 'NULL' on the side of the right table

Ex.
---
```SQL
SELECT customer_name, first_name 
FROM customer
FULL OUTER JOIN rep ON customer.rep_num = rep.rep_num;
```

### Self Join
- regular join but the table is joined with itself.

Ex.
---
```SQL
SELECT t1.customer_name AS t1_cus, t2.customer_name AS t2_cus, t1.city
FROM customer t1, customer t2
WHERE t1.customer_num < t2.customer_num AND t1.city = t2.city
ORDER BY t1.city;
```

---
## Join vs Group

