DROP TABLE PRODUCT;
DROP TABLE PRODUCT_PRICE_HISTORY;
CREATE TABLE product  (
	product_id number(5), 
	product_name varchar2(32), 
	supplier_name varchar2(32), 
	unit_price number(7,2) 
); 

CREATE TABLE product_price_history (
	product_id number(5), 
	product_name varchar2(32), 
	supplier_name varchar2(32), 
	unit_price number(7,2) 
); 
COMMIT;
CREATE or REPLACE TRIGGER price_history_trigger 
BEFORE UPDATE OF unit_price 
ON product 
FOR EACH ROW 
BEGIN 
INSERT INTO product_price_history 
VALUES 
(:old.product_id, 
 :old.product_name, 
 :old.supplier_name, 
 :old.unit_price); 
END; 
/ 
insert into product values (100, 'phone', 'xyz', 500);
select * from product;
select * from product_price_history;
UPDATE PRODUCT SET unit_price = 800 WHERE product_id = 100;
select * from product;
select * from product_price_history;
