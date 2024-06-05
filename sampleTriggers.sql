-- Write a trigger to Create a sale history [Above customer , product], when a new order is made in the "Orders" table, automatically generates a sale history record for that order, capturing details such as the order date, customer, product,total amount, and quantity. The trigger should be triggered on Order insertion.
CREATE TABLE sales_history (
	"id" SERIAL,
	order_id INT,
	order_date TIMESTAMP,
	customer_name VARCHAR(200),
	product_name VARCHAR(100),
	quantity SMALLINT,
	unit_price DECIMAL(9,2),
	seller_name VARCHAR(100),
	order_total_amount DECIMAL(9,2),
	PRIMARY KEY ("id")	
);

CREATE FUNCTION insert_sales_history()
RETURNS trigger 
LANGUAGE plpgsql
AS $$
	BEGIN
		INSERT INTO sales_history(order_id,order_date,customer_name,product_name,quantity,unit_price,seller_name,order_total_amount)
		SELECT order_id, order_date, CONCAT(C.first_name,' ',C.last_name),P.name,OD.quantity,OD.unit_price, S.first_name,O.total_amount
		FROM order_details OD JOIN orders O ON OD.order_id = O.id
		JOIN customer C ON O.customer_id = C.id
		JOIN product P ON OD.product_id = P.id
		JOIN seller S ON P.seller_id = S.id
		WHERE OD.id = NEW.id;
		RETURN NEW;
	END;
$$;

CREATE OR REPLACE TRIGGER sales_history_trigger 
AFTER INSERT ON order_details
FOR EACH ROW
EXECUTE FUNCTION insert_sales_history();
