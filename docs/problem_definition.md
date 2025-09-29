# Problem Definition

## Business Context
**Company**: Rwanda Coffee House Chain
**Department**: Sales Analytics & Business Intelligence
**Industry**: Retail Food & Beverage

The Rwanda Coffee House operates 12 locations across Kigali, Musanze, and Huye regions. With over 5,000 monthly transactions and 200+ product offerings, management needs data-driven insights to optimize inventory, identify high-value customers, and track regional performance trends.

## Data Challenge
The management team currently lacks visibility into product performance rankings by region, customer purchase patterns over time, and seasonal sales trends. Without window function analytics, they cannot effectively identify their top-performing products per quarter, segment customers by purchase frequency, or calculate period-over-period growth rates. This gap prevents strategic decisions about inventory allocation, targeted marketing campaigns, and regional expansion planning.

## Expected Outcome
Implement a comprehensive analytical solution using PL/SQL window functions to:
1. Rank top-performing products by region and quarter for inventory optimization
2. Calculate running sales totals and moving averages to identify trends
3. Analyze month-over-month growth rates to detect seasonal patterns
4. Segment customers into quartiles for targeted marketing campaigns
5. Identify high-value customers and their purchasing behaviors

These insights will enable management to make data-driven decisions on product stocking, promotional campaigns, and resource allocation across regions.

## Success Criteria

### 1. Product Performance Ranking (Using RANK, DENSE_RANK, ROW_NUMBER)
**Goal**: Identify top 5 products per region per quarter based on total sales revenue
**Metric**: Products ranked by revenue with ability to handle ties
**Business Value**: Optimize regional inventory and promotional focus

### 2. Running Sales Analysis (Using SUM() OVER with Frame Clauses)
**Goal**: Calculate cumulative monthly sales totals for each region
**Metric**: Running total from year start to current month
**Business Value**: Track progress toward quarterly and annual targets

### 3. Period-over-Period Growth Analysis (Using LAG/LEAD)
**Goal**: Calculate month-over-month revenue growth percentage for each product category
**Metric**: Percentage change from previous month
**Business Value**: Identify trending products and seasonal patterns

### 4. Customer Segmentation (Using NTILE)
**Goal**: Divide customers into 4 quartiles based on total purchase amount
**Metric**: Top 25% (Premium), 25-50% (Gold), 50-75% (Silver), Bottom 25% (Bronze)
**Business Value**: Enable targeted marketing and loyalty programs

### 5. Trend Smoothing (Using AVG() OVER with ROWS)
**Goal**: Calculate 3-month moving average of sales for trend analysis
**Metric**: Average of current month and previous 2 months
**Business Value**: Smooth out volatility to identify true underlying trends

---

**Document Version**: 1.0
**Last Updated**: September 29, 2025
**Author**: Chrispin
