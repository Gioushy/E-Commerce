# Write SQL Query to List products that have low stock quantities of less than 10 quantities.
## Initial Query:
```
SELECT name,description,price,stock_quantity FROM product WHERE stock_quantity < 10;
```
## Query Plan Before:
![image](https://github.com/Gioushy/E-Commerce/assets/105521854/2128a8fd-de07-4ef4-bfe0-b70e87f856d6)

## Optimization Technique:
Create a index on the stock_quantity column in the orders table.
```
CREATE INDEX product_quantity_idx ON product(stock_quantity);
```
## Final Query:
```
SELECT name,description,price,stock_quantity FROM product WHERE stock_quantity < 10;
```

## Query Plan After:
![image](https://github.com/Gioushy/E-Commerce/assets/105521854/e0dc1aa6-3c81-4800-bfcb-a0e5fa3f7f1f)
