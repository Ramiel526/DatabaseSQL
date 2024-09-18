-- Sales

-- join sku data with inventory on sku and sku desc and calulate totals by dept.
select sd.department,
	count(price.sku) as sku_count,
	sum(inv.quantityonorder * price.price) as Sales_Total_per_Department
from sku_data sd, order_item price, inventory inv
where sd.sku=price.sku and sd.sku=inv.sku
group by sd.department;

-- Quantity in warehouse
select inv.sku,
       inv.sku_description,
       SUM(inv.quantityonhand) as total_quantity_on_hand
from inventory inv
group BY inv.sku, inv.sku_description;

-- quantity per buyer
select sd.buyer,
       SUM(inv.quantityonhand) as total_quantity_on_hand
from inventory inv
join sku_data sd ON inv.sku = sd.sku
group BY sd.buyer;



