
with orders_products AS(
      SELECT 
        Ord.order_id, 
        Ord.user_id,
        Ord.eval_set,
        Ord.order_number,	
        Ord.DayOfWeek,
        Ord.order_hour_of_day,
        Ord.days_since_prior_order,
    /*     Pro.order_id, */
        Pro.product_id,
        
        Pro.orderNum,
        Pro.reordered
  
      FROM {{ ref('src_orders')}} As Ord
      join  {{ref('src_orders_products')}} As Pro
      on Ord.order_id = Pro.order_id

)

select 
        order_id, 
        user_id,
        eval_set,
        order_number,	
        DayOfWeek,
        order_hour_of_day,
        days_since_prior_order,      
        product_id,
        orderNum,	
        reordered
     

from orders_products
 


