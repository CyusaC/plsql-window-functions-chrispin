-- ============================================
-- PLSQL Window Functions Assignment
-- Schema Setup for Live SQL
-- ============================================

-- Create CUSTOMERS table
CREATE TABLE customers (
    customer_id NUMBER CONSTRAINT pk_customers PRIMARY KEY,
    customer_name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100),
    region VARCHAR2(50) NOT NULL,
    join_date DATE DEFAULT SYSDATE
);

-- Create PRODUCTS table
CREATE TABLE products (
    product_id NUMBER CONSTRAINT pk_products PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL,
    category VARCHAR2(50) NOT NULL,
    unit_price NUMBER(10,2) NOT NULL
);

-- Create TRANSACTIONS table
CREATE TABLE transactions (
    transaction_id NUMBER CONSTRAINT pk_transactions PRIMARY KEY,
    customer_id NUMBER NOT NULL,
    product_id NUMBER NOT NULL,
    sale_date DATE DEFAULT SYSDATE,
    quantity NUMBER NOT NULL,
    amount NUMBER(10,2) NOT NULL,
    CONSTRAINT fk_trans_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_trans_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert sample customers (20 customers)
INSERT ALL
    INTO customers VALUES (1001, 'John Doe', 'john@email.com', 'Kigali', DATE '2024-01-15')
    INTO customers VALUES (1002, 'Jane Smith', 'jane@email.com', 'Musanze', DATE '2024-02-20')
    INTO customers VALUES (1003, 'Bob Johnson', 'bob@email.com', 'Rubavu', DATE '2024-03-10')
    INTO customers VALUES (1004, 'Alice Brown', 'alice@email.com', 'Kigali', DATE '2024-01-25')
    INTO customers VALUES (1005, 'Charlie Davis', 'charlie@email.com', 'Huye', DATE '2024-04-05')
    INTO customers VALUES (1006, 'Emma Wilson', 'emma@email.com', 'Kigali', DATE '2024-02-15')
    INTO customers VALUES (1007, 'Frank Miller', 'frank@email.com', 'Musanze', DATE '2024-03-20')
    INTO customers VALUES (1008, 'Grace Lee', 'grace@email.com', 'Rubavu', DATE '2024-01-30')
    INTO customers VALUES (1009, 'Henry Taylor', 'henry@email.com', 'Kigali', DATE '2024-04-12')
    INTO customers VALUES (1010, 'Ivy Anderson', 'ivy@email.com', 'Huye', DATE '2024-02-28')
    INTO customers VALUES (1011, 'Jack Thomas', 'jack@email.com', 'Kigali', DATE '2024-03-05')
    INTO customers VALUES (1012, 'Kelly White', 'kelly@email.com', 'Musanze', DATE '2024-01-18')
    INTO customers VALUES (1013, 'Leo Martin', 'leo@email.com', 'Rubavu', DATE '2024-04-22')
    INTO customers VALUES (1014, 'Mia Garcia', 'mia@email.com', 'Kigali', DATE '2024-02-10')
    INTO customers VALUES (1015, 'Noah Martinez', 'noah@email.com', 'Huye', DATE '2024-03-15')
    INTO customers VALUES (1016, 'Olivia Lopez', 'olivia@email.com', 'Kigali', DATE '2024-01-20')
    INTO customers VALUES (1017, 'Paul Gonzalez', 'paul@email.com', 'Musanze', DATE '2024-04-08')
    INTO customers VALUES (1018, 'Quinn Rodriguez', 'quinn@email.com', 'Rubavu', DATE '2024-02-25')
    INTO customers VALUES (1019, 'Ryan Hernandez', 'ryan@email.com', 'Kigali', DATE '2024-03-18')
    INTO customers VALUES (1020, 'Sophia Perez', 'sophia@email.com', 'Huye', DATE '2024-01-28')
SELECT * FROM dual;

-- Insert sample products (15 products)
INSERT ALL
    INTO products VALUES (2001, 'Coffee Beans', 'Beverages', 25000)
    INTO products VALUES (2002, 'Laptop', 'Electronics', 850000)
    INTO products VALUES (2003, 'Tea Leaves', 'Beverages', 15000)
    INTO products VALUES (2004, 'Smartphone', 'Electronics', 450000)
    INTO products VALUES (2005, 'Rice 5kg', 'Food', 8000)
    INTO products VALUES (2006, 'Cooking Oil', 'Food', 12000)
    INTO products VALUES (2007, 'Tablet', 'Electronics', 320000)
    INTO products VALUES (2008, 'Juice Pack', 'Beverages', 5000)
    INTO products VALUES (2009, 'Beans 2kg', 'Food', 3500)
    INTO products VALUES (2010, 'Headphones', 'Electronics', 45000)
    INTO products VALUES (2011, 'Energy Drink', 'Beverages', 2500)
    INTO products VALUES (2012, 'Monitor', 'Electronics', 280000)
    INTO products VALUES (2013, 'Flour 10kg', 'Food', 15000)
    INTO products VALUES (2014, 'Mineral Water', 'Beverages', 1000)
    INTO products VALUES (2015, 'Keyboard', 'Electronics', 35000)
SELECT * FROM dual;

-- Insert sample transactions (100+ transactions across 8 months)
INSERT ALL
    -- January 2024
    INTO transactions VALUES (3001, 1001, 2001, DATE '2024-01-15', 2, 50000)
    INTO transactions VALUES (3002, 1004, 2002, DATE '2024-01-16', 1, 850000)
    INTO transactions VALUES (3003, 1006, 2005, DATE '2024-01-17', 3, 24000)
    INTO transactions VALUES (3004, 1009, 2008, DATE '2024-01-18', 5, 25000)
    INTO transactions VALUES (3005, 1011, 2010, DATE '2024-01-19', 1, 45000)
    INTO transactions VALUES (3006, 1014, 2003, DATE '2024-01-20', 2, 30000)
    INTO transactions VALUES (3007, 1016, 2006, DATE '2024-01-21', 4, 48000)
    INTO transactions VALUES (3008, 1019, 2009, DATE '2024-01-22', 5, 17500)
    INTO transactions VALUES (3009, 1001, 2011, DATE '2024-01-23', 10, 25000)
    INTO transactions VALUES (3010, 1004, 2015, DATE '2024-01-24', 2, 70000)
    -- February 2024
    INTO transactions VALUES (3011, 1002, 2002, DATE '2024-02-10', 1, 850000)
    INTO transactions VALUES (3012, 1005, 2004, DATE '2024-02-11', 1, 450000)
    INTO transactions VALUES (3013, 1010, 2007, DATE '2024-02-12', 1, 320000)
    INTO transactions VALUES (3014, 1014, 2001, DATE '2024-02-13', 3, 75000)
    INTO transactions VALUES (3015, 1018, 2005, DATE '2024-02-14', 2, 16000)
    INTO transactions VALUES (3016, 1003, 2012, DATE '2024-02-15', 1, 280000)
    INTO transactions VALUES (3017, 1006, 2013, DATE '2024-02-16', 2, 30000)
    INTO transactions VALUES (3018, 1009, 2003, DATE '2024-02-17', 4, 60000)
    INTO transactions VALUES (3019, 1011, 2006, DATE '2024-02-18', 3, 36000)
    INTO transactions VALUES (3020, 1016, 2008, DATE '2024-02-19', 8, 40000)
    -- March 2024
    INTO transactions VALUES (3021, 1003, 2002, DATE '2024-03-05', 1, 850000)
    INTO transactions VALUES (3022, 1007, 2004, DATE '2024-03-06', 1, 450000)
    INTO transactions VALUES (3023, 1011, 2007, DATE '2024-03-07', 1, 320000)
    INTO transactions VALUES (3024, 1015, 2010, DATE '2024-03-08', 2, 90000)
    INTO transactions VALUES (3025, 1019, 2001, DATE '2024-03-09', 4, 100000)
    INTO transactions VALUES (3026, 1001, 2005, DATE '2024-03-10', 5, 40000)
    INTO transactions VALUES (3027, 1004, 2009, DATE '2024-03-11', 6, 21000)
    INTO transactions VALUES (3028, 1006, 2011, DATE '2024-03-12', 12, 30000)
    INTO transactions VALUES (3029, 1009, 2014, DATE '2024-03-13', 20, 20000)
    INTO transactions VALUES (3030, 1014, 2015, DATE '2024-03-14', 3, 105000)
SELECT * FROM dual;

INSERT ALL
    -- April 2024
    INTO transactions VALUES (3031, 1005, 2002, DATE '2024-04-05', 1, 850000)
    INTO transactions VALUES (3032, 1010, 2012, DATE '2024-04-06', 1, 280000)
    INTO transactions VALUES (3033, 1013, 2004, DATE '2024-04-07', 1, 450000)
    INTO transactions VALUES (3034, 1017, 2007, DATE '2024-04-08', 1, 320000)
    INTO transactions VALUES (3035, 1020, 2003, DATE '2024-04-09', 5, 75000)
    INTO transactions VALUES (3036, 1002, 2001, DATE '2024-04-10', 3, 75000)
    INTO transactions VALUES (3037, 1005, 2008, DATE '2024-04-11', 10, 50000)
    INTO transactions VALUES (3038, 1008, 2005, DATE '2024-04-12', 4, 32000)
    INTO transactions VALUES (3039, 1012, 2006, DATE '2024-04-13', 5, 60000)
    INTO transactions VALUES (3040, 1015, 2013, DATE '2024-04-14', 3, 45000)
    -- May 2024
    INTO transactions VALUES (3041, 1001, 2002, DATE '2024-05-01', 1, 850000)
    INTO transactions VALUES (3042, 1003, 2004, DATE '2024-05-02', 1, 450000)
    INTO transactions VALUES (3043, 1006, 2012, DATE '2024-05-03', 1, 280000)
    INTO transactions VALUES (3044, 1009, 2007, DATE '2024-05-04', 1, 320000)
    INTO transactions VALUES (3045, 1011, 2010, DATE '2024-05-05', 3, 135000)
    INTO transactions VALUES (3046, 1014, 2001, DATE '2024-05-06', 2, 50000)
    INTO transactions VALUES (3047, 1016, 2003, DATE '2024-05-07', 3, 45000)
    INTO transactions VALUES (3048, 1019, 2005, DATE '2024-05-08', 6, 48000)
    INTO transactions VALUES (3049, 1002, 2015, DATE '2024-05-09', 4, 140000)
    INTO transactions VALUES (3050, 1005, 2011, DATE '2024-05-10', 15, 37500)
    -- June 2024
    INTO transactions VALUES (3051, 1004, 2004, DATE '2024-06-15', 1, 450000)
    INTO transactions VALUES (3052, 1007, 2002, DATE '2024-06-16', 1, 850000)
    INTO transactions VALUES (3053, 1010, 2007, DATE '2024-06-17', 1, 320000)
    INTO transactions VALUES (3054, 1012, 2012, DATE '2024-06-18', 1, 280000)
    INTO transactions VALUES (3055, 1015, 2001, DATE '2024-06-19', 4, 100000)
    INTO transactions VALUES (3056, 1018, 2003, DATE '2024-06-20', 5, 75000)
    INTO transactions VALUES (3057, 1020, 2008, DATE '2024-06-21', 12, 60000)
    INTO transactions VALUES (3058, 1001, 2006, DATE '2024-06-22', 6, 72000)
    INTO transactions VALUES (3059, 1003, 2009, DATE '2024-06-23', 8, 28000)
    INTO transactions VALUES (3060, 1006, 2014, DATE '2024-06-24', 25, 25000)
SELECT * FROM dual;

INSERT ALL
    -- July 2024
    INTO transactions VALUES (3061, 1008, 2002, DATE '2024-07-10', 1, 850000)
    INTO transactions VALUES (3062, 1011, 2004, DATE '2024-07-11', 1, 450000)
    INTO transactions VALUES (3063, 1013, 2012, DATE '2024-07-12', 1, 280000)
    INTO transactions VALUES (3064, 1016, 2007, DATE '2024-07-13', 1, 320000)
    INTO transactions VALUES (3065, 1019, 2010, DATE '2024-07-14', 2, 90000)
    INTO transactions VALUES (3066, 1002, 2015, DATE '2024-07-15', 5, 175000)
    INTO transactions VALUES (3067, 1005, 2001, DATE '2024-07-16', 3, 75000)
    INTO transactions VALUES (3068, 1009, 2003, DATE '2024-07-17', 4, 60000)
    INTO transactions VALUES (3069, 1014, 2005, DATE '2024-07-18', 7, 56000)
    INTO transactions VALUES (3070, 1017, 2011, DATE '2024-07-19', 20, 50000)
    -- August 2024
    INTO transactions VALUES (3071, 1001, 2004, DATE '2024-08-20', 1, 450000)
    INTO transactions VALUES (3072, 1004, 2012, DATE '2024-08-21', 1, 280000)
    INTO transactions VALUES (3073, 1006, 2002, DATE '2024-08-22', 1, 850000)
    INTO transactions VALUES (3074, 1010, 2007, DATE '2024-08-23', 1, 320000)
    INTO transactions VALUES (3075, 1012, 2010, DATE '2024-08-24', 4, 180000)
    INTO transactions VALUES (3076, 1015, 2015, DATE '2024-08-25', 6, 210000)
    INTO transactions VALUES (3077, 1018, 2001, DATE '2024-08-26', 5, 125000)
    INTO transactions VALUES (3078, 1020, 2003, DATE '2024-08-27', 6, 90000)
    INTO transactions VALUES (3079, 1003, 2008, DATE '2024-08-28', 15, 75000)
    INTO transactions VALUES (3080, 1007, 2013, DATE '2024-08-29', 4, 60000)
SELECT * FROM dual;

COMMIT;

-- Verify data
SELECT 'Data loaded successfully!' AS status FROM dual;
SELECT 'Customers: ' || COUNT(*) AS count FROM customers;
SELECT 'Products: ' || COUNT(*) AS count FROM products;
SELECT 'Transactions: ' || COUNT(*) AS count FROM transactions;
