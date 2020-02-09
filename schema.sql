DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS payments CASCADE;
DROP TABLE IF EXISTS inventory CASCADE;
DROP SEQUENCE IF EXISTS inventory_sequence;
DROP SEQUENCE IF EXISTS payment_sequence;

CREATE SEQUENCE inventory_sequence
  start 1
  increment 1;

CREATE SEQUENCE payment_sequence
  start 1
  increment 1;

CREATE TABLE products (
  sku int PRIMARY KEY,
  name varchar(255),
  prod_desc text,
  image_url varchar(255),
  price float4
);

CREATE TABLE payments (
  payment_id int PRIMARY KEY DEFAULT nextval('payment_sequence')
);

CREATE TABLE inventory (
  id int PRIMARY KEY DEFAULT nextval('inventory_sequence'),
  sku int REFERENCES products(sku),
  payment_id int REFERENCES payments(payment_id) DEFAULT null
);





