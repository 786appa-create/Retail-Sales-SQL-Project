## 1)How much total revenue has the business generated from completed orders?
select 
	sum(oi.quantity*oi.unit_price)as total_revenue
from orders o 
join order_items oi 
on o.order_id=oi.order_id
where o.order_status='completed';
-- total revenue from completed orders is alter

## 2)What is the total revenue generated per month?
select 
	date_format (o.order_date,'%y-%m') as month,
	 sum(oi.quantity*oi.unit_price) as monthly_revenue
     from orders o
     join order_items oi 
     on o.order_id=oi.order_id
     where o.order_status ="completed"
     group by month 
     order by month; 
     /* 24-02	43264.00
		24-03	32584.00    this is the monthly revenue trend */ 
        
## 3)Which products are selling the most?
select 
	p.product_name,
    sum(oi.quantity) as total_quantity_sold
from products p
join order_items oi 
on p.product_id=oi.product_id
group by p.product_name
order by total_quantity_sold desc
limit 5;

## 4) Which product categories generate the highest revenue?
select P.category, sum(oi.quantity*oi.unit_price) category_revenue
from products p
join order_items oi
on p.product_id=oi.product_id
group by p.category 
order by 	category_revenue desc;

## 5)Who are the customers contributing the most revenue?
select 
	c.customer_name, sum(oi.quantity*oi.unit_price) as total_spent
	from customers c 
	join orders o on o.customer_id=c.customer_id 
	join order_items oi on oi.order_id=o.order_id
    where o.order_status = 'completed'
	group by customer_name
	order by total_spent desc;
    
 ## 6)Which customers are repeat buyers?
 select 
     c.customer_name, count(o.order_id) AS total_orders 
     from customers c 
     join orders o on c.customer_id=o.customer_id
     group by c.customer_name
     having count(o.order_id)>1
     order by total_orders desc;
     
## 7) Which orders need payment follow-up?
select o.order_id,p.payment_id,p.payment_status,payment_method
from orders o 
join payments p 
on o.order_id=p.order_id
where p.payment_status in ("failed","pending");
    
  ## 8)What is the average value of a completed order?
  select AVG(order_total) AS average_order_value 
from (
	select o.order_id, 
    sum(oi.quantity*oi.unit_price) AS order_total
  from orders o
  join order_items oi on o.order_id=oi.order_id
  where o.order_status = "completed"
  group by o.order_id) t;
     
  ## 9)Which registered customers have not placed any orders?
  SELECT 
    c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

## 10)Rank customers based on their total spending.
SELECT 
    customer_name,
    total_spent,
    RANK() OVER (ORDER BY total_spent DESC) AS spending_rank
FROM (
    SELECT 
        c.customer_name,
        SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY c.customer_name
) ranked_customers;


