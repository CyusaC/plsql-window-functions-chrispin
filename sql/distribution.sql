-- ============================================
-- DISTRIBUTION FUNCTIONS
-- Purpose: Customer segmentation and percentiles
-- ============================================

-- Query 9: Customer Segmentation using NTILE
-- Uses: NTILE(4) to create quartiles
SELECT 
    customer_id,
    customer_name,
    region,
    total_spent,
    purchase_count,
    NTILE(4) OVER (ORDER BY total_spent DESC) as spending_quartile,
    CASE 
        WHEN NTILE(4) OVER (ORDER BY total_spent DESC) = 1 THEN 'VIP'
        WHEN NTILE(4) OVER (ORDER BY total_spent DESC) = 2 THEN 'High Value'
        WHEN NTILE(4) OVER (ORDER BY total_spent DESC) = 3 THEN 'Medium Value'
        ELSE 'Low Value'
    END as customer_segment
FROM (
    SELECT 
        c.customer_id,
        c.customer_name,
        c.region,
        SUM(t.amount) as total_spent,
        COUNT(*) as purchase_count
    FROM customers c
    JOIN transactions t ON c.customer_id = t.customer_id
    GROUP BY c.customer_id, c.customer_name, c.region
)
ORDER BY total_spent DESC;

-- Query 10: Cumulative Distribution
-- Uses: CUME_DIST and PERCENT_RANK
SELECT 
    customer_name,
    total_spent,
    ROUND(CUME_DIST() OVER (ORDER BY total_spent) * 100, 2) as cumulative_dist_pct,
    ROUND(PERCENT_RANK() OVER (ORDER BY total_spent) * 100, 2) as percent_rank,
    NTILE(10) OVER (ORDER BY total_spent DESC) as decile
FROM (
    SELECT 
        c.customer_name,
        SUM(t.amount) as total_spent
    FROM customers c
    JOIN transactions t ON c.customer_id = t.customer_id
    GROUP BY c.customer_name
)
ORDER BY total_spent DESC;

-- Query 11: Regional Customer Distribution
-- Uses: NTILE within each region
SELECT 
    region,
    customer_name,
    total_spent,
    NTILE(3) OVER (PARTITION BY region ORDER BY total_spent DESC) as regional_tier,
    CASE 
        WHEN NTILE(3) OVER (PARTITION BY region ORDER BY total_spent DESC) = 1 THEN 'Top Tier'
        WHEN NTILE(3) OVER (PARTITION BY region ORDER BY total_spent DESC) = 2 THEN 'Mid Tier'
        ELSE 'Entry Tier'
    END as tier_label
FROM (
    SELECT 
        c.region,
        c.customer_name,
        SUM(t.amount) as total_spent
    FROM customers c
    JOIN transactions t ON c.customer_id = t.customer_id
    GROUP BY c.region, c.customer_name
)
ORDER BY region, total_spent DESC;
