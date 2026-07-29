-- 9. Repeat customers

SELECT 
    c.customer_id,
    c.city,
    COUNT(DISTINCT oi.order_id) AS 'Order Count',
    round(SUM(oi.quantity * oi.price),2) AS 'Total Spending'
FROM
    customers_medium AS c
join orders_medium as om
on om.customer_id = c.customer_id
join order_items as oi
on oi.order_id = om.order_id  
group by c.customer_id, c.city
HAVING COUNT(DISTINCT oi.order_id) > 1;
