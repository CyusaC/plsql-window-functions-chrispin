-- ============================================
-- NAVIGATION FUNCTIONS (LAG/LEAD)
-- Purpose: Period-to-period comparisons
-- ============================================

-- Query 6: Month-over-Month Growth Analysis
-- Uses: LAG and LEAD
SELECT 
    month,
    monthly_sales,
    LAG(monthly_sales, 1) OVER (ORDER BY month) as previous_month,
    LEAD(monthly_sales, 1) OVER (ORDER BY month) as next_month,
    monthly_sales - LAG(monthly_sales, 1) OVER (ORDER BY month) as mom_change,
    ROUND((monthly_sales - LAG(monthly_sales, 1) OVER (ORDER BY month)) / 
          NULLIF(LAG(monthly_sales, 1) OVER (ORDER BY month), 0) * 100, 2) as mom_growth_pct
FROM (
    SELECT 
        TO_CHAR(sale_date, 'YYYY-MM') as month,
        SUM(amount) as monthly_sales
    FROM transactions
    GROUP BY TO_CHAR(sale_date, 'YYYY-MM')
)
ORDER BY month;

-- Query 7: Customer Purchase Frequency Analysis
-- Uses: LAG to find days between purchases
SELECT 
    customer_name,
    sale_date,
    amount,
    LAG(sale_date) OVER (PARTITION BY customer_id ORDER BY sale_date) as previous_purchase,
    sale_date - LAG(sale_date) OVER (PARTITION BY customer_id ORDER BY sale_date) as days_since_last
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
ORDER BY customer_name, sale_date;

-- Query 8: First and Last Purchase Comparison
-- Uses: FIRST_VALUE and LAST_VALUE
SELECT DISTINCT
    c.customer_id,
    c.customer_name,
    FIRST_VALUE(t.sale_date) OVER (PARTITION BY c.customer_id 
                                    ORDER BY t.sale_date 
                                    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as first_purchase,
    LAST_VALUE(t.sale_date) OVER (PARTITION BY c.customer_id 
                                   ORDER BY t.sale_date 
                                   ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as last_purchase,
    FIRST_VALUE(t.amount) OVER (PARTITION BY c.customer_id 
                                ORDER BY t.sale_date 
                                ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as first_amount,
    LAST_VALUE(t.amount) OVER (PARTITION BY c.customer_id 
                               ORDER BY t.sale_date 
                               ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as last_amount
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
ORDER BY customer_name;
