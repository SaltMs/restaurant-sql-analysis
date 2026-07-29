-- 6. Average order value by cuisine

SELECT
    cuisine,
    ROUND(AVG(order_total), 2) AS average_order_value
FROM (
    SELECT
        o.order_id,
        r.cuisine,
        SUM(oi.quantity * oi.price) AS order_total
    FROM orders_clean AS o
    JOIN restaurants AS r
        ON o.restaurant_id = r.restaurant_id
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    GROUP BY
        o.order_id,
        r.cuisine
) AS order_totals
GROUP BY cuisine
ORDER BY average_order_value DESC;