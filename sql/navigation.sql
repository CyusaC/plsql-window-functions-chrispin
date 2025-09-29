SELECT sale_date, amount,
       LAG(amount) OVER (ORDER BY sale_date) AS prev_sale,
       LEAD(amount) OVER (ORDER BY sale_date) AS next_sale
FROM transactions;
