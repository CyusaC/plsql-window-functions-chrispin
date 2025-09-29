-- Aggregate Functions with Window Frames
-- Running totals and moving averages for sales

-- 1. Running total of sales by date
SELECT sale_date, SUM(amount) AS daily_sales,
       SUM(SUM(amount)) OVER (ORDER BY sale_date
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM transactions
GROUP BY sale_date;

-- 2. Running average of sales
SELECT sale_date, SUM(amount) AS daily_sales,
       AVG(SUM(amount)) OVER (ORDER BY sale_date
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_avg
FROM transactions
GROUP BY sale_date;

-- 3. 3-day moving average of sales
SELECT sale_date, SUM(amount) AS daily_sales,
       AVG(SUM(amount)) OVER (ORDER BY sale_date
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_3
FROM transactions
GROUP BY sale_date;

-- 4. Min and Max sales observed up to current row
SELECT sale_date, SUM(amount) AS daily_sales,
       MIN(SUM(amount)) OVER (ORDER BY sale_date
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS min_so_far,
       MAX(SUM(amount)) OVER (ORDER BY sale_date
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS max_so_far
FROM transactions
GROUP BY sale_date;
