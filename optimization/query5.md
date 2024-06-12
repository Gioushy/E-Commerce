# Write SQL query to search for all products with the word "laptop" in either product name or description.
## Initial Query:
```
SELECT name,description,price,stock_quantity FROM product
WHERE "name" ILIKE '%laptop%' OR description ILIKE '%laptop;
```
## Query Plan Before:
![image](https://github.com/Gioushy/E-Commerce/assets/105521854/aa6a4ef2-1800-4162-8c95-35468321db0c)



## Optimization Technique:
Apply Full-Text search on the table products using columns name and description.
```
ALTER TABLE product
    ADD COLUMN product_search_idx tsvector
               GENERATED ALWAYS AS (to_tsvector('english', coalesce(name, '') || ' ' || coalesce(description, ''))) STORED;
```
```
CREATE INDEX product_idx ON product USING GIN (product_search_idx);
```
## Final Query:
```
SELECT name,description,price,stock_quantity
FROM product
WHERE product_search_idx @@ to_tsquery('english','laptop');
```

## Query Plan After:
![image](https://github.com/Gioushy/E-Commerce/assets/105521854/f429384a-8a81-468e-9d04-fa87ee73971a)

