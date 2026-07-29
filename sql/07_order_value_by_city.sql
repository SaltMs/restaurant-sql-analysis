-- 7. Revenue by city

select r.city, count( DISTINCT oi.order_id) as "Total Orders" , ROUND(sum(oi.price * oi.quantity ),2) as "Total Revenue" from restaurants as r
join orders_medium as om
on om.restaurant_id = r.restaurant_id
join order_items as oi
on oi.order_id = om.order_id
group by r.city;