with prd_features as (

     select *

     from {{ref('dim_ord_pro_prior')}}

)


select 
    product_id,
    count (*) AS prod_orders,
    Sum(reordered) AS prod_reordered,
    Sum (CASE WHEN product_seq_time=1 then 1 else 0 end) as prod_first_orders,

    Sum(case 
        when order_number=1
        then 1
        else 2
    end) as product_seq_time



from 
    (select * ,
     rank()
       OVER(

         partition by user_id, product_id order by order_number
       ) AS product_seq_time
     from prd_features
    
    
    )

group by product_id



