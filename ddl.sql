-- Creating the category table
CREATE TABLE category (
	"id" UUID DEFAULT gen_random_uuid(),
	"name" VARCHAR(50) NOT NULL,
	subcategory_id UUID,
	PRIMARY KEY ("id"),
	CONSTRAINT fk_subcategory
		FOREIGN KEY (subcategory_id)
		REFERENCES category("id")
	
);
-- Creating product table
CREATE TABLE product (
	"id" UUID DEFAULT gen_random_uuid(),
	"name" VARCHAR(50) NOT NULL,
	description VARCHAR(150) NOT NULL,
	price DECIMAL(9,2) NOT NULL,
	stock_quantity SMALLINT,
	PRIMARY KEY ("id")
);
-- Creating the associative entity between products and categories
CREATE TABLE categoryproducts (
	category_id UUID,
	product_id UUID,
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
	"id" UUID DEFAULT gen_random_uuid(),
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	password VARCHAR(50) NOT NULL,
	PRIMARY KEY("id"),
	CONSTRAINT email_format
		CHECK (email ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$')
);
-- Creating order table
CREATE TABLE "order"(
	"id" UUID DEFAULT gen_random_uuid(),
	customer_id UUID,
	date DATE NOT NULL DEFAULT CURRENT_DATE,
	total_amount DECIMAL(9,2) NOT NULL,
	PRIMARY KEY("id"),
	CONSTRAINT fk_customer_id
		FOREIGN KEY(customer_id)
			REFERENCES customer("id")	
);
-- Creating the associative entity between order and product
CREATE TABLE order_details(
	"id" UUID DEFAULT gen_random_uuid(),
	product_id UUID,
	order_id UUID,
	quantity SMALLINT NOT NULL,
	unit_price DECIMAL(9,2),
	PRIMARY KEY("id"),
	CONSTRAINT fk_product_id
		FOREIGN KEY(product_id)
			REFERENCES product("id"),
	CONSTRAINT fk_order_id
		FOREIGN KEY(order_id)
			REFERENCES "order"("id")
);
