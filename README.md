# SQL Recap — 7 Day Learning Journey

I'm learning SQL from scratch as part of building data analyst skills, alongside Excel and Python which i have prior knowladge in . This repo is my daily recap log — what I learned, what I got wrong, and the rules I'm locking in as I go.

## Breakdown

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

- ✅ **Day 1** — SELECT/FROM/WHERE/ORDER BY/LIMIT, aggregate functions, GROUP BY, HAVING. See day1_recap.md and day 1 sql.sql.
## Day 1 — Key Rules I'm Locking In

1. Aggregate functions (`SUM`, `AVG`, `COUNT`, `MIN`, `MAX`) can never go inside `WHERE`.
2. `HAVING` never exists without `GROUP BY` — they're a package deal.
3. `HAVING` always needs a condition (e.g. `HAVING COUNT(*) > 3`), never just the raw function on its own.
4. Test for WHERE vs HAVING: filtering raw rows → `WHERE`. Filtering grouped/summarized results → `HAVING`.
5. `LIMIT` is a cutoff, not a filter — pairs with `ORDER BY` for "top N" results.
6. Clause order is fixed: `SELECT → FROM → WHERE → GROUP BY → HAVING → ORDER BY → LIMIT`
7. After `GROUP BY`, every column in `SELECT` must either be the grouped column or wrapped in an aggregate function.

Full breakdown of what I learned and the mistakes I made along the way: [`Day 1 sql.sql`](./Day 1 sql.sql)

## Tools

- **MySQL Workbench** for writing and running queries
- Practice table: a custom `customers` dataset (30 rows, intentionally messy for data-cleaning practice)
