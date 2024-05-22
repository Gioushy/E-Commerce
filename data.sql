-- Inserting sample parent categories
INSERT INTO category (name, parent_category_id) VALUES ('Electronics', NULL);
INSERT INTO category (name, parent_category_id) VALUES ('Home Appliances', NULL);
INSERT INTO category (name, parent_category_id) VALUES ('Furniture', NULL);

-- Inserting sample subcategories for Electronics
INSERT INTO category (name, parent_category_id) VALUES ('Laptops', 1);
INSERT INTO category (name, parent_category_id) VALUES ('Smartphones', 1);
INSERT INTO category (name, parent_category_id) VALUES ('Accessories', 1);
INSERT INTO category (name, parent_category_id) VALUES ('Cameras', 1);
INSERT INTO category (name, parent_category_id) VALUES ('Audio', 1);

-- Inserting sample subcategories for Home Appliances
INSERT INTO category (name, parent_category_id) VALUES ('Refrigerators', 2);
INSERT INTO category (name, parent_category_id) VALUES ('Washing Machines', 2);
INSERT INTO category (name, parent_category_id) VALUES ('Microwaves', 2);
INSERT INTO category (name, parent_category_id) VALUES ('Air Conditioners', 2);

-- Inserting sample subcategories for Furniture
INSERT INTO category (name, parent_category_id) VALUES ('Living Room', 3);
INSERT INTO category (name, parent_category_id) VALUES ('Bedroom', 3);
INSERT INTO category (name, parent_category_id) VALUES ('Office', 3);

-- Inserting sample products
INSERT INTO product (name, description, price, stock_quantity) VALUES ('Laptop A', 'High performance laptop', 999.99, 10);
INSERT INTO product (name, description, price, stock_quantity) VALUES ('Smartphone B', 'Latest model smartphone', 799.99, 25);
INSERT INTO product (name, description, price, stock_quantity) VALUES ('Camera C', 'Professional camera', 499.99, 15);
INSERT INTO product (name, description, price, stock_quantity) VALUES ('Headphones D', 'Noise-cancelling headphones', 199.99, 50);
INSERT INTO product (name, description, price, stock_quantity) VALUES ('Mouse E', 'Wireless mouse', 29.99, 100);
INSERT INTO product (name, description, price, stock_quantity) VALUES ('Refrigerator F', 'Double door refrigerator', 1199.99, 5);
INSERT INTO product (name, description, price, stock_quantity) VALUES ('Washing Machine G', 'Front load washing machine', 899.99, 8);
INSERT INTO product (name, description, price, stock_quantity) VALUES ('Microwave H', 'Convection microwave oven', 299.99, 20);
INSERT INTO product (name, description, price, stock_quantity) VALUES ('Air Conditioner I', 'Split AC with inverter technology', 699.99, 12);
INSERT INTO product (name, description, price, stock_quantity) VALUES ('Sofa J', 'Leather sofa set', 1499.99, 3);
INSERT INTO product (name, description, price, stock_quantity) VALUES ('Bed K', 'King size bed with storage', 899.99, 7);
INSERT INTO product (name, description, price, stock_quantity) VALUES ('Desk L', 'Ergonomic office desk', 199.99, 15);

-- Associating products with categories
-- Electronics subcategories
INSERT INTO category_products (category_id, product_id) VALUES (1, 1); -- Laptops
INSERT INTO category_products (category_id, product_id) VALUES (1, 2); -- Smartphones
INSERT INTO category_products (category_id, product_id) VALUES (1, 3); -- Cameras
INSERT INTO category_products (category_id, product_id) VALUES (1, 4); -- Accessories
INSERT INTO category_products (category_id, product_id) VALUES (1, 5); -- Accessories


-- Home Appliances subcategories
INSERT INTO category_products (category_id, product_id) VALUES (2, 6); -- Refrigerators
INSERT INTO category_products (category_id, product_id) VALUES (2, 7); -- Washing Machines
INSERT INTO category_products (category_id, product_id) VALUES (2, 8); -- Microwaves
INSERT INTO category_products (category_id, product_id) VALUES (2, 9); -- Air Conditioners

-- Furniture subcategories
INSERT INTO category_products (category_id, product_id) VALUES (3, 10); -- Living Room
INSERT INTO category_products (category_id, product_id) VALUES (3, 11); -- Bedroom
INSERT INTO category_products (category_id, product_id) VALUES (3, 12); -- Office

-- Inserting sample customers
INSERT INTO customer (first_name, last_name, email, password) VALUES ('John', 'Doe', 'john.doe@example.com', 'password123');
INSERT INTO customer (first_name, last_name, email, password) VALUES ('Jane', 'Smith', 'jane.smith@example.com', 'password456');
INSERT INTO customer (first_name, last_name, email, password) VALUES ('Alice', 'Johnson', 'alice.johnson@example.com', 'password789');
INSERT INTO customer (first_name, last_name, email, password) VALUES ('Bob', 'Brown', 'bob.brown@example.com', 'password101');
INSERT INTO customer (first_name, last_name, email, password) VALUES ('Charlie', 'Davis', 'charlie.davis@example.com', 'password202');

-- Inserting sample orders for John Doe
INSERT INTO orders (customer_id, order_date, shipped_date, active, total_amount) VALUES (1, '2023-01-15 10:30:00', NULL, TRUE, 999.99);
INSERT INTO orders (customer_id, order_date, shipped_date, active, total_amount) VALUES (1, '2023-02-10 12:00:00', NULL, TRUE, 799.99);
INSERT INTO orders (customer_id, order_date, shipped_date, active, total_amount) VALUES (1, '2023-03-05 15:45:00', '2023-03-07 18:30:00', FALSE, 1299.97);
INSERT INTO orders (customer_id, order_date, shipped_date, active, total_amount) VALUES (1, '2023-03-20 10:15:00', NULL, TRUE, 499.99);
INSERT INTO orders (customer_id, order_date, shipped_date, active, total_amount) VALUES (1, '2023-04-05 14:20:00', '2023-04-07 15:30:00', FALSE, 1199.99);


-- Inserting sample orders for other customers
INSERT INTO orders (customer_id, order_date, shipped_date, active, total_amount) VALUES (2, '2023-01-18 11:00:00', '2023-01-20 13:00:00', FALSE, 499.99);
INSERT INTO orders (customer_id, order_date, shipped_date, active, total_amount) VALUES (3, '2023-01-20 14:30:00', NULL, TRUE, 199.99);
INSERT INTO orders (customer_id, order_date, shipped_date, active, total_amount) VALUES (4, '2023-01-25 09:45:00', '2023-01-27 10:45:00', FALSE, 29.99);
INSERT INTO orders (customer_id, order_date, shipped_date, active, total_amount) VALUES (5, '2023-02-01 16:00:00', NULL, TRUE, 1499.97);



-----------------------------------------------------------
-- Inserting order details for John Doe's orders
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (1, 1, 1, 999.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (2, 2, 1, 799.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (1, 1, 1, 499.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (4, 3, 1, 199.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (5, 3, 1, 29.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (6, 4, 1, 499.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (7, 5, 1, 1199.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (8, 6, 1, 499.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (9, 7, 1, 699.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (10, 8, 1, 299.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (11, 9, 1, 199.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (12, 10, 1, 999.99);

-- Inserting order details for other customers
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (6, 11, 1, 499.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (4, 12, 1, 199.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (5, 13, 1, 29.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (10, 14, 1, 999.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (11, 14, 1, 499.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (12, 14, 1, 499.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (1, 15, 1, 999.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (2, 15, 1, 799.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (3, 15, 1, 499.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (7, 16, 1, 899.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (8, 16, 1, 299.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (9, 16, 1, 699.99);

-- Adding more sample orders and their details
INSERT INTO orders (customer_id, order_date, shipped_date, active, total_amount) VALUES (3, '2023-03-01 14:00:00', '2023-03-03 16:00:00', TRUE, 1499.99);
INSERT INTO orders (customer_id, order_date, shipped_date, active, total_amount) VALUES (4, '2023-03-05 09:30:00', '2023-03-07 11:30:00', FALSE, 1199.99);
INSERT INTO orders (customer_id, order_date, shipped_date, active, total_amount) VALUES (5, '2023-03-10 10:15:00', '2023-03-12 12:15:00', TRUE, 999.99);

INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (6, 17, 1, 499.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (4, 17, 2, 199.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (5, 17, 5, 29.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (7, 18, 1, 899.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (8, 18, 1, 299.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (9, 18, 1, 699.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (1, 19, 1, 999.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (2, 19, 1, 799.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (3, 19, 1, 499.99);

-- Adding even more sample orders and their details
INSERT INTO orders (customer_id, order_date, shipped_date, active, total_amount) VALUES (2, '2023-04-01 08:45:00', '2023-04-03 10:45:00', TRUE, 1299.99);
INSERT INTO orders (customer_id, order_date, shipped_date, active, total_amount) VALUES (3, '2023-04-05 14:00:00', '2023-04-07 16:00:00', FALSE, 1599.99);
INSERT INTO orders (customer_id, order_date, shipped_date, active, total_amount) VALUES (4, '2023-04-10 12:30:00', '2023-04-12 14:30:00', TRUE, 1099.99);

INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (10, 20, 1, 999.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (11, 20, 1, 299.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (12, 20, 1, 199.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (4, 21, 3, 199.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (5, 21, 10, 29.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (6, 21, 2, 499.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (7, 22, 1, 899.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (8, 22, 1, 299.99);
INSERT INTO order_details (product_id, order_id, quantity, unit_price) VALUES (9, 22, 1, 699.99);
