-- Query 5: Compare ROWS vs RANGE window frames
-- Demonstrates difference between ROWS and RANGE
SELECT 
    TO_CHAR(sale_date, 'YYYY-MM') as month,
    SUM(amount) as monthly_sales,
    -- ROWS: counts exactly 3 rows (current + 2 preceding)
    SUM(SUM(amount)) OVER (ORDER BY TO_CHAR(sale_date, 'YYYY-MM') 
                           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as sum_rows_3m,
    -- RANGE: includes all rows with same ORDER BY value
    SUM(SUM(amount)) OVER (ORDER BY TO_CHAR(sale_date, 'YYYY-MM') 
                           RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as sum_range_running
FROM transactions
GROUP BY TO_CHAR(sale_date, 'YYYY-MM')
ORDER BY month;
