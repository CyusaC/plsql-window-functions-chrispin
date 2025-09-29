-- =====================================================
-- seed_data.sql
-- Seed data for RwandaShop e-commerce schema
-- Place this file in: plsql-window-functions-chrispin/sql/01_seed_data.sql
-- Run AFTER create_schema.sql
-- =====================================================

-- =====================================================
-- INSERT SAMPLE DATA: CUSTOMERS (50 customers)
-- Uses customer_seq
-- =====================================================
INSERT ALL
    INTO customers VALUES (customer_seq.NEXTVAL, 'Jean', 'Mukiza', 'jean.mukiza@email.com', '0788123456', 'Kigali', DATE '2023-01-15', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Alice', 'Uwase', 'alice.uwase@email.com', '0788234567', 'Kigali', DATE '2023-02-20', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Patrick', 'Niyonzima', 'patrick.n@email.com', '0788345678', 'Huye', DATE '2023-03-10', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Grace', 'Mutesi', 'grace.mutesi@email.com', '0788456789', 'Musanze', DATE '2023-04-05', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'David', 'Habimana', 'david.h@email.com', '0788567890', 'Rubavu', DATE '2023-05-12', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Sarah', 'Iradukunda', 'sarah.i@email.com', '0788678901', 'Muhanga', DATE '2023-06-18', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Emmanuel', 'Bizimana', 'emmanuel.b@email.com', '0788789012', 'Kigali', DATE '2023-07-22', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Claire', 'Uwamahoro', 'claire.u@email.com', '0788890123', 'Kigali', DATE '2023-08-14', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Eric', 'Nkurunziza', 'eric.n@email.com', '0788901234', 'Huye', DATE '2023-09-09', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Diane', 'Mukamana', 'diane.m@email.com', '0789012345', 'Musanze', DATE '2023-10-03', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Francis', 'Ndayisenga', 'francis.n@email.com', '0789123456', 'Rubavu', DATE '2023-11-15', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Aline', 'Umutoni', 'aline.u@email.com', '0789234567', 'Muhanga', DATE '2023-12-01', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Joseph', 'Kayitare', 'joseph.k@email.com', '0789345678', 'Kigali', DATE '2024-01-10', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Marie', 'Ingabire', 'marie.i@email.com', '0789456789', 'Kigali', DATE '2024-01-25', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Samuel', 'Mugisha', 'samuel.m@email.com', '0789567890', 'Huye', DATE '2024-02-14', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Christine', 'Nyiransabimana', 'christine.n@email.com', '0789678901', 'Musanze', DATE '2024-03-05', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'John', 'Hakizimana', 'john.h@email.com', '0789789012', 'Rubavu', DATE '2024-03-20', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Beatrice', 'Uwineza', 'beatrice.u@email.com', '0789890123', 'Muhanga', DATE '2024-04-08', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Robert', 'Nshimiyimana', 'robert.n@email.com', '0789901234', 'Kigali', DATE '2024-04-22', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Jeanne', 'Mukandori', 'jeanne.m@email.com', '0780123456', 'Kigali', DATE '2024-05-10', 'Active')
SELECT * FROM dual;

-- Additional 30 customers (total 50)
INSERT ALL
    INTO customers VALUES (customer_seq.NEXTVAL, 'Paul', 'Uwizeyimana', 'paul.u@email.com', '0780234567', 'Huye', DATE '2024-05-25', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Agnes', 'Nyirahabimana', 'agnes.n@email.com', '0780345678', 'Musanze', DATE '2024-06-12', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Richard', 'Munyaneza', 'richard.m@email.com', '0780456789', 'Rubavu', DATE '2024-06-28', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Angelique', 'Uwera', 'angelique.u@email.com', '0780567890', 'Muhanga', DATE '2024-07-15', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Gilbert', 'Habyarimana', 'gilbert.h@email.com', '0780678901', 'Kigali', DATE '2024-07-30', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Immaculee', 'Mukeshimana', 'immaculee.m@email.com', '0780789012', 'Kigali', DATE '2024-08-14', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Vincent', 'Ntaganda', 'vincent.n@email.com', '0780890123', 'Huye', DATE '2024-08-28', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Claudine', 'Uwimana', 'claudine.u@email.com', '0780901234', 'Musanze', DATE '2024-09-10', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Fred', 'Nsengiyumva', 'fred.n@email.com', '0781012345', 'Rubavu', DATE '2024-09-22', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Esperance', 'Mukamazimpaka', 'esperance.m@email.com', '0781123456', 'Muhanga', DATE '2024-01-05', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Bernard', 'Kalisa', 'bernard.k@email.com', '0781234567', 'Kigali', DATE '2024-02-18', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Olive', 'Nyiramana', 'olive.n@email.com', '0781345678', 'Kigali', DATE '2024-03-12', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Isaac', 'Mugabo', 'isaac.m@email.com', '0781456789', 'Huye', DATE '2024-04-15', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Lydia', 'Mukarutabana', 'lydia.m@email.com', '0781567890', 'Musanze', DATE '2024-05-20', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Daniel', 'Niyongabo', 'daniel.n@email.com', '0781678901', 'Rubavu', DATE '2024-06-08', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Chantal', 'Uwamwezi', 'chantal.u@email.com', '0781789012', 'Muhanga', DATE '2024-07-22', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Simon', 'Hakizamungu', 'simon.h@email.com', '0781890123', 'Kigali', DATE '2024-08-05', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Josephine', 'Mukangango', 'josephine.m@email.com', '0781901234', 'Kigali', DATE '2024-08-19', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Kevin', 'Munyakazi', 'kevin.m@email.com', '0782012345', 'Huye', DATE '2024-09-02', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Fiona', 'Nyiraneza', 'fiona.n@email.com', '0782123456', 'Musanze', DATE '2024-09-15', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Albert', 'Nsabimana', 'albert.n@email.com', '0782234567', 'Rubavu', DATE '2024-01-28', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Solange', 'Umubyeyi', 'solange.u@email.com', '0782345678', 'Muhanga', DATE '2024-02-10', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Martin', 'Ntivuguruzwa', 'martin.n@email.com', '0782456789', 'Kigali', DATE '2024-03-25', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Yvonne', 'Mukamwezi', 'yvonne.m@email.com', '0782567890', 'Kigali', DATE '2024-04-30', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Leonard', 'Hagenimana', 'leonard.h@email.com', '0782678901', 'Huye', DATE '2024-05-15', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Nadine', 'Uwimbabazi', 'nadine.u@email.com', '0782789012', 'Musanze', DATE '2024-06-20', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Oscar', 'Ndizeye', 'oscar.n@email.com', '0782890123', 'Rubavu', DATE '2024-07-05', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Vestine', 'Mukarugwiza', 'vestine.m@email.com', '0782901234', 'Muhanga', DATE '2024-08-10', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Frank', 'Nkuranga', 'frank.n@email.com', '0783012345', 'Kigali', DATE '2024-08-25', 'Active')
    INTO customers VALUES (customer_seq.NEXTVAL, 'Daphine', 'Uwamahoro', 'daphine.u@email.com', '0783123456', 'Kigali', DATE '2024-09-12', 'Active')
SELECT * FROM dual;

COMMIT;

-- =====================================================
-- INSERT SAMPLE DATA: PRODUCTS (30 products)
-- Uses product_seq
-- =====================================================

INSERT ALL
    INTO products VALUES (product_seq.NEXTVAL, 'Samsung Galaxy S24', 'Electronics', 850000, 50, 'Samsung Rwanda', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'iPhone 15 Pro', 'Electronics', 1200000, 30, 'Apple Store', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Dell Laptop XPS 15', 'Electronics', 1500000, 25, 'Dell Rwanda', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'HP Pavilion Laptop', 'Electronics', 900000, 40, 'HP Distributors', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Sony Headphones WH-1000XM5', 'Electronics', 450000, 60, 'Sony Electronics', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Smart Watch Series 8', 'Electronics', 350000, 45, 'Tech Imports', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Wireless Keyboard & Mouse', 'Electronics', 45000, 100, 'Logitech Rwanda', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Men''s Business Suit', 'Clothing', 120000, 70, 'Fashion House RW', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Women''s Dress Collection', 'Clothing', 85000, 90, 'Kigali Fashions', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Kids School Uniform Set', 'Clothing', 35000, 150, 'School Supplies RW', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Sports Shoes Nike', 'Clothing', 95000, 80, 'Nike Rwanda', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Casual T-Shirts Pack', 'Clothing', 25000, 200, 'Casual Wear Ltd', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Winter Jacket', 'Clothing', 150000, 40, 'Winter Collection', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Designer Handbag', 'Clothing', 180000, 35, 'Luxury Imports', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Sofa Set 3-Seater', 'Home & Garden', 450000, 20, 'Furniture Plus', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Dining Table Set', 'Home & Garden', 380000, 25, 'Home Furnishings', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'King Size Mattress', 'Home & Garden', 320000, 30, 'Sleep Comfort RW', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'LED TV 55 inch', 'Electronics', 680000, 35, 'Electronics Hub', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Refrigerator 450L', 'Home & Garden', 550000, 28, 'Home Appliances', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Washing Machine 8kg', 'Home & Garden', 420000, 22, 'Appliance World', DATE '2024-01-01')
SELECT * FROM dual;

INSERT ALL
    INTO products VALUES (product_seq.NEXTVAL, 'Microwave Oven', 'Home & Garden', 85000, 50, 'Kitchen Essentials', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Coffee Maker Premium', 'Home & Garden', 120000, 40, 'Kitchen Pro', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Garden Tool Set', 'Home & Garden', 65000, 45, 'Garden Center RW', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Rice 25kg Bag', 'Food & Beverages', 35000, 200, 'Agri Foods Rwanda', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Cooking Oil 5L', 'Food & Beverages', 18000, 300, 'Food Supplies Ltd', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Premium Coffee Beans 1kg', 'Food & Beverages', 12000, 150, 'Rwanda Coffee', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Tea Assortment Pack', 'Food & Beverages', 8500, 180, 'Sorwathe Tea', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Fresh Fruit Basket', 'Food & Beverages', 15000, 100, 'Fresh Market RW', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Mineral Water 24-Pack', 'Food & Beverages', 12000, 250, 'Aqua Pure', DATE '2024-01-01')
    INTO products VALUES (product_seq.NEXTVAL, 'Snack Gift Hamper', 'Food & Beverages', 45000, 75, 'Gift Baskets RW', DATE '2024-01-01')
SELECT * FROM dual;

COMMIT;

-- =====================================================
-- INSERT SAMPLE DATA: TRANSACTIONS (explicit set for Jan-Feb 2024)
-- Uses transaction_seq
-- =====================================================

-- January 2024 sample transactions
INSERT ALL
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1001, 2001, DATE '2024-01-05', 1, 850000, 850000, 'Mobile Money', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1002, 2018, DATE '2024-01-07', 1, 680000, 680000, 'Card', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1003, 2024, DATE '2024-01-08', 2, 35000, 70000, 'Cash', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1004, 2009, DATE '2024-01-10', 3, 85000, 255000, 'Mobile Money', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1005, 2015, DATE '2024-01-12', 1, 450000, 450000, 'Bank Transfer', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1006, 2026, DATE '2024-01-14', 10, 12000, 120000, 'Cash', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1007, 2003, DATE '2024-01-15', 1, 1500000, 1500000, 'Card', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1008, 2011, DATE '2024-01-17', 2, 95000, 190000, 'Mobile Money', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1009, 2019, DATE '2024-01-19', 1, 550000, 550000, 'Bank Transfer', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1010, 2008, DATE '2024-01-20', 1, 120000, 120000, 'Cash', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1011, 2002, DATE '2024-01-22', 1, 1200000, 1200000, 'Card', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1012, 2025, DATE '2024-01-24', 15, 18000, 270000, 'Mobile Money', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1013, 2012, DATE '2024-01-25', 5, 25000, 125000, 'Cash', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1014, 2016, DATE '2024-01-26', 1, 380000, 380000, 'Bank Transfer', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1015, 2005, DATE '2024-01-28', 2, 450000, 900000, 'Card', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1016, 2027, DATE '2024-01-29', 20, 8500, 170000, 'Cash', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1017, 2020, DATE '2024-01-30', 1, 420000, 420000, 'Mobile Money', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1018, 2004, DATE '2024-01-31', 1, 900000, 900000, 'Card', 'Completed')
SELECT * FROM dual;

-- February 2024 sample transactions
INSERT ALL
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1019, 2001, DATE '2024-02-02', 1, 850000, 850000, 'Mobile Money', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1020, 2014, DATE '2024-02-03', 1, 180000, 180000, 'Card', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1021, 2028, DATE '2024-02-05', 5, 15000, 75000, 'Cash', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1022, 2002, DATE '2024-02-06', 1, 1200000, 1200000, 'Bank Transfer', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1023, 2006, DATE '2024-02-08', 1, 350000, 350000, 'Mobile Money', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1024, 2024, DATE '2024-02-10', 3, 35000, 105000, 'Cash', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1025, 2003, DATE '2024-02-12', 1, 1500000, 1500000, 'Card', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1026, 2030, DATE '2024-02-14', 10, 45000, 450000, 'Mobile Money', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1027, 2019, DATE '2024-02-15', 1, 550000, 550000, 'Bank Transfer', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1028, 2026, DATE '2024-02-16', 5, 12000, 60000, 'Cash', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1029, 2011, DATE '2024-02-18', 2, 95000, 190000, 'Mobile Money', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1030, 2008, DATE '2024-02-20', 1, 120000, 120000, 'Card', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1031, 2012, DATE '2024-02-22', 3, 25000, 75000, 'Cash', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1032, 2025, DATE '2024-02-24', 8, 18000, 144000, 'Mobile Money', 'Completed')
SELECT * FROM dual;

COMMIT;

-- =====================================================
-- PL/SQL POPULATOR: insert 170 random transactions (to exceed 200 total)
-- - random customer: 1001..1050
-- - random product: 2001..2030
-- - get product price from products table
-- - random qty: 1..5
-- - random date between 2024-01-01 and 2024-09-30 (~273 days)
-- - payment_method cycles through common methods
-- =====================================================

BEGIN
  DBMS_OUTPUT.ENABLE(NULL);
END;
/
SET SERVEROUTPUT ON SIZE 1000000;

DECLARE
  v_cust   NUMBER;
  v_prod   NUMBER;
  v_price  NUMBER(12,2);
  v_qty    NUMBER;
  v_date   DATE;
  v_pay    VARCHAR2(30);
  v_cnt    NUMBER := 0;
BEGIN
  FOR i IN 1..170 LOOP
    -- random customer 1001..1050
    v_cust := 1000 + TRUNC(DBMS_RANDOM.VALUE(1,51));
    -- random product 2001..2030
    v_prod := 2000 + TRUNC(DBMS_RANDOM.VALUE(1,31));

    -- get the product price (assumes product exists)
    BEGIN
      SELECT unit_price INTO v_price FROM products WHERE product_id = v_prod;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        v_price := 1000; -- fallback price if product id missing
    END;

    v_qty := TRUNC(DBMS_RANDOM.VALUE(1,6)); -- 1..5
    v_date := DATE '2024-01-01' + TRUNC(DBMS_RANDOM.VALUE(0, 273)); -- up to ~Sep 30

    CASE MOD(i,4)
      WHEN 0 THEN v_pay := 'Cash';
      WHEN 1 THEN v_pay := 'Mobile Money';
      WHEN 2 THEN v_pay := 'Card';
      WHEN 3 THEN v_pay := 'Bank Transfer';
    END CASE;

    INSERT INTO transactions (
      transaction_id, customer_id, product_id, transaction_date,
      quantity, unit_price, total_amount, payment_method, transaction_status
    ) VALUES (
      transaction_seq.NEXTVAL, v_cust, v_prod, v_date,
      v_qty, v_price, ROUND(v_qty * v_price, 2), v_pay, 'Completed'
    );

    v_cnt := v_cnt + 1;
  END LOOP;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Inserted ' || v_cnt || ' random transactions.');
END;
/

-- Final commit (redundant but safe)
COMMIT;

-- Quick verification queries you can run after this script:
-- SELECT COUNT(*) FROM customers;
-- SELECT COUNT(*) FROM products;
-- SELECT COUNT(*) FROM transactions;
-- SELECT transaction_date, total_amount FROM transactions WHERE ROWNUM <= 10 ORDER BY transaction_date;
