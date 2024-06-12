# Write SQL query to search for all products with the word "laptop" in either product name or description.
## Initial Query:
```
SELECT * FROM product
WHERE "name" ILIKE '%camera%';
```
## Query Plan Before:
![image](https://github.com/Gioushy/E-Commerce/assets/105521854/c393e176-685b-4675-9563-278ef3d8dbb6)


## Optimization Technique:
Apply Full-Text scan on the table products using columns name and description.
```
CREATE INDEX product_quantity_idx ON product(stock_quantity);
```
## Final Query:
```
SELECT * FROM product WHERE stock_quantity < 10;
```

## Query Plan After:
![image](https://github.com/Gioushy/E-Commerce/assets/105521854/e0dc1aa6-3c81-4800-bfcb-a0e5fa3f7f1f)
