SELECT customer_id, SUM(amount) AS total_sales,
       NTILE(4) OVER (ORDER BY SUM(amount) DESC) AS sales_quartile
FROM transactions
GROUP BY customer_id;
