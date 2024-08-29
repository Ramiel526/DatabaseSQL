### SQL script

```SQL
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
```
### Output
>sequence TESTSEQ created.
>table CUST_REP created.


>| REPID | CUSTOMER_NAME               | LAST_NAME |
>|:-----:|:---------------------------:|:---------:|
>|   1   | Toys Galore                 | Campos    |
>|   2   | Brookings Direct            | Gradey    |
>|   3   | The Everything Shop         | Tian      |
>|   4   | Johnson’s Department Store  | Gradey    |
>|   5   | Grove Historical Museum Str | Tian      |
>|   6   | Cards and More              | Campos    |
>|   7   | Almondton General Store     | Tian      |
>|   8   | Cricket Gift Shop           | Gradey    |
>|   9   | Cress Store                 | Campos    |
>|  10   | Unique Gifts                | Tian      |
>|  11   | Kline’s                     | Gradey    |
>|  12   | All Season Gifts            | Campos    |


