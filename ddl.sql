-- Creating the category table
CREATE TABLE category (
	"id" SERIAL,
	"name" VARCHAR(150) NOT NULL,
	parent_category_id INT,
	PRIMARY KEY ("id"),
	CONSTRAINT fk_subcategory
		FOREIGN KEY (subcategory_id)
		REFERENCES category("id")
	
);
-- Creating product table
CREATE TABLE product (
	"id" SERIAL,
	"name" VARCHAR(100) NOT NULL,
	description TEXT,
	price DECIMAL(9,2) NOT NULL CHECK (price > 0),
	stock_quantity SMALLINT NOT NULL CHECK (stock_quantity > 0),
	PRIMARY KEY ("id")
);
-- Creating the associative entity between products and categories
CREATE TABLE category_products (
	category_id INT,
	product_id INT,
	PRIMARY KEY(category_id,product_id),
	CONSTRAINT fk_category_id
		FOREIGN KEY(category_id)
			REFERENCES category("id"),
	CONSTRAINT fk_product_id
		FOREIGN KEY(product_id)
			REFERENCES product("id")
);
-- Creating customer table
CREATE TABLE customer(
	"id" SERIAL,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	password VARCHAR(100) NOT NULL,
	PRIMARY KEY("id"),
	CONSTRAINT email_format
		CHECK (email ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$')
);
-- Creating order table
CREATE TABLE orders(
	"id" SERIAL,
	customer_id INT,
	order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	shipped_date TIMESTAMP,
	active BOOLEAN,
	total_amount DECIMAL(9,2) NOT NULL CHECK (total_amount > 0),
	PRIMARY KEY("id"),
	CONSTRAINT fk_customer_id
		FOREIGN KEY(customer_id)
			REFERENCES customer("id")	
);
-- Creating the associative entity between order and product
CREATE TABLE order_details(
	"id" SERIAL,
	product_id INT,
	order_id INT,
	quantity SMALLINT NOT NULL CHECK (quantity > 0),
	unit_price DECIMAL(9,2) NOT NULL CHECK (unit_price > 0),
	PRIMARY KEY("id"),
	CONSTRAINT fk_product_id
		FOREIGN KEY(product_id)
			REFERENCES product("id"),
	CONSTRAINT fk_order_id
		FOREIGN KEY(order_id)
			REFERENCES orders("id")
);
