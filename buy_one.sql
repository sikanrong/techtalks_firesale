DROP FUNCTION IF EXISTS buy_first_available(int);
CREATE OR REPLACE FUNCTION buy_first_available(prod_sku int)
RETURNS void as $$
DECLARE
  invrow int;
  pmtrow int;
BEGIN 
  SELECT id 
    INTO invrow 
    FROM inventory 
    WHERE 
      "sku"=prod_sku 
      AND "payment_id" IS NULL
    LIMIT 1 
    FOR UPDATE SKIP LOCKED;

  INSERT INTO payments default values;
  SELECT payment_id INTO pmtrow FROM payments ORDER BY payment_id DESC LIMIT 1;
  UPDATE inventory SET "payment_id"=pmtrow WHERE "id"=invrow; 
END;
$$ LANGUAGE plpgsql;

-- now attempt to buy something with SKU = 1
SELECT buy_first_available(1);
