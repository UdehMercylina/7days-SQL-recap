use practice;

select city from customers;

SELECT upper(TRIM(city)) AS clean_city
FROM customers;

SELECT name, LENGTH(name) AS before_trim, LENGTH(TRIM(name)) AS after_trim
FROM customers;

SELECT CONCAT(name, ' from ', city) AS summary
FROM customers;

SELECT CONCAT(name, ' - Age: ', age, ' - Spent: ', amount_spent) AS full_summary
FROM customers;

select name, length(name)
from customers;

SELECT DISTINCT TRIM(city) AS clean_city
FROM customers;

select concat ( name , ' lives in ' ,  city) as  summary
from Customers;



select name, purchase_date from customers
where year(purchase_date) = 2025;


SELECT name,purchase_date, DATEDIFF(NOW(), purchase_date) AS days_ago
FROM customers;


SELECT name, amount_spent,
    CASE
        WHEN amount_spent > 500 THEN 'High Spender'
        WHEN amount_spent > 100 THEN 'Medium Spender'
        ELSE 'Low Spender'
    END AS spender_category
FROM customers;

-- Write a query using CASE to label customers as 'Senior' (age 50+), 'Adult' (age 30-49), or 'Young' (under 30).
 select name, age,
 case 
      when age > 50 Then 'Sinior'
      when age > 30 then 'Adult'
      when age < 30 then 'young'
end as Age_group
from customers;      

-- label cities as 'Major City' if Lagos or Abuja, otherwise 'Other City'.
select city,
case
 when city = "Lagos" then 'major city'
  when city = "Abuja" then 'major city'
 else 'other city'
end as city_label


-- Day 5 — String Functions, Date Functions, CASE


-- ---- String functions ----

-- TRIM alone, just fixes spacing, doesn't touch case
SELECT TRIM(city) AS clean_city
FROM customers;

-- TRIM + UPPER together, fixes spacing AND casing in one go
SELECT UPPER(TRIM(city)) AS clean_city
FROM customers;

-- LENGTH — counts characters including spaces
SELECT name, LENGTH(name) AS name_length
FROM customers;

-- comparing length before/after trim shows which rows had extra spaces
SELECT name, LENGTH(name) AS before_trim, LENGTH(TRIM(name)) AS after_trim
FROM customers;

-- CONCAT — joins columns + plain text together
-- forgot spaces inside the quotes at first, 'lives in' needs to be ' lives in ' or it all mashes together
SELECT CONCAT(name, ' lives in ', city) AS summary
FROM customers;

-- DISTINCT on the cleaned value, not GROUP BY on the raw column
-- tried GROUP BY city here first which still left duplicates since it grouped on the messy raw version
SELECT DISTINCT TRIM(city) AS clean_city
FROM customers;


-- ---- Date functions ----

SELECT name, MONTH(purchase_date) AS purchase_month
FROM customers;

-- stray comma before FROM broke this the first time, watch trailing commas
SELECT name, purchase_date, DATEDIFF(NOW(), purchase_date) AS days_ago
FROM customers;

SELECT name, purchase_date
FROM customers
WHERE YEAR(purchase_date) = 2025;


-- ---- CASE statements ----

-- first attempt had no ELSE and used > / < with gaps, so exactly 30 or exactly 50 fell through as NULL
-- fixed with >= on both boundaries and ELSE catching everything under 30
SELECT name, age,
    CASE
        WHEN age >= 50 THEN 'Senior'
        WHEN age >= 30 THEN 'Adult'
        ELSE 'Young'
    END AS age_group
FROM customers;

-- first attempt compared city = 'Lagos' / 'Abuja' directly, missed messy casing/spacing
-- wrapped both sides in UPPER(TRIM()) so 'lagos', '  Lagos  ', 'ABUJA' all match correctly
SELECT city,
    CASE
        WHEN UPPER(TRIM(city)) = 'LAGOS' THEN 'Major City'
        WHEN UPPER(TRIM(city)) = 'ABUJA' THEN 'Major City'
        ELSE 'Other City'
    END AS city_label
FROM customers;
