# Header 1
# Notes for ref 3060 assignments
---
## SQL and CapeCodd schema
*sql scripts*
The WHERE clause allows you to filter records in a table based on specified conditions.
You can use operators like = (equals) and <> (not equals) to compare values in a column.
Filtering by specific criteria helps you narrow down the data you work with, making it easier to focus on relevant information.
- sorting data

Key Takeaways for Sorting Data

    - The ORDER BY clause allows you to control the presentation of your query results.
    - Sorting can be done on one or more columns, and you can specify whether you want the results in ascending (ASC) or descending (DESC) order.

    - Sorting data is particularly useful when you need to analyze trends over time or prioritize certain records.
---
### Summary of Key Takeaways and Covered Subsections
1. Basic SQL Queries

    SELECT Statement:
        The SELECT statement is used to retrieve data from a database.
        The SELECT * FROM table_name; retrieves all columns and rows from a specified table.
        Specifying columns: SELECT column1, column2 FROM table_name; retrieves only specific columns.

2. Filtering Data with WHERE

    WHERE Clause:
        The WHERE clause filters records based on specific conditions.
        Example: SELECT * FROM table_name WHERE column = value;

3. Sorting Data with ORDER BY

    ORDER BY Clause:
        Used to sort the results of a query in ascending (ASC) or descending (DESC) order.
        You can sort by one or multiple columns.
        Example: SELECT * FROM table_name ORDER BY column1 ASC, column2 DESC;

4. Combining Conditions with AND/OR

    AND Operator:
        Requires all conditions to be true.
        Example: ```SQL SELECT * FROM table_name WHERE column1 = value1 AND column2 > value2; ```
    OR Operator:
        Requires at least one condition to be true.
        Example: SELECT * FROM table_name WHERE column1 = value1 OR column2 > value2;

5. Filtering with IN and BETWEEN

    IN Operator:
        Used to filter results based on a list of values.
        Simplifies queries that would otherwise require multiple OR conditions.
        Example: SELECT * FROM table_name WHERE column IN (value1, value2, value3);
    BETWEEN Operator:
        Filters results within a specific range.
        Works with numeric, text, and date data types.
        Example: SELECT * FROM table_name WHERE column BETWEEN value1 AND value2;
    NOT BETWEEN Operator:
        Filters out results that fall within the specified range.
        Example: SELECT * FROM table_name WHERE column NOT BETWEEN value1 AND value2;
---
##### Notes from software class
> 2^10 == 1024 ~= 10^3 
> 2^32 == 2^2 * (10^3)^3
>               10^9
---
