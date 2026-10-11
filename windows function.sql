use practice ;

-- Day 4 — Window Functions

-- ROW_NUMBER() — unique number per row, no repeats even on ties
-- first attempt i used DESC here by mistake (oldest to youngest), question wanted youngest to oldest so needed ASC
SELECT name, age,
    ROW_NUMBER() OVER (ORDER BY age ASC) AS age_rank
FROM customers;


-- RANK() with PARTITION BY — resets ranking per city instead of across the whole table
SELECT city, amount_spent,
    RANK() OVER (PARTITION BY city ORDER BY amount_spent DESC) AS spent_in_city
FROM customers;


-- SUM() OVER() — running total across the whole table, highest spender first
SELECT name, amount_spent,
    SUM(amount_spent) OVER (ORDER BY amount_spent DESC) AS running_total
FROM customers;

-- same running total, but PARTITION BY city resets it back to zero for each new city
SELECT name, city, amount_spent,
    SUM(amount_spent) OVER (PARTITION BY city ORDER BY amount_spent DESC) AS running_total
FROM customers;


-- LEAD() — shows the next row's value based on the ORDER BY
SELECT name, amount_spent,
    LEAD(amount_spent) OVER (ORDER BY amount_spent DESC) AS next_customer_spent
FROM customers;