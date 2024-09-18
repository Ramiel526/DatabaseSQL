## Union

```SQL
-- Using union
select sku_description, buyer from sku_data
where department='Camping'
union
select sku_description, buyer from sku_data
where department='Climbing';
```

| SKU_DESCRIPTION               | BUYER         |
|-------------------------------|---------------|
| Half-dome Tent                | Cindy Lo      |
| Half-dome Tent Vestibule      | Cindy Lo      |
| Light Fly Climbing Harness    | Jerry Martin  |
| Locking Carabiner, Oval       | Jerry Martin  |

## Intersection

```SQL
-- Using Intersect
select sku, sku_description
from sku_data
where buyer='Pete Hansen'
intersect
select inv.sku, inv.sku_description
from inventory inv, warehouse w
where inv.warehouseid=w.warehouseid and w.warehousestate='GA';
```

| SKU     | SKU_DESCRIPTION                    |
|---------|------------------------------------|
| 100100  | Std. Scuba Tank, Yellow            |
| 100200  | Std. Scuba Tank, Magenta           |

## Minus

```SQL
-- Using Minus
select sku, sku_description
from inventory
minus
select inv.sku, inv.sku_description
from inventory inv
where inv.quantityonorder > 0
```

| SKU     | SKU_DESCRIPTION                    |
|---------|------------------------------------|
| 301000  | Light Fly Climbing Harness         |

