## Group by

### Sum Warehouse total in total quantity by sku

```SQL

-- Quantity in warehouse
select inv.sku,
       inv.sku_description,
       SUM(inv.quantityonhand) as total_quantity_on_hand
from inventory inv
group BY inv.sku, inv.sku_description;

```

#### Output Table

|       SKU| SKU_DESCRIPTION                    | TOTAL_QUANTITY_ON_HAND|
|----------| -----------------------------------| ----------------------|
|    101100| Dive Mask, Small Clear             |                   750 |
|    201000| Half-dome Tent                     |                   262 |
|    202000| Half-dome Tent Vestibule           |                   111 |
|    100100| Std. Scuba Tank, Yellow            |                   650 |
|    302000| Locking Carabiner, Oval            |                  2750 |
|    101200| Dive Mask, Med Clear               |                   875 |
|    100200| Std. Scuba Tank, Magenta           |                   625 |
|    301000| Light Fly Climbing Harness         |                   550 |

### Total number of each sku on order by Buyer

```SQL

-- quantity per buyer
select sd.buyer,
       SUM(inv.quantityonhand) as total_quantity_on_hand
from inventory inv
join sku_data sd ON inv.sku = sd.sku
group BY sd.buyer;
```

#### Output Table

|BUYER                              | TOTAL_QUANTITY_ON_HAND
|-----------------------------------| ----------------------
|Nancy Meyers                       |                   1625
|Jerry Martin                       |                   3300
|Pete Hansen                        |                   1275
|Cindy Lo                           |                    373

### Total sales per department

```SQL

-- join sku data with inventory on sku and sku desc and calulate totals by dept.
select sd.department,
	count(price.sku) as sku_count,
	sum(inv.quantityonorder * price.price) as Sales_Total_per_Department
from sku_data sd, order_item price, inventory inv
where sd.sku=price.sku and sd.sku=inv.sku
group by sd.department;

```

#### Output Table

|DEPARTMENT                    | TOTAL_SALES |
|------------------------------| ------------|
| Camping                      |      271000 |
| Water Sports                 |      306500 |
