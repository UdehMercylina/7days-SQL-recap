-- ============================================
-- Day 3 — Subqueries & CTEs
-- ============================================

-- subquery in WHERE (customers below the average amount_spent)
-- first tried this with AVG(300) lol which makes no sense, AVG needs a column not a random number


use practice;


SELECT name, amount_spent
FROM customers
WHERE amount_spent < (SELECT AVG(amount_spent) FROM customers);

-- same thing but >=, this one i actually got right first try
SELECT name, city, amount_spent
FROM customers
WHERE amount_spent >= (SELECT AVG(amount_spent) FROM customers);


-- subquery with IN / NOT IN
-- customers who HAVE placed an order
SELECT name, city
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);


select * from customers;

-- customers who have NOT placed an order
-- i tried to select "orders" as a column here at first, orders is a table not a column lol
SELECT name
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);


-- subquery in FROM — has to have an alias or it errors
-- first attempt i compared avg_spent to the alias name itself (cityavg) instead of an actual number, dumb mistake
SELECT city, avg_spent
FROM (
    SELECT city, AVG(amount_spent) AS avg_spent
    FROM customers
    GROUP BY city
) AS cityavg
WHERE avg_spent > 200;


-- subquery in SELECT — adds a calculated column, same avg repeated on every row
SELECT name, age,
    age - (SELECT AVG(age) FROM customers) AS age_diff
FROM customers;


-- CTEs (WITH) below
-- kept forgetting FROM customers inside the CTE, subquery still needs its own FROM even in a CTE

WITH total_spent_cte AS (
    SELECT city, SUM(amount_spent) AS total_spent
    FROM customers
    GROUP BY city
)
SELECT city, total_spent
FROM total_spent_cte
WHERE total_spent > 400;

-- messed up the spelling of the cte name here first time (avg_age_cet vs avg_age_cte), match the names exactly
WITH avg_age_cte AS (
    SELECT city, AVG(age) AS avg_age
    FROM customers
    GROUP BY city
)
SELECT city, avg_age
FROM avg_age_cte
WHERE avg_age < 35;

WITH max_spent_city AS (
    SELECT city, MAX(amount_spent) AS max_spent
    FROM customers
    GROUP BY city
)
SELECT city, max_spent
FROM max_spent_city
WHERE max_spent > 500;


-- CTE that only returns ONE row (just the avg) needs a JOIN to attach to every customer row
-- no ON condition needed since there's only one row to match to everything
WITH avg_age_cte AS (
    SELECT AVG(age) AS avg_age
    FROM customers
)
SELECT c.name, c.age, c.age - a.avg_age AS age_diff
FROM customers c
JOIN avg_age_cte a;

-- same idea with amount_spent
-- broke this one twice: once put AS avg_amount right after the table name instead of after AVG(),
-- and once forgot to alias "customers c" then tried using c.name anyway (unknown column error)
WITH avg_amt AS (
    SELECT AVG(amount_spent) AS avg_amount
    FROM customers
)
SELECT c.name, c.amount_spent, c.amount_spent - a.avg_amount AS spent_diff
FROM customers c
JOIN avg_amt a;


