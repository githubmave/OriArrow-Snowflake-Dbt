with up_features AS (


    select
        user_id,
        product_id,
        order_id,
        order_number,
        orderNum

    from {{ref('dim_ord_pro_prior')}}
/*     group by user_id 
 */ )


select
    user_id,
    product_id,
     count(*) AS up_orders,
   
    min(order_number) AS minimum_orderNumber,
    max(order_number) AS maximum_orderNumber,

    avg(orderNum) as avg_cardOrder

FROM up_features
group by user_id,product_id