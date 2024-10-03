/*

select
:rep.rep_num,
rep.last_name,
customer.customer_name,
orders.order_num,
order_line.num_ordered,
item.description,
item.price
from
rep
join
custromer on rep.rep_num = customer.rep_num
join
orders on customer.customer_num = orders.customer_num
join order_line on orders.order_num = order_line.order_num
join item on order_line.item_num = item.item_num;

*/
--/*
SELECT
    REP.REP_NUM,
    REP.LAST_NAME,
    CUSTOMER.CUSTOMER_NAME,
    ORDERS.ORDER_NUM,
    ORDER_LINE.NUM_ORDERED,
    ITEM.DESCRIPTION,
    ITEM.PRICE
FROM
    REP
JOIN
    CUSTOMER ON REP.REP_NUM = CUSTOMER.REP_NUM
JOIN
    ORDERS ON CUSTOMER.CUSTOMER_NUM = ORDERS.CUSTOMER_NUM
JOIN
    ORDER_LINE ON ORDERS.ORDER_NUM = ORDER_LINE.ORDER_NUM
JOIN
    ITEM ON ORDER_LINE.ITEM_NUM = ITEM.ITEM_NUM;
--*/
