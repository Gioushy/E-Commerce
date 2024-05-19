-- SQL query to generate a daily report of the total revenue for a specific date, where the placeholder is the date (?)
SELECT SUM(total_amount) AS daily_revenue FROM order WHERE DATE(shipped_date) = ? ;

-- SQL query to generate monthly report of the top-selling products in a given month, where the placeholder is the month(?)
SELECT to_char(O.date, 'YYYY-MM') AS month, OD.product_id, SUM(OD.quantity) AS total_quantity,P.name
FROM order_details OD
JOIN order O ON OD.order_id = O.id
JOIN product P ON OD.product_id = P.id
GROUP BY OD.product_id,month,P.name
HAVING to_char(O.date, 'YYYY-MM') = 'YYYY-XX'
ORDER BY total_quantity DESC;

-- SQL to retrieve a list of customers who have placed orders totaling more than 500 in the past month.
SELECT C.id, CONCAT(C.first_name,' ',C.last_name) AS full_name, SUM(O.total_amount) AS total_orders_amount, to_char(O.date, 'YYYY-MM') AS month
FROM customer C
JOIN order O ON c.id = O.customer_id
GROUP BY C.id, month
HAVING to_char(O.date, 'YYYY-MM') = to_char(NOW() - '1 month'::interval, 'YYYY-MM') 
	AND SUM(O.total_amount) > 500
ORDER BY total_orders_amount DESC;
