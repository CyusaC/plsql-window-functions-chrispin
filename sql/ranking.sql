-- ============================================
-- RANKING FUNCTIONS
-- Purpose: Identify top customers and products
-- ============================================

-- Query 1: Top 10 Customers by Total Revenue
-- Uses: ROW_NUMBER, RANK, DENSE_RANK
SELECT 
    customer_id,
    customer_name,
    region,
    total_revenue,
    ROW_NUMBER() OVER (ORDER BY total_revenue DESC) as row_num,
    RANK() OVER (ORDER BY total_revenue DESC) as revenue_rank,
    DENSE_RANK() OVER (ORDER BY total_revenue DESC) as dense_rank,
    ROUND(PERCENT_RANK() OVER (ORDER BY total_revenue DESC) * 100, 2) as percentile
FROM (
    SELECT 
        c.customer_id,
        c.customer_name,
        c.region,
        SUM(t.amount) as total_revenue
    FROM customers c
    JOIN transactions t ON c.customer_id = t.customer_id
    GROUP BY c.customer_id, c.customer_name, c.region
)
ORDER BY total_revenue DESC;

-- Query 2: Top 5 Products Per Region
-- Uses: RANK with PARTITION BY
SELECT *
FROM (
    SELECT 
        c.region,
        p.product_name,
        p.category,
        SUM(t.amount) as total_sales,
        RANK() OVER (PARTITION BY c.region ORDER BY SUM(t.amount) DESC) as region_rank
    FROM transactions t
    JOIN products p ON t.product_id = p.product_id
    JOIN customers c ON t.customer_id = c.customer_id
    GROUP BY c.region, p.product_name, p.category
)
WHERE region_rank <= 5
ORDER BY region, region_rank;
