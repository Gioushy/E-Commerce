-- SQL query to generate a daily report of the total revenue for a specific date, where the placeholder is the date (?)
SELECT SUM(total_amount) FROM order WHERE date = ? ;
