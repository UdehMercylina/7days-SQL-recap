# SQL Recap — 7 Day Learning Journey

I'm learning SQL from scratch as part of building data analyst skills, alongside Excel and Python. This repo is my daily recap log — what I learned, what I got wrong, and the rules I'm locking in as I go.

## The Plan

| Day | Topic |
|---|---|
| 1 | SELECT, WHERE, ORDER BY, LIMIT, aggregate functions, GROUP BY, HAVING |
| 2 | JOINs (INNER, LEFT, RIGHT, self-joins) |
| 3 | Subqueries, CTEs |
| 4 | Window functions (ROW_NUMBER, RANK, PARTITION BY) |
| 5 | String/date functions, CASE statements, data cleaning |
| 6 | Mixed practice |
| 7 | Full mock case study |

## Progress Log

- ✅ **Day 1** — SQL basics: SELECT/FROM/WHERE/ORDER BY/LIMIT, aggregate functions, GROUP BY, HAVING. See [`day1_recap.md`](./day1_recap.md) and [`day1_basics.sql`](./day1_basics.sql).

## Day 1 — Key Rules I'm Locking In

1. Aggregate functions (`SUM`, `AVG`, `COUNT`, `MIN`, `MAX`) can never go inside `WHERE`.
2. `HAVING` never exists without `GROUP BY` — they're a package deal.
3. `HAVING` always needs a condition (e.g. `HAVING COUNT(*) > 3`), never just the raw function on its own.
4. Test for WHERE vs HAVING: filtering raw rows → `WHERE`. Filtering grouped/summarized results → `HAVING`.
5. `LIMIT` is a cutoff, not a filter — pairs with `ORDER BY` for "top N" results.
6. Clause order is fixed: `SELECT → FROM → WHERE → GROUP BY → HAVING → ORDER BY → LIMIT`
7. After `GROUP BY`, every column in `SELECT` must either be the grouped column or wrapped in an aggregate function.

Full breakdown of what I learned and the mistakes I made along the way: [`Day 1 sql.sql`](./Day%201%20sql.sql)

## Tools

- **MySQL Workbench** for writing and running queries
- Practice table: a custom `customers` dataset (30 rows, intentionally messy for data-cleaning practice)


Day 2 — Key Rules I'm Locking In
1.SELECT controls which columns show. JOIN controls which rows show — two separate decisions.
2.Dot notation (table.column) is needed once two tables share a column name, like customer_id.
3.Table aliases are my own choice — not tied to the first letter. AS is optional.
4.INNER JOIN → only rows matching in both tables. Unmatched rows are dropped.
5.LEFT vs RIGHT is decided by writing order: table after FROM = left, table after JOIN = right.
6.LEFT JOIN keeps every row from the left table, filling unmatched right-side columns with NULL.
7.RIGHT JOIN is the mirror — keeps every row from the right table instead.
8.NULL ≠ empty string. Never check = "" or = NULL — always use IS NULL.
9.A self-join joins a table to itself, using two aliases, to compare rows within one table.
10.<> blocks self-matches but still allows reversed duplicate pairs. Using > (or <) blocks both at once.

Full breakdown: day2_recap.md · Practice queries:[`Day 2 joins.sql`](./Day%202%20joins.sql)


Day 3 — Subqueries & CTEs
Points to remember
A subquery must be a complete query on its own — it needs its own SELECT and FROM, pointing to a real table.
Comparisons (>, <, =) go in the outer query, never inside the subquery/CTE itself.
Subquery returns one value → compare with =, >, <. Subquery returns multiple values → compare with IN / NOT IN.
A subquery in FROM must have an alias — MySQL needs a name for that temporary table.
Once the outer query is working with the subquery/CTE's result, treat its columns as plain columns — don't recalculate the aggregate again.
NULL can never be checked with = — always use IS NULL / IS NOT NULL.
An alias attaches to whatever comes immediately before it — placement matters (e.g. AS avg_amount must sit right after AVG(amount_spent), not after the table name).
A CTE (WITH) is a cleaner rewrite of a subquery-in-FROM — same logic, just named upfront instead of nested.
If the CTE already has everything you need (grouped values, etc.), the outer query is a simple SELECT ... FROM cte_name WHERE ... — no join needed.
If the CTE produces a single row (like one overall average) and you need to attach it to every row of another table, you need a JOIN — even with no ON condition, since there's nothing to match, just one row applied everywhere.
Every table used in the outer query needs its alias properly defined (FROM customers c) before you can reference it (c.name) — using an alias without declaring it throws "Unknown column."

Full breakdown: day2_recap.md · Practice queries:[`Day 3 CTEs.sql`](./Day%203%20CTEs.sql)

Next up: Day 4 — Window functions.
-- didn't do anything today 
