-- 11. Customer segmentation

SELECT 
    c.customer_id,
    c.city,
    COUNT(DISTINCT om.order_id) AS 'Order Count',
    ROUND(SUM(oi.quantity * oi.price),2) AS 'Total Spending',
    CASE
    WHEN SUM(oi.quantity * oi.price) >= 150 then "High Value"
    WHEN SUM(oi.quantity * oi.price) >= 100 then "Medium Value"
	WHEN SUM(oi.quantity * oi.price) >= 50 then "Low Value"
        else "Very Low Value"
        end as "Customer Segment"
	from customers_medium as c
    join orders_medium as om
    on om.customer_id = c.customer_id
    join order_items as oi
    on oi.order_id = om.order_id
    Group by c.customer_id, c.city;