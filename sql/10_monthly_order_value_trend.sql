-- 10. Monthly revenue trend

SELECT 
    YEAR(om.order_time) AS 'order year',
    MONTH(om.order_time) AS 'order month',
    COUNT(DISTINCT om.order_id) AS 'Total Orders',
    round(sum(oi.quantity * oi.price),2) as "Total Revenue"
FROM
    orders_medium AS om
        JOIN
    order_items AS oi
    ON oi.order_id = om.order_id
    Group by YEAR(om.order_time), MONTH(om.order_time);