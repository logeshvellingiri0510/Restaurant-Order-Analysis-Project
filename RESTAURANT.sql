Create Database restaurant;
use restaurant;

--1 : CREATINGTABLE 

CREATE TABLE order_details (
    order_details_id SMALLINT NOT NULL,
    order_id SMALLINT NOT NULL,
    order_date DATE,
    order_time TIME,
    item_id SMALLINT,
    PRIMARY KEY (order_details_id)
);

--2 : TABLE02

CREATE TABLE menu_items (
    menu_item_id SMALLINT NOT NULL,
    item_name VARCHAR(45),
    category VARCHAR(45),
    price DECIMAL(5,2),
    PRIMARY KEY (menu_item_id)
);
--3 : INSERTINGVALUES

INSERT INTO order_details VALUES 
(1, 1, '2023-01-01', '11:38:36', 109),
(2, 2, '2023-01-01', '11:57:40', 108),
(3, 2, '2023-01-01', '11:57:40', 124),
(4, 2, '2023-01-01', '11:57:40', 117),
(5, 2, '2023-01-01', '11:57:40', 129),
(6, 2, '2023-01-01', '11:57:40', 106),
(7, 3, '2023-01-01', '12:12:28', 117),
(8, 3, '2023-01-01', '12:12:28', 119),
(9, 4, '2023-01-01', '12:16:31', 117),
(10, 5, '2023-01-01', '12:21:30', 117),
(11, 6, '2023-01-01', '12:29:36', 101),
(12, 6, '2023-01-01', '12:29:36', 114),
(13, 7, '2023-01-01', '12:50:37', 123),
(14, 8, '2023-01-01', '12:51:37', 123),
(15, 9, '2023-01-01', '12:52:01', 108),
(16, 9, '2023-01-01', '12:52:01', 126),
(17, 9, '2023-01-01', '12:52:01', 110),
(18, 9, '2023-01-01', '12:52:01', 117),
(19, 9, '2023-01-01', '12:52:01', 117),
(20, 9, '2023-01-01', '12:52:01', 129),
(21, 9, '2023-01-01', '12:52:01', 122),
(22, 9, '2023-01-01', '12:52:01', 130),
(23, 9, '2023-01-01', '12:52:01', 132);


INSERT INTO menu_items (menu_item_id, item_name, category, price) VALUES
(1, 'Cheeseburger', 'Main Course', 12.50),
(2, 'Pepperoni Pizza', 'Main Course', 15.00),
(3, 'Caesar Salad', 'Appetizer', 8.75),
(4, 'French Fries', 'Side', 4.00),
(5, 'Coca-Cola', 'Beverage', 3.25),
(6, 'Grilled Salmon', 'Main Course', 18.99),
(7, 'Chicken Alfredo', 'Main Course', 16.50),
(8, 'Garlic Bread', 'Appetizer', 5.50),
(9, 'Onion Rings', 'Side', 4.50),
(10, 'Orange Juice', 'Beverage', 3.75),
(11, 'Chocolate Lava Cake', 'Dessert', 7.00),
(12, 'Veggie Burger', 'Main Course', 11.00),
(13, 'Mushroom Soup', 'Appetizer', 6.25),
(14, 'Steak Frites', 'Main Course', 22.00),
(15, 'Iced Tea', 'Beverage', 3.00),
(16, 'Tiramisu', 'Dessert', 7.50),
(17, 'Spaghetti Bolognese', 'Main Course', 14.75),
(18, 'Chicken Wings', 'Appetizer', 9.99),
(19, 'Side Salad', 'Side', 5.00),
(20, 'Espresso', 'Beverage', 2.50),
(21, 'Apple Pie', 'Dessert', 6.50),
(22, 'Sushi Platter', 'Main Course', 25.00),
(23, 'Lemonade', 'Beverage', 3.50);


--EXPLORING THE MENU TABLE DATA

--1: VIEW OF MENU ITEM TABLE
select*from menu_items;

--2: FIND NUMBER OF ITEMS ON THE MENU
select count(*)item_name from menu_items;

--3: FIND EXPENSIVE ITEM IN MENU
select*from menu_items order by price desc limit 05

--4: FIND Bevarage IN MENU
select*from menu_items where category='Beverage';

--5: FIND MOST EXPENSIVE ITEMS ON MAIN COURSE
select*from menu_items where category='Main Course'order by price Desc;

--6: HOW MANY DISHES IN EACH CATEGORY
select category,count(menu_item_id) from menu_items group by category;

--7: WHAT IS THE AVERAGE DISH PRICE WITH EACH CATEGORY
select AVG(price),category from menu_items group by category;

EXPLORING ORDER TABLE

--1: VIEW THE ORDER TABLE
select * from order_details;

--2: WHAT IS THE DATE RANGE OF TABLE 
select MAX(order_date) , MIN(order_date) from order_details;

--3: HOW MANY ORDERS MADE WITHIN THE DATE RANGE
select COUNT(*) from order_details where order_date between '2023-01-01' and '2023-01-01';

--4: WHICH ORDER HAS MOST NUMBER OF ITEMS
select order_id,COUNT(item_id) from order_details group by order_id;

--5: HOW MANY ORDERS HAD MORE THAN 2 ITEMS
select order_id,COUNT(item_id) as num_items from order_details group by order_id having num_items>2;

ANALYZE CUSTOMER BEHAVIOUR

--1: COMBINE TWO TABLES FOR ANALYSE
select*from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id;

--2: WHAT WERE THE LEAST AND MOST ORDER ITEMS , WHAT CATEGORY WHERE THEY IN 
SELECT item_name, COUNT(order_details_id), category
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY item_name,category;

--3: WHAT ARE THE TOP 5 ORDERS THAT SPENT THE MOST MONEY 
SELECT order_id, SUM(price) AS total_spend
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;








