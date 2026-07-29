-- 1. Total Orders and Total Order Value
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(quantity * price), 2) AS total_order_value
FROM order_items;