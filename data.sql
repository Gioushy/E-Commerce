-- Inserting addresses
INSERT INTO address (country, city, state, street_name, block_number, postal_code)
VALUES 
('Australia', 'Sydney', 'NSW', 'George Street', '505', '2000');
('USA', 'New York', 'NY', '5th Avenue', '101', '10001'),
('USA', 'Los Angeles', 'CA', 'Sunset Blvd', '202', '90001'),
('Canada', 'Toronto', 'ON', 'Bloor Street', '303', 'M4W 1E6'),
('UK', 'London', 'London', 'Oxford Street', '404', 'W1D 1LL');


-- Inserting categories with parent-child relationships
INSERT INTO category (name, parent_category_id)
VALUES 
('Electronics', NULL),
('Computers', 1),
('Laptops', 2),
('Smartphones', 1),
('Furniture', NULL),
('Chairs', 5),
('Tables', 5),
('Books', NULL),
('Fiction', 8),
('Non-Fiction', 8);

-- Inserting sellers
INSERT INTO seller (first_name, phone_number, email, password, address_id)
VALUES 
('Store1', '123-456-7890', 'Store1@example.com', 'password123', 1),
('Store2', '234-567-8901', 'store2@example.com', 'password123', 2),
('Store3', '345-678-9012', 'store3@example.com', 'password123', 3),
('Store4', '456-789-0123', 'store4@example.com', 'password123', 4);


-- Inserting products
INSERT INTO product (name, description, price, stock_quantity, seller_id)
VALUES 
('MacBook Pro', 'Apple laptop', 1999.99, 50, 1),
('Dell XPS 13', 'Dell ultrabook', 1499.99, 100, 1),
('iPhone 13', 'Apple smartphone', 999.99, 200, 2),
('Samsung Galaxy S21', 'Samsung smartphone', 799.99, 150, 2),
('Office Chair', 'Ergonomic chair', 199.99, 300, 3),
('Dining Table', 'Wooden dining table', 299.99, 50, 3),
('The Great Gatsby', 'Fiction book', 10.99, 500, 1),
('Educated', 'Non-fiction book', 14.99, 400, 2),
-- Additional products
('HP Spectre x360', 'HP convertible laptop', 1299.99, 75, 1),
('Lenovo ThinkPad X1', 'Lenovo business laptop', 1399.99, 80, 1),
('Google Pixel 6', 'Google smartphone', 699.99, 250, 2),
('Sony WH-1000XM4', 'Sony noise-canceling headphones', 349.99, 100, 2),
('Gaming Chair', 'Comfortable gaming chair', 299.99, 150, 3),
('Bookshelf', 'Wooden bookshelf', 199.99, 40, 4),
('To Kill a Mockingbird', 'Classic fiction book', 12.99, 600, 1),
('Sapiens', 'Non-fiction book by Yuval Noah Harari', 18.99, 350, 2);

-- Associating products with categories
INSERT INTO category_products (category_id, product_id)
VALUES 
(3, 1), -- MacBook Pro in Laptops
(3, 2), -- Dell XPS 13 in Laptops
(4, 3), -- iPhone 13 in Smartphones
(4, 4), -- Samsung Galaxy S21 in Smartphones
(6, 5), -- Office Chair in Chairs
(7, 6), -- Dining Table in Tables
(9, 7), -- The Great Gatsby in Fiction
(10, 8), -- Educated in Non-Fiction
-- Additional associations
(3, 9), -- HP Spectre x360 in Laptops
(3, 10), -- Lenovo ThinkPad X1 in Laptops
(4, 11), -- Google Pixel 6 in Smartphones
(1, 12), -- Sony WH-1000XM4 in Electronics
(6, 13), -- Gaming Chair in Chairs
(7, 14), -- Bookshelf in Tables
(9, 15), -- To Kill a Mockingbird in Fiction
(10, 16); -- Sapiens in Non-Fiction

-- Inserting customers
INSERT INTO customer (first_name, last_name, email, password, address_id)
VALUES 
('Michael', 'Smith', 'michael@example.com', 'password123', 1),
('Sarah', 'Johnson', 'sarah@example.com', 'password123', 2),
('David', 'Brown', 'david@example.com', 'password123', 3),
('Emily', 'Davis', 'emily@example.com', 'password123', 4),
('James', 'Wilson', 'james@example.com', 'password123', 5);

-- Inserting updated orders data
INSERT INTO orders (customer_id, order_date, shipped_date, active, total_amount)
VALUES 
(1, '2023-01-01 10:00:00', '2023-01-03 10:00:00', FALSE, 2999.98), -- Michael's order
(2, '2023-01-05 12:00:00', '2023-01-07 12:00:00', FALSE, 1999.98), -- Sarah's order
(3, '2023-01-10 14:00:00', '2023-01-12 14:00:00', FALSE, 999.99), -- David's order
(4, '2023-01-15 16:00:00', '2023-01-17 16:00:00', FALSE, 499.99), -- Emily's order
(5, '2023-01-20 18:00:00', NULL, TRUE, 529.97); -- James's order (active)

-- Inserting order details
INSERT INTO order_details (product_id, order_id, quantity, unit_price)
VALUES 
(1, 1, 1, 1999.99), -- MacBook Pro for Michael
(3, 1, 1, 999.99), -- iPhone 13 for Michael
(2, 2, 1, 1499.99), -- Dell XPS 13 for Sarah
(3, 3, 1, 999.99), -- iPhone 13 for David
(5, 4, 2, 199.99), -- 2 Office Chairs for Emily
(7, 5, 1, 10.99), -- The Great Gatsby for James
(8, 5, 1, 14.99), -- Educated for James
(6, 5, 1, 299.99); -- Dining Table for James
