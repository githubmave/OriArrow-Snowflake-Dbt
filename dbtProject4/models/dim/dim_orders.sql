with src_orders AS(

    SELECT * FROM {{ ref('src_orders')}}

)

select 
  order_id,	
  user_id,	
  eval_set,	
  order_number,	
  DayOfWeek,	
  order_hour_of_day,	
  days_since_prior_order
FROM
    src_orders
