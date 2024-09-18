-- Using union
select sku_description, buyer from sku_data
where department='Camping'
union
select sku_description, buyer from sku_data
where department='Climbing';


-- Using Intersect
select sku, sku_description
from sku_data
where buyer='Pete Hansen'
intersect
select inv.sku, inv.sku_description
from inventory inv, warehouse w
where inv.warehouseid=w.warehouseid and w.warehousestate='GA';


-- Using Minus
select sku, sku_description
from inventory
minus
select inv.sku, inv.sku_description
from inventory inv
where inv.quantityonorder=0;

