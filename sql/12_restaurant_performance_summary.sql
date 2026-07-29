-- 12. Restaurant performance summary

SELECT
    r.restaurant_id,
    r.cuisine,
    r.city,
    r.rating,
    p.total_orders,
    p.total_revenue,
    p.average_order_value
FROM restaurants AS r
JOIN (
    SELECT
        om.restaurant_id,
        COUNT(DISTINCT om.order_id) AS total_orders,
        ROUND(SUM(oi.price * oi.quantity), 2) AS total_revenue,
        ROUND(
            SUM(oi.price * oi.quantity) / COUNT(DISTINCT om.order_id),
            2
        ) AS average_order_value
    FROM orders_medium AS om
    JOIN order_items AS oi
        ON om.order_id = oi.order_id
    GROUP BY om.restaurant_id
) AS p
    ON r.restaurant_id = p.restaurant_id
ORDER BY p.total_revenue DESC;