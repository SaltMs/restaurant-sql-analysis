-- 5. Top 10 best-selling menu items

select oi.item_id,
m.restaurant_id, 
sum(oi.quantity) as "Quantity Sold" ,
Round(sum(oi.quantity * oi.price), 2 ) as "Total Revenue" 

from order_items as oi
join menu_items as m
on oi.item_id = m.item_id
group by oi.item_id, m.restaurant_id
ORDER BY sum(oi.quantity) DESC
LIMIT 10;