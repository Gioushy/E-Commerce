-- Creating the category table
CREATE TABLE category (
	"id" INT SERIAL,
	"name" VARCHAR(150) NOT NULL,
	subcategory_id INT,
	PRIMARY KEY ("id"),
	CONSTRAINT fk_subcategory
		FOREIGN KEY (subcategory_id)
		REFERENCES category("id")
	
);
-- Creating product table
CREATE TABLE product (
	"id" INT SERIAL,
	"name" VARCHAR(100) NOT NULL,
	description TEXT NOT NULL,
	price DECIMAL(9,2) NOT NULL,
	stock_quantity SMALLINT NOT NULL,
	PRIMARY KEY ("id")
);
-- Creating the associative entity between products and categories
CREATE TABLE categoryproducts (
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
	"id" INT SERIAL,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	password VARCHAR(100) NOT NULL,
	PRIMARY KEY("id"),
	CONSTRAINT email_format
		CHECK (email ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$')
);
-- Creating order table
CREATE TABLE "order"(
	"id" INT SERIAL,
	customer_id INT,
	order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	shipped_date TIMESTAMP,
	active BOOLEAN,
	total_amount DECIMAL(9,2) NOT NULL,
	PRIMARY KEY("id"),
	CONSTRAINT fk_customer_id
		FOREIGN KEY(customer_id)
			REFERENCES customer("id")	
);
-- Creating the associative entity between order and product
CREATE TABLE order_details(
	"id" INT SERIAL,
	product_id INT,
	order_id INT,
	quantity SMALLINT NOT NULL,
	unit_price DECIMAL(9,2) NOT NULL,
	PRIMARY KEY("id"),
	CONSTRAINT fk_product_id
		FOREIGN KEY(product_id)
			REFERENCES product("id"),
	CONSTRAINT fk_order_id
		FOREIGN KEY(order_id)
			REFERENCES "order"("id")
);
