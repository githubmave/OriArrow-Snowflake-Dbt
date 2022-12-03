with user_features2 AS (

    select *

       /*  user_id,
        product_id,
        order_id,
        order_number,
        reordered */

    from {{ref('dim_ord_pro_prior')}}

)


select
    user_id,
    count(*) As user_total_products,
   /*  count(product_id), */
    count (distinct product_id) As user_distinct_product,

    
Sum(CASE WHEN reordered = 1 THEN 1 ELSE 0 END) / Cast(Sum(CASE WHEN 
order_number > 1 THEN 1 ELSE 0 END) AS DOUBLE) AS user_reorder_ratio


from user_features2
group by user_id