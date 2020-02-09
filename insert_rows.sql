TRUNCATE inventory CASCADE;
TRUNCATE products CASCADE;

INSERT INTO products (
  sku,
  name,
  prod_desc,
  image_url,
  price
) VALUES(
  1,
  'Spiderman Nikes',
  'These Limited Edition Spiderman Nikes are flying off the shelf, yo!',
  'http://mycoolsite.com/firesale/spnikes.jpg',
  60.99
);

INSERT INTO inventory (
  sku
) 
VALUES 
  (1),
  (1),
  (1),
  (1),
  (1),
  (1),
  (1),
  (1),
  (1),
  (1),
  (1),
  (1),
  (1);
