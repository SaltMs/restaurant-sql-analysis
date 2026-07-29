-- 8. Order performance by cuisine

SELECT
    r.cuisine,
    COUNT(o.order_id) AS total_orders,

    SUM(
        CASE
            WHEN o.status = 'Delivered' THEN 1
            ELSE 0
        END
    ) AS delivered_orders,

    SUM(
        CASE
            WHEN o.status = 'Late' THEN 1
            ELSE 0
        END
    ) AS late_orders,

    SUM(
        CASE
            WHEN o.status = 'Cancelled' THEN 1
            ELSE 0
        END
    ) AS cancelled_orders,

    ROUND(
        SUM(
            CASE
                WHEN o.status = 'Delivered' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(o.order_id),
        2
    ) AS delivery_rate

FROM orders_clean AS o
JOIN restaurants AS r
    ON r.restaurant_id = o.restaurant_id
GROUP BY r.cuisine
ORDER BY delivery_rate DESC;