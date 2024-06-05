-- Write a transaction query to lock the field quantity with product id = 211 from being updated
BEGIN
SELECT quantity FROM product WHERE id = 211
FOR UPDATE;
COMMIT;

-- Write a transaction query to lock row with product id = 211 from being updated
BEGIN
SELECT * FROM product WHERE id = 211
FOR UPDATE;
COMMIT;
