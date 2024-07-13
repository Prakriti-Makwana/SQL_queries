create database pizzhut;

select * from pizzhut.pizzas;

create table orders (
order_id int not null,
order_date date not null,
order_time time not null,
primary key (order_id));

create table order_details (
order_details_id int not null,
order_id int not null,
pizza_id text not null,
quantity int not null,
primary key (order_details_id));

-- Retrieve the total number of orders placed.
Select count(order_id) as total_orders from orders;

-- Calculate the total revenue generated from pizza sales.
Select round(sum(order_details.quantity * pizzas.price),2) as total_sales
from order_details join pizzas
on pizzas.pizza_id = order_details.pizza_id;

-- Identify the highest-priced pizza. 
Select pizzas.size, COUNT(order_details.order_details_id) AS order_count
from pizzas JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size ORDER BY order_count DESC;

-- Identify the most common pizza size ordered.
SELECT pizzas.size, COUNT(order_details.order_details_id) AS order_count 
from pizzas join order_details ON pizzas_id = order_details.pizzas_id;

-- List the top 5 most ordered pizza types along with their quantities.
SELECT pizzas_types.name, sum(order_details.quantity) As quanity from 
pizza_types JOIN pizzas on
 pizza_types.pizza_type_id = pizzas.pizza_type_id JOIN order_details
 on order_details.pizza_id = pizzas.pizza_id
 GROUP BY pizza_types.name order by quantity desc limit 5;



