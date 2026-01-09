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