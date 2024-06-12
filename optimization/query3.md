# Write SQL Query to Retrieve the most recent orders with customer information with 12 orders.
## Initial Query:
```
SELECT O.id AS order_id,O.order_date,O.total_amount,O.customer_id, CONCAT(C.first_name,' ',C.last_name) AS full_name 
FROM orders O JOIN customer C ON O.customer_id = C.id 
WHERE C.id IN 
(SELECT C.id FROM orders O JOIN customer C ON O.customer_id = C.id GROUP BY C.id HAVING COUNT(O.id) = 12)
ORDER BY order_date DESC;
```
## Query Plan Before:
### Without index on the customer_id column in the orders table:
![image](https://github.com/Gioushy/E-Commerce/assets/105521854/786285ef-3d4f-429f-9cb5-c9f2b743a8b0)
### With index on the customer_id column in the orders table:
![image](https://github.com/Gioushy/E-Commerce/assets/105521854/0e68c4fd-2634-47f4-8e90-2a5e4e30b39b)





## Optimization Technique:
Create a table with the customer_id, customer_fullname, orders_count, and fill the table with the corresponding values.
```
CREATE TABLE customer_orders_count(
	customer_id INT PRIMARY KEY,
	customer_fullname VARCHAR(150),
	orders_count INT
);

INSERT INTO customer_orders_count(customer_id,customer_fullname,orders_count)
SELECT C.id, CONCAT(C.first_name,' ',C.last_name), COUNT(O.id) FROM customer C JOIN orders O ON C.id = O.customer_id GROUP BY C.id ORDER BY C.id;

```
## Final Query:
```
SELECT O.id AS order_id,O.order_date,O.total_amount,O.customer_id, C.customer_fullname
FROM orders O JOIN customer_orders_count C ON O.customer_id = C.customer_id
WHERE C.orders_count = 12
ORDER BY order_date DESC;
```

## Query Plan After:
![image](https://github.com/Gioushy/E-Commerce/assets/105521854/cddaf5a8-f5b9-4742-8e85-de5396fcc880)
