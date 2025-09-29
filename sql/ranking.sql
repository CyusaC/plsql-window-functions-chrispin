-- Ranking Functions Examples
-- Find top customers by total sales using ROW_NUMBER, RANK, and DENSE_RANK

-- 1. ROW_NUMBER: assigns unique numbers to each customer ordered by sales
SELECT customer_id, SUM(amount) AS total_sales,
       ROW_NUMBER() OVER (ORDER BY SUM(amount) DESC) AS row_num
FROM transactions
GROUP BY customer_id;

-- 2. RANK: allows ties (same sales amount get same rank, gaps appear)
SELECT customer_id, SUM(amount) AS total_sales,
       RANK() OVER (ORDER BY SUM(amount) DESC) AS sales_rank
FROM transactions
GROUP BY customer_id;

-- 3. DENSE_RANK: similar to RANK, but no gaps in ranking
SELECT customer_id, SUM(amount) AS total_sales,
       DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS dense_sales_rank
FROM transactions
GROUP BY customer_id;

-- 4. PERCENT_RANK: relative rank percentage of each customer
SELECT customer_id, SUM(amount) AS total_sales,
       PERCENT_RANK() OVER (ORDER BY SUM(amount) DESC) AS pct_rank
FROM transactions
GROUP BY customer_id;
