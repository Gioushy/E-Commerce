# Write SQL Query to Retrieve the total number of products in each category.
## Query before optimization:
```
SELECT category_id, COUNT(product_id) FROM category_products GROUP BY category_id;
```
## Query Plan Before:
![image](https://github.com/Gioushy/E-Commerce/assets/105521854/dbf117f1-8d1a-48ec-a412-92991ce04485)

## Optimization Technique:
Create a table with only the category_id, name and the count of the products. Then insert the records using the first query.
```
CREATE TABLE category_products_count(
	category_id INT,
	category_name VARCHAR(150),
	product_count INT
);
INSERT INTO category_products_count(category_id, category_name,product_count)
SELECT CP.category_id, C.name, COUNT(product_id) FROM category_products CP
JOIN category C ON CP.category_id = C.id
GROUP BY category_id,C.name;
```
## Query Plan After:
![image](https://github.com/Gioushy/E-Commerce/assets/105521854/2ad2cffa-1fb7-43c2-882c-81137d9538d4)
