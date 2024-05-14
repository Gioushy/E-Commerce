-- SQL query to generate a daily report of the total revenue for a specific date, where the placeholder is the date (?)
SELECT SUM(total_amount) AS daily_revenue FROM order WHERE DATE(date) = ? ;

-- SQL query to generate monthly report of the top-selling products in a given month, where the placeholder is the month(?)
SELECT p.id,
