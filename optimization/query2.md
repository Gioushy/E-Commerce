# Write SQL Query to Find the top customers by total spending..
## Initial Query:
```
SELECT C.id, CONCAT(C.first_name,' ',C.last_name) AS full_name, SUM(O.total_amount) AS total_spending
FROM customer C JOIN orders O ON C.id = O.customer_id
GROUP BY C.id ORDER BY total_spending DESC ;
```
## Query Plan Before:
![image](https://github.com/Gioushy/E-Commerce/assets/105521854/0eff9efe-b317-4628-9e09-521c5d2aad86)


## Optimization Technique:
Create a index on the customer_id in the orders table.
```
CREATE INDEX order_customer_id_idx ON orders(customer_id);
```
## Final Query:
```
SELECT C.id, CONCAT(C.first_name,' ',C.last_name) AS full_name, SUM(O.total_amount) AS total_spending
FROM customer C JOIN orders O ON C.id = O.customer_id
GROUP BY C.id ORDER BY total_spending DESC ;
```

## Query Plan After:
![image](https://github.com/Gioushy/E-Commerce/assets/105521854/27168354-935c-45b5-b3c8-0a860e3c08a3)
