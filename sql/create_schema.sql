-- =====================================================
-- RwandaShop E-Commerce Database Schema
-- Course: INSY 8311 - Database Development with PL/SQL
-- Author: [Your Name]
-- Date: September 29, 2025
-- Safe CREATE script (drops wrapped to avoid errors if objects don't exist)
-- =====================================================

-- --------------------------
-- Safe drops for tables
-- --------------------------
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE transactions CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE products CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE customers CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- --------------------------
-- Safe drops for sequences
-- --------------------------
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE transaction_seq';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE product_seq';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE customer_seq';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- =====================================================
-- CREATE SEQUENCES
-- =====================================================
CREATE SEQUENCE customer_seq START WITH 1001 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE product_seq START WITH 2001 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE transaction_seq START WITH 3001 INCREMENT BY 1 NOCACHE NOCYCLE;

-- =====================================================
-- TABLE: CUSTOMERS
-- =====================================================
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    phone VARCHAR2(20),
    region VARCHAR2(50) NOT NULL,
    registration_date DATE DEFAULT SYSDATE,
    customer_status VARCHAR2(20) DEFAULT 'Active',
    CONSTRAINT chk_region CHECK (region IN ('Kigali', 'Huye', 'Musanze', 'Rubavu', 'Muhanga')),
    CONSTRAINT chk_status CHECK (customer_status IN ('Active', 'Inactive', 'Suspended'))
);

-- =====================================================
-- TABLE: PRODUCTS
-- =====================================================
CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL,
    category VARCHAR2(50) NOT NULL,
    unit_price NUMBER(12,2) NOT NULL,
    stock_quantity NUMBER DEFAULT 0,
    supplier VARCHAR2(100),
    date_added DATE DEFAULT SYSDATE,
    CONSTRAINT chk_category CHECK (category IN ('Electronics', 'Clothing', 'Home & Garden', 'Food & Beverages')),
    CONSTRAINT chk_price CHECK (unit_price > 0),
    CONSTRAINT chk_stock CHECK (stock_quantity >= 0)
);

-- =====================================================
-- TABLE: TRANSACTIONS
-- =====================================================
CREATE TABLE transactions (
    transaction_id NUMBER PRIMARY KEY,
    customer_id NUMBER NOT NULL,
    product_id NUMBER NOT NULL,
    transaction_date DATE NOT NULL,
    quantity NUMBER NOT NULL,
    unit_price NUMBER(12,2) NOT NULL,
    total_amount NUMBER(14,2) NOT NULL,
    payment_method VARCHAR2(30),
    transaction_status VARCHAR2(20) DEFAULT 'Completed',
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT chk_quantity CHECK (quantity > 0),
    CONSTRAINT chk_amount CHECK (total_amount > 0),
    CONSTRAINT chk_payment CHECK (payment_method IN ('Cash', 'Mobile Money', 'Card', 'Bank Transfer')),
    CONSTRAINT chk_trans_status CHECK (transaction_status IN ('Completed', 'Pending', 'Cancelled', 'Refunded'))
);

-- =====================================================
-- Helpful notes:
-- 1) Run this script first to create empty schema objects.
-- 2) Then run seed_data.sql (which contains INSERT ... and the PL/SQL populator).
-- 3) If you re-run frequently during development, keep the safe DROP blocks.
-- =====================================================

COMMIT;
