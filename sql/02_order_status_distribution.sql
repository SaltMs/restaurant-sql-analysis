-- 2. Order count and percentage by status
SELECT
    status,
    COUNT(*) AS order_count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM orders_clean),
        2
    ) AS order_percentage
FROM orders_clean
GROUP BY status
ORDER BY order_count DESC;