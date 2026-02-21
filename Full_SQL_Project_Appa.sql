create database retail_sales_db;
use retail_sales_db;

-- create table customers 
create table customers(
customer_id int primary key auto_increment,
customer_name varchar(100) not null,
 email varchar(100) unique,
 phone varchar(15),
 city varchar(50),
 state varchar(50),
 created_at date
);

-- create table products
create table products(
product_id int primary key auto_increment,
product_name varchar(100) not null,
category varchar(50),
 price decimal(10,2),
 stock_quantity int
);

-- create table orders 
create  table orders(
order_id int primary key auto_increment,
customer_id int,
order_date date,
order_status varchar(30),
foreign key (customer_id) references customers(customer_id)
);

-- create table order_items
create table order_items(
order_item_id int primary key auto_increment,
order_id int,
product_id int,
quantity int,
unit_price decimal(10,2),
foreign key (order_id) references   orders(order_id),
foreign key (product_id) references products(product_id)
);


-- create table payments 
create table payments(
payment_id int primary key auto_increment,
order_id int,
payment_date date,
payment_method varchar(50),
payment_status varchar(30),
FOREIGN KEY (order_id) references orders(order_id)
);

## inserting data(values) into tables 

-- insert values in customers table 
INSERT INTO customers (customer_name, email, phone, city, state, created_at) VALUES
('Amit Sharma','amit@gmail.com','9876543210','Pune','Maharashtra','2024-01-10'),
('Rahul Verma','rahul@gmail.com','9876543211','Mumbai','Maharashtra','2024-01-12'),
('Sneha Patil','sneha@gmail.com','9876543212','Nashik','Maharashtra','2024-01-15'),
('Neha Joshi','neha@gmail.com','9876543213','Nagpur','Maharashtra','2024-01-18'),
('Rohit Mehta','rohit@gmail.com','9876543214','Delhi','Delhi','2024-01-20'),
('Priya Singh','priya@gmail.com','9876543215','Noida','UP','2024-01-22'),
('Kunal Shah','kunal@gmail.com','9876543216','Ahmedabad','Gujarat','2024-01-25'),
('Ankit Jain','ankit@gmail.com','9876543217','Indore','MP','2024-01-28'),
('Pooja Kulkarni','pooja@gmail.com','9876543218','Kolhapur','Maharashtra','2024-02-01'),
('Vikas Yadav','vikas@gmail.com','9876543219','Gurgaon','Haryana','2024-02-03'),
('Manish Gupta','manish@gmail.com','9876543220','Jaipur','Rajasthan','2024-02-05'),
('Riya Kapoor','riya@gmail.com','9876543221','Chandigarh','Punjab','2024-02-07'),
('Saurabh Mishra','saurabh@gmail.com','9876543222','Bhopal','MP','2024-02-10'),
('Nikita Desai','nikita@gmail.com','9876543223','Surat','Gujarat','2024-02-12'),
('Arjun Rao','arjun@gmail.com','9876543224','Bangalore','Karnataka','2024-02-15'),
('Meenal Iyer','meenal@gmail.com','9876543225','Chennai','Tamil Nadu','2024-02-18'),
('Akash Nair','akash@gmail.com','9876543226','Kochi','Kerala','2024-02-20'),
('Deepak Soni','deepak@gmail.com','9876543227','Udaipur','Rajasthan','2024-02-22'),
('Swati Pawar','swati@gmail.com','9876543228','Satara','Maharashtra','2024-02-25'),
('Rakesh Malhotra','rakesh@gmail.com','9876543229','Amritsar','Punjab','2024-02-28');


-- insert values in products table 
INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Bluetooth Headphones','Electronics',1999,100),
('Wireless Mouse','Electronics',699,150),
('Laptop Stand','Accessories',1299,80),
('USB-C Cable','Accessories',399,200),
('Power Bank 20000mAh','Electronics',2499,60),
('Smart Watch','Electronics',3499,70),
('Keyboard','Electronics',999,120),
('Mobile Cover','Accessories',299,300),
('LED Desk Lamp','Home',1599,90),
('Backpack','Bags',2199,50),
('Notebook','Stationery',199,400),
('Office Chair','Furniture',7499,20),
('Water Bottle','Home',499,180),
('Pen Drive 64GB','Electronics',899,140),
('Webcam','Electronics',2899,40),
('HDMI Cable','Accessories',499,160),
('Bluetooth Speaker','Electronics',3299,55),
('Diary','Stationery',249,220),
('Study Table','Furniture',9999,15),
('Travel Pouch','Bags',899,75);

--  insert values into orders table 
INSERT INTO orders (customer_id, order_date, order_status) VALUES
(1,'2024-02-01','Completed'),
(2,'2024-02-02','Completed'),
(3,'2024-02-03','Completed'),
(4,'2024-02-04','Cancelled'),
(5,'2024-02-05','Completed'),
(6,'2024-02-06','Completed'),
(7,'2024-02-07','Pending'),
(8,'2024-02-08','Completed'),
(9,'2024-02-09','Completed'),
(10,'2024-02-10','Completed'),
(11,'2024-02-11','Completed'),
(12,'2024-02-12','Completed'),
(13,'2024-02-13','Pending'),
(14,'2024-02-14','Completed'),
(15,'2024-02-15','Completed'),
(16,'2024-02-16','Completed'),
(17,'2024-02-17','Cancelled'),
(18,'2024-02-18','Completed'),
(19,'2024-02-19','Completed'),
(20,'2024-02-20','Completed'),
(1,'2024-02-21','Completed'),
(2,'2024-02-22','Completed'),
(3,'2024-02-23','Completed'),
(4,'2024-02-24','Completed'),
(5,'2024-02-25','Completed'),
(6,'2024-02-26','Completed'),
(7,'2024-02-27','Completed'),
(8,'2024-02-28','Completed'),
(9,'2024-03-01','Completed'),
(10,'2024-03-02','Completed'),
(11,'2024-03-03','Completed'),
(12,'2024-03-04','Completed'),
(13,'2024-03-05','Completed'),
(14,'2024-03-06','Completed'),
(15,'2024-03-07','Completed'),
(16,'2024-03-08','Completed'),
(17,'2024-03-09','Completed'),
(18,'2024-03-10','Completed'),
(19,'2024-03-11','Completed'),
(20,'2024-03-12','Completed');

-- insert values into order_items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1,1,1,1999),
(1,2,1,699),
(2,3,1,1299),
(3,5,1,2499),
(3,4,2,399),
(4,6,1,3499),
(5,7,1,999),
(6,8,2,299),
(7,9,1,1599),
(8,10,1,2199),
(9,11,3,199),
(10,12,1,7499),
(11,13,2,499),
(12,14,1,899),
(13,15,1,2899),
(14,16,2,499),
(15,17,1,3299),
(16,18,2,249),
(17,19,1,9999),
(18,20,1,899),
(19,1,1,1999),
(20,2,1,699),
(21,3,1,1299),
(22,4,2,399),
(23,5,1,2499),
(24,6,1,3499),
(25,7,1,999),
(26,8,3,299),
(27,9,1,1599),
(28,10,1,2199),
(29,11,2,199),
(30,12,1,7499),
(31,13,1,499),
(32,14,1,899),
(33,15,1,2899),
(34,16,2,499),
(35,17,1,3299),
(36,18,2,249),
(37,19,1,9999),
(38,20,1,899),
(39,1,2,1999),
(40,2,1,699);

-- insert values into payments table 
INSERT INTO payments (order_id, payment_date, payment_method, payment_status) VALUES
(1,'2024-02-01','UPI','Success'),
(2,'2024-02-02','Card','Success'),
(3,'2024-02-03','UPI','Success'),
(4,'2024-02-04','UPI','Failed'),
(5,'2024-02-05','Net Banking','Success'),
(6,'2024-02-06','UPI','Success'),
(7,'2024-02-07','Card','Pending'),
(8,'2024-02-08','UPI','Success'),
(9,'2024-02-09','Card','Success'),
(10,'2024-02-10','UPI','Success'),
(11,'2024-02-11','UPI','Success'),
(12,'2024-02-12','Card','Success'),
(13,'2024-02-13','UPI','Pending'),
(14,'2024-02-14','UPI','Success'),
(15,'2024-02-15','Card','Success'),
(16,'2024-02-16','UPI','Success'),
(17,'2024-02-17','UPI','Failed'),
(18,'2024-02-18','Net Banking','Success'),
(19,'2024-02-19','UPI','Success'),
(20,'2024-02-20','Card','Success'),
(21,'2024-02-21','UPI','Success'),
(22,'2024-02-22','UPI','Success'),
(23,'2024-02-23','Card','Success'),
(24,'2024-02-24','UPI','Success'),
(25,'2024-02-25','UPI','Success'),
(26,'2024-02-26','Card','Success'),
(27,'2024-02-27','UPI','Success'),
(28,'2024-02-28','Net Banking','Success'),
(29,'2024-03-01','UPI','Success'),
(30,'2024-03-02','Card','Success'),
(31,'2024-03-03','UPI','Success'),
(32,'2024-03-04','UPI','Success'),
(33,'2024-03-05','Card','Success'),
(34,'2024-03-06','UPI','Success'),
(35,'2024-03-07','UPI','Success'),
(36,'2024-03-08','Card','Success'),
(37,'2024-03-09','UPI','Success'),
(38,'2024-03-10','Net Banking','Success'),
(39,'2024-03-11','UPI','Success'),
(40,'2024-03-12','Card','Success');



## Solving problem statements 

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
	date_format (o.order_date,'%Y-%M') as month,
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


 

