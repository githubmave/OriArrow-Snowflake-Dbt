with user_features1 as (

    select 
       user_id,
       order_number,
       days_since_prior_order
         

    from {{ref('dim_ord_pro_prior')}}
    


)


select 
    user_id,
    
    max(order_number) AS maxOrder,
    sum(days_since_prior_order) as totalGapDay,
    avg(days_since_prior_order) as avgGapDay


from user_features1

group by user_id