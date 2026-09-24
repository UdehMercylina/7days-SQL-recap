-- ============================================
-- Day 2 — JOINs: Setup + Practice
-- ============================================

USE practice;

-- Second table, linked to customers via customer_id
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    product VARCHAR(50),
    order_amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO orders (order_id, customer_id, product, order_amount, order_date) VALUES
(101, 1, 'Laptop', 450.00, '2025-06-01'),
(102, 2, 'Phone', 300.00, '2025-06-03'),
(103, 2, 'Headphones', 45.50, '2025-06-05'),
(104, 5, 'Monitor', 210.00, '2025-06-08'),
(105, 7, 'Keyboard', 60.00, '2025-06-10'),
(106, 9, 'Laptop', 500.00, '2025-06-12'),
(107, 12, 'Mouse', 20.00, '2025-06-14'),
(108, 15, 'Phone', 310.00, '2025-06-16'),
(109, 999, 'Tablet', 180.00, '2025-06-18'); -- deliberately no matching customer_id!

-- checking if the table is complete
SELECT * FROM orders;


-- ============================================
-- INNER JOIN
-- ============================================

-- basic join with aliases
SELECT c.name, o.product
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id;

-- same thing, explicit INNER JOIN, with order_amount added
SELECT cus.name, ode.product, ode.order_amount
FROM customers cus
INNER JOIN orders ode
ON cus.customer_id = ode.customer_id;

-- SELECT * to see every column from both tables — still an INNER JOIN,
-- so the Tablet order (customer_id 999) still won't appear
SELECT *
FROM customers cus
JOIN orders ode
ON cus.customer_id = ode.customer_id;


-- ============================================
-- LEFT JOIN — every customer survives, matched or not
-- ============================================

SELECT cus.customer_id, cus.name, ode.product, ode.order_amount
FROM customers cus
LEFT JOIN orders ode
ON cus.customer_id = ode.customer_id
ORDER BY cus.customer_id;

-- Q2: every customer's name and product (or NULL if they never ordered)
SELECT c.name, o.product
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- Q3: only customers who NEVER placed an order
-- NULL can't be checked with "=" — must use IS NULL
SELECT c.name, o.product
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.product IS NULL;


-- ============================================
-- RIGHT JOIN — every order survives, matched or not
-- ============================================

SELECT cus.customer_id, cus.name, ode.product, ode.order_amount
FROM customers cus
RIGHT JOIN orders ode
ON cus.customer_id = ode.customer_id;

-- Q4: RIGHT JOIN that includes the Tablet order despite no matching customer
SELECT c.name, o.product
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;


-- ============================================
-- SELF JOIN — joining a table to itself
-- ============================================

-- customers who share the same city (includes reversed duplicate pairs)
SELECT a.name AS customer1, b.name AS customer2, a.city
FROM customers a
JOIN customers b
ON a.city = b.city
AND a.customer_id <> b.customer_id;

-- same idea, using "<" instead of "<>" removes reversed duplicate pairs
SELECT a.name AS customer1, b.name AS customer2, a.city
FROM customers a
JOIN customers b
ON a.city = b.city
AND a.customer_id < b.customer_id;

-- Q5: pairs of customers who are the SAME AGE, no self-matches, no reversed duplicates
-- ">" (or "<") does both jobs at once: blocks self-matches AND blocks reversed pairs

SELECT a.name, a.age, b.name, b.age
FROM customers a
JOIN customers b
ON a.age = b.age
AND a.customer_id > b.customer_id;