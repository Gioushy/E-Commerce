-- Create a temporary table to store the generated data
CREATE TEMPORARY TABLE temp_orders (
    customer_id INT,
    order_date TIMESTAMP,
    shipped_date TIMESTAMP,
    active BOOLEAN,
    total_amount DECIMAL(9, 2)
);

CREATE OR REPLACE FUNCTION insert_random_orders(num_orders INT)
RETURNS VOID AS $$
DECLARE
    i INT;
    random_customer_id INT;
    random_order_date TIMESTAMP;
    random_shipped_date TIMESTAMP;
    random_active BOOLEAN;
    random_total_amount DECIMAL(9, 2);
BEGIN
    FOR i IN 1..num_orders LOOP
        -- Generate random data for each field
        random_customer_id := (floor(random() * 1000000) + 1)::int;
        random_order_date := NOW() - INTERVAL '1 year' * random();
        random_shipped_date := CASE WHEN random() < 0.5 THEN NULL ELSE random_order_date + INTERVAL '1 day' * (floor(random() * 30) + 1) END;
        random_active := random_shipped_date IS NULL;
        random_total_amount := round((random() * 1000 + 1)::numeric, 2);  -- Ensuring total_amount is greater than 0

        -- Insert the random order into the temporary table
        INSERT INTO temp_orders (customer_id, order_date, shipped_date, active, total_amount)
        VALUES (random_customer_id, random_order_date, random_shipped_date, random_active, random_total_amount);
    END LOOP;

    -- Insert data from the temporary table into the orders table
    INSERT INTO orders (customer_id, order_date, shipped_date, active, total_amount)
    SELECT customer_id, order_date, shipped_date, active, total_amount FROM temp_orders;

    -- Drop the temporary table to clean up
    DROP TABLE temp_orders;
END;
$$ LANGUAGE plpgsql;

SELECT insert_random_orders(2000000);
