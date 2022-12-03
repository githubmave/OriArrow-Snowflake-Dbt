with scr_orders_products AS (
    SELECT * FROM {{ ref('src_orders_products')}}
)

select 
   order_id, product_id,orderNum,reordered
from scr_orders_products
    