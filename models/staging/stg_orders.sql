SELECT 
-- from raw_order
o.orderid,
o.orderdate, 
o.shipdate,
o.shipmode,
o.ordersellingprice - ordercostprice as orderprofit,
-- from raw_customer
c.customername,
c.customerid,
c.segment,
c.country,
-- from raw_product
p.category, 
p.productname, 
p.subcategory,
p.productid
from {{ ref('raw_orders') }} as o 
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid 
left join {{ ref('raw_product') }} as p
on o.productid = p.productid


