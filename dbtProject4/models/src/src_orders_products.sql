with orders_products AS(

       select * from IMBAMAVE.RAW.ORDERS_PRODUCTS
)

SELECT

  order_id,	product_id,	add_to_cart_order AS orderNum,	reordered
FROM
    orders_products