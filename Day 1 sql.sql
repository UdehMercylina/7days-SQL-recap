create database Practice;
use practice;

-- you might find some errors i kept mixing up where an having for some reason but i got it though 
-- WHERE — filters individual rows, before any grouping happens
-- HAVING — filters groups, after GROUP BY has already combined rows

/* created a table name customers */

CREATE TABLE customers (
    customer_id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    age INT,
    amount_spent DECIMAL(10,2),
    purchase_date DATE
);

-- got the dataset from Claude
INSERT INTO customers (customer_id, name, city, age, amount_spent, purchase_date) VALUES
(1, '  John Smith  ', 'Abuja', 28, 150.50, '2025-01-05'),
(2, 'Mary Johnson', '  Lagos  ', 34, 320.00, '2025-01-12'),
(3, '  Peter Obi ', 'Abuja', 45, 89.99, '2025-01-15'),
(4, 'Grace Adams', 'Kano', 22, 0.00, '2025-01-20'),
(5, 'David   Lee', 'Lagos', 51, 500.75, '2025-02-01'),
(6, '  Sarah Ali', 'Port Harcourt', 19, 45.00, '2025-02-03'),
(7, 'James Bond', 'ABUJA', 60, 999.99, '2025-02-10'),
(8, 'Linda Okafor', 'Kano   ', 38, 210.25, '2025-02-14'),
(9, 'Michael Chen', 'Lagos', 27, 75.00, '2025-02-18'),
(10, '  Blessing Eze  ', 'Abuja', 33, 410.00, '2025-02-25'),
(11, 'Tunde Bakare', 'Ibadan', 41, 65.50, '2025-03-01'),
(12, 'Amaka Nwosu', 'Enugu', 29, 180.00, '2025-03-04'),
(13, '  Chidi Okeke', 'Lagos', 36, 320.10, '2025-03-09'),
(14, 'Fatima Bello', 'Kano', 24, 95.75, '2025-03-11'),
(15, 'Emeka Obi', '  Abuja', 55, 0.00, '2025-03-15'),
(16, 'Ngozi Uche', 'Port Harcourt', 31, 275.00, '2025-03-20'),
(17, 'Kunle Adebayo', 'Ibadan', 47, 610.30, '2025-03-25'),
(18, 'Halima Yusuf', 'Kano', 26, 120.00, '2025-04-01'),
(19, 'Chinedu Eze', 'Lagos', 39, 450.00, '2025-04-05'),
(20, '  Aisha Mohammed  ', 'Abuja', 30, 89.00, '2025-04-09'),
(21, 'Segun Ade', 'Ibadan', 44, 340.60, '2025-04-14'),
(22, 'Yemi Alade', 'lagos', 23, 0.00, '2025-04-18'),
(23, 'Ifeoma Chukwu', 'Enugu', 37, 199.99, '2025-04-22'),
(24, 'Musa Ibrahim', 'Kano', 52, 720.00, '2025-04-27'),
(25, 'Bola Tinubu', 'ABUJA', 49, 310.45, '2025-05-02'),
(26, 'Chioma Nnamdi', 'Lagos', 21, 55.00, '2025-05-06'),
(27, '  Kelechi Iheanacho', 'Port Harcourt', 28, 415.20, '2025-05-10'),
(28, 'Zainab Suleiman', 'Kano   ', 33, 0.00, '2025-05-15'),
(29, 'Dele Momodu', 'Ibadan', 58, 890.00, '2025-05-19'),
(30, 'Grace   Effiong', 'Enugu', 25, 130.75, '2025-05-23');


/*Get the names and cities of every customer who spent more than 300, sorted by amount spent highest to lowest.*/

select city, amount_spent
from customers 
where amount_spent > 300
order by amount_spent desc

/* select name and amount_spent from customers */ ;

select name, amount_spent 
from Customers
where amount_spent > 200;

-- Write a query that selects name and age for customers younger than 30
select name,age
from customers
where age <30;



-- ORDER BY

-- Write a query that shows name and age, sorted youngest to oldest.
SELECT name, age
FROM customers
ORDER BY age ASC;

-- Write a query that shows name and amount_spent, filtering to only customers in 'Lagos', sorted by amount_spent from highest to lowest.
SELECT name, amount_spent, city
FROM customers
WHERE city = 'Lagos'
ORDER BY amount_spent DESC;



-- LIMIT and basic aggregate functions (COUNT, SUM, AVG)
-- Write -- a query that shows the top 3 oldest customers (name and age only).

SELECT name, age
FROM customers
ORDER BY age DESC
LIMIT 3;

-- Write -- a query that returns the total number of customers in the table.
select count(*)  from customers;

 -- Write a query that returns the total amount_spent across all customers.
 select  sum(amount_spent) from customers;

 -- Write a query that returns the average age of all customers, and the maximum amount_spent — both in the same query.
select avg(age) , max(amount_spent) from customers;


-- Lesson 5: GROUP BY + HAVING

-- Write a query showing the total amount_spent per city.
SELECT city, SUM(amount_spent)
FROM customers
GROUP BY city;

-- Write a query showing average age per city, but only for cities with more than 3 customers.
SELECT city, AVG(age)
FROM customers
GROUP BY city
HAVING COUNT(*) > 3;

-- Write a query showing city and count of customers, only where the total amount_spent in that city is greater than 500.
SELECT city, COUNT(*), SUM(amount_spent)
FROM customers
GROUP BY city
HAVING SUM(amount_spent) > 500;


-- Write a query showing count of customers grouped by city, sorted from most customers to fewest.
SELECT city, COUNT(*)
FROM customers
GROUP BY city
ORDER BY COUNT(*) DESC;















-- ============================================
-- Day 1 — SQL Practice Questions & Answers
-- ===========================================

-- 1. Get name and city for customers older than 40, sorted by age (oldest first).
SELECT name, city, age
FROM customers
WHERE age > 40
ORDER BY age DESC;


-- 2. Get the total number of customers and the average amount_spent, in one query (no grouping).
SELECT COUNT(*), AVG(amount_spent)
FROM customers;


-- 3. Show each city with its total amount_spent, sorted from highest total to lowest.
SELECT city, SUM(amount_spent)
FROM customers
GROUP BY city
ORDER BY SUM(amount_spent) DESC;


-- 4. Show each city and its customer count, only for cities with more than 3 customers.
SELECT city, COUNT(*)
FROM customers
GROUP BY city
HAVING COUNT(*) > 3;


-- 5. Show each city and its average age, only for cities where the average age is above 35.
SELECT city, AVG(age)
FROM customers
GROUP BY city
HAVING AVG(age) > 35;


-- 6. Get name and amount_spent for the top 5 highest spenders, sorted highest to lowest.
SELECT name, amount_spent
FROM customers
ORDER BY amount_spent DESC
LIMIT 5;


-- 7. Trick question — spot the error without running it:
-- SELECT city, amount_spent
-- FROM customers
-- WHERE SUM(amount_spent) > 1000
-- GROUP BY city;
--
-- What's wrong: SUM() is an aggregate function, and aggregate functions
-- are not allowed inside WHERE. WHERE filters raw rows before any
-- grouping happens, so at that point there's no "sum" to compare yet.
-- The fix is to move the condition into HAVING, which runs after GROUP BY.


SELECT city, SUM(amount_spent)
FROM customers
GROUP BY city
HAVING SUM(amount_spent) > 1000;


-- 8. Show city and count of customers, only for cities where the minimum age
-- in that city is under 25.
SELECT city, COUNT(*), MIN(age)
FROM customers
GROUP BY city
HAVING MIN(age) < 25;


-- Tried it write it as best as i can
