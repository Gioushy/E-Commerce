-- Create a temporary table to store the generated data
CREATE TEMPORARY TABLE temp_order_details (
    product_id INT,
    order_id INT,
    quantity SMALLINT,
    unit_price DECIMAL(9,2)
);

CREATE OR REPLACE FUNCTION insert_random_order_details(num_records INT)
RETURNS VOID AS $$
DECLARE
    i INT;
    random_product_id INT;
    random_order_id INT;
    random_quantity SMALLINT;
    random_unit_price DECIMAL(9,2);
BEGIN
    FOR i IN 1..num_records LOOP
        -- Generate random data for each field
        random_product_id := (floor(random() * 100000) + 1)::int;
        random_order_id := (floor(random() * 2000000) + 1)::int;
        random_quantity := (floor(random() * 10) + 1)::smallint; -- Quantity between 1 and 10
        random_unit_price := round((random() * 1000 + 1)::numeric, 2); -- Unit price between 1 and 1000

        -- Insert the random order detail into the temporary table
        INSERT INTO temp_order_details (product_id, order_id, quantity, unit_price)
        VALUES (random_product_id, random_order_id, random_quantity, random_unit_price);
    END LOOP;

    -- Insert data from the temporary table into the order_details table
    INSERT INTO order_details (product_id, order_id, quantity, unit_price)
    SELECT product_id, order_id, quantity, unit_price FROM temp_order_details;

    -- Drop the temporary table to clean up
    DROP TABLE temp_order_details;
END;
$$ LANGUAGE plpgsql;

SELECT insert_random_order_details(5000000);
