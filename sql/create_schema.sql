    INTO transactions VALUES (transaction_seq.NEXTVAL, 1025, 2019, DATE '2024-02-15', 1, 550000, 550000, 'Bank Transfer', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1026, 2026, DATE '2024-02-16', 5, 12000, 60000, 'Cash', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1027, 2011, DATE '2024-02-18', 2, 95000, 190000, 'Mobile Money', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1028, 2008, DATE '2024-02-20', 1, 120000, 120000, 'Card', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1029, 2012, DATE '2024-02-22', 3, 25000, 75000, 'Cash', 'Completed')
    INTO transactions VALUES (transaction_seq.NEXTVAL, 1030, 2025, DATE '2024-02-24', 8, 18000, 144000, 'Mobile Money', 'Completed')
SELECT * FROM dual;

COMMIT;

-- =====================================================
-- QUICK POPULATOR: create additional random transactions
-- This PL/SQL block inserts 150 more transactions to reach 200+ total.
-- It picks a random customer_id between 1001 and 1050, a random product_id
-- between 2001 and 2030, uses the product's unit_price, random qty 1-5,
-- random date between 2024-01-01 and 2024-09-30, and cycles payment methods.
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
  FOR i IN 1..150 LOOP
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
