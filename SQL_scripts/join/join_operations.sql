/*-- five table Join w/ CAPE CODD Schema
SELECT o.order_num, o.order_date, c.customer_name, i.item_name, r.first_name
FROM orders o
JOIN customer c ON o.customer_num = c.customer_num
JOIN order_line ol ON o.order_num = ol.order_num
JOIN item i ON ol.item_num = i.item_num
JOIN rep r ON c.rep_num = r.rep_num;
*/

select customer_name, first_name from customer inner join rep on customer.rep_num = rep.rep_num;


select name, dob, phone, type, club, hours_spent, msgTO, msg_content
from student_roster where student_name=id_num
join full
join full
join full
join full
join full
