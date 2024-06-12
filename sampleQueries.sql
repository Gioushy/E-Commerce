-- SQL query to generate a daily report of the total revenue for a specific date, where the placeholder is the date (?)
SELECT SUM(total_amount) AS daily_revenue FROM orders WHERE DATE(order_date) = ?;

-- SQL query to generate monthly report of the top-selling products in a given month, where the placeholder is the month(?)
SELECT to_char(O.order_date, 'YYYY-MM') AS month, OD.product_id, SUM(OD.quantity) AS total_quantity,P.name
FROM order_details OD
JOIN orders O ON OD.order_id = O.id
JOIN product P ON OD.product_id = P.id
GROUP BY OD.product_id,month,P.name
HAVING to_char(O.order_date, 'YYYY-MM') = ?
ORDER BY total_quantity DESC;

-- SQL query to retrieve a list of customers who have placed orders totaling more than 500 in the past month.
SELECT C.id, CONCAT(C.first_name,' ',C.last_name) AS full_name, SUM(O.total_amount) AS total_orders_amount, to_char(O.order_date, 'YYYY-MM') AS month
FROM customer C
JOIN orders O ON c.id = O.customer_id
GROUP BY C.id, month
HAVING to_char(O.order_date, 'YYYY-MM') = to_char(NOW() - '1 month'::interval, 'YYYY-MM') 
	AND SUM(O.total_amount) > 500
ORDER BY total_orders_amount DESC;

-- SQL query to search for all products with the word "laptop" in either product name or description.
SELECT * FROM product
WHERE name LIKE '%laptop%' OR description LIKE '%laptop%';

-- Full text search
ALTER TABLE product
    ADD COLUMN product_search_idx tsvector
               GENERATED ALWAYS AS (to_tsvector('english', coalesce(name, '') || ' ' || coalesce(description, ''))) STORED;
			   
CREATE INDEX product_idx ON product USING GIN (product_search_idx);

SELECT *
FROM product
WHERE product_search_idx @@ to_tsquery('english','laptop');

--SQL query to suggest popular products in the same category, excluding the purchased product from the recommendations.
(SELECT P.id, P.name, P.price, P.stock_quantity FROM product P 
JOIN category_products CP ON P.id = CP.product_id
WHERE CP.category_id IN (
	SELECT DISTINCT category_id FROM category_products CP 
	JOIN product P on CP.product_id = P.id
	JOIN order_details OD on p.id = OD.product_id
	JOIN orders O on OD.order_id = O.id
	JOIN customer C on O.customer_id = C.id
	WHERE customer_id = 1
))
EXCEPT
(SELECT P.id, P.name, P.price, P.stock_quantity FROM product P 
JOIN order_details OD on p.id = OD.product_id
JOIN category_products CP ON P.id = CP.product_id
JOIN orders O on OD.order_id = O.id
JOIN customer C on O.customer_id = C.id
WHERE customer_id = 1);

--SQL query to suggest popular products in the same category for the same seller, excluding the purchased product from the recommendations.
(SELECT P.id, P.name, P.price, P.stock_quantity FROM product P 
JOIN category_products CP ON P.id = CP.product_id
WHERE CP.category_id IN (
	SELECT DISTINCT category_id FROM category_products CP 
	JOIN product P on CP.product_id = P.id
	JOIN order_details OD on p.id = OD.product_id
	JOIN orders O on OD.order_id = O.id
	JOIN customer C on O.customer_id = C.id
	WHERE customer_id = 1
)
 AND P.seller_id IN (
	SELECT DISTINCT seller_id FROM product P
	JOIN order_details OD on p.id = OD.product_id
	JOIN orders O on OD.order_id = O.id
	JOIN customer C on O.customer_id = C.id
	WHERE customer_id = 1
 )
)
EXCEPT
(SELECT P.id, P.name, P.price, P.stock_quantity FROM product P 
JOIN order_details OD on p.id = OD.product_id
JOIN category_products CP ON P.id = CP.product_id
JOIN orders O on OD.order_id = O.id
JOIN customer C on O.customer_id = C.id
WHERE customer_id = 1);

-- Denormalization on category table
CREATE TABLE denormalized_categories (
    parent_category_id INT,
    parent_category_name VARCHAR(150),
    subcategory_id INT,
    subcategory_name VARCHAR(150)
);

INSERT INTO denormalized_categories (parent_category_id, parent_category_name, subcategory_id, subcategory_name)
SELECT 
    parent.id AS parent_category_id,
    parent.name AS parent_category_name,
    sub.id AS subcategory_id,
    sub.name AS subcategory_name
FROM 
    category parent
LEFT JOIN 
    category sub
ON 
    parent.id = sub.parent_category_id
WHERE 
    sub.id IS NOT NULL;
