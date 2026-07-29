-- 4. Revenue by restaurant
select r.restaurant_id, r.cuisine, r.city, ROUND(sum(oi.price*oi.quantity),2) as Total_Revenue from restaurants as r
join orders_medium as om
on r.restaurant_id = om.restaurant_id
join order_items as oi
on oi.order_id = om.order_id
group by r.restaurant_id, r.cuisine, r.city
ORDER BY total_revenue DESC;