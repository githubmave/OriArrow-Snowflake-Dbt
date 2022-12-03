

with orders AS(

       select * from IMBAMAVE.RAW.ORDERS
)

SELECT

  order_id,	
  user_id,	
  eval_set,	
  order_number,	
  order_dow AS DayOfWeek,	
  order_hour_of_day,	
  days_since_prior_order
FROM
    orders
where
    eval_set='prior'