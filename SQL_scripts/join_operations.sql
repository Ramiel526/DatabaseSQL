-- five table Join w/ CAPE CODD Schema
SELECT o.order_num, o.order_date, c.customer_name, i.item_name, r.first_name
FROM orders o
JOIN customer c ON o.customer_num = c.customer_num
JOIN order_line ol ON o.order_num = ol.order_num
JOIN item i ON ol.item_num = i.item_num
JOIN rep r ON c.rep_num = r.rep_num;

