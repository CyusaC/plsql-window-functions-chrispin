# plsql-window-functions-chrispin

# PL/SQL Window Functions – Chrispin

## 📌 Problem Definition
**Business Context:**  
[Describe the company, department, and industry. Example: A retail company tracking product sales across regions.]

**Data Challenge:**  
[2–3 sentences describing the business problem. Example: The company struggles to identify top-performing products and customer buying patterns across different time periods.]

**Expected Outcome:**  
[What insights the analysis will deliver. Example: Support marketing campaigns, optimize inventory, and improve customer segmentation.]

---

## 🎯 Success Criteria
The analysis must achieve these 5 goals:

1. **Top 5 products per region/quarter** → `RANK()`
2. **Running monthly sales totals** → `SUM() OVER()`
3. **Month-over-month growth** → `LAG()` / `LEAD()`
4. **Customer quartiles** → `NTILE(4)`
5. **3-month moving averages** → `AVG() OVER()`

---

## 🗂 Database Schema
We designed **3 related tables**:

- **Customers**: `customer_id (PK), name, region`
- **Products**: `product_id (PK), name, category`
- **Transactions**: `transaction_id (PK), customer_id (FK), product_id (FK), sale_date, amount`

📊 **ER Diagram**  
![ER Diagram](docs/er_diagram.png)

SQL files:
- [`sql/schema.sql`](sql/schema.sql) → table definitions  
- [`sql/seed_data.sql`](sql/seed_data.sql) → sample dataset  

---

## 🔍 Window Functions Implementation

### 1. Ranking Functions
**Example Query:**  
```sql
SELECT customer_id, SUM(amount) AS total_sales,
       RANK() OVER (ORDER BY SUM(amount) DESC) AS sales_rank
FROM transactions
GROUP BY customer_id;
