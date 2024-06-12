-- Create a temporary table to store the generated data
CREATE TEMPORARY TABLE temp_customers (
    first_name TEXT,
	last_name TEXT,
    phone_number TEXT,
    email TEXT,
    password TEXT,
    address_id INT
);

CREATE OR REPLACE FUNCTION insert_random_customers_v2()
RETURNS VOID AS $$
DECLARE
    first_names TEXT[] := ARRAY[
        'John', 'Jane', 'Alice', 'Bob', 'Charlie', 'David', 'Emma', 'Frank', 'Grace', 'Hannah',
        'Mike', 'Sarah', 'James', 'Linda', 'Robert', 'Patricia', 'Michael', 'Barbara', 'William', 'Elizabeth',
        'Mary', 'Richard', 'Joseph', 'Thomas', 'Charles', 'Christopher', 'Daniel', 'Matthew', 'Anthony', 'Donald',
        'Paul', 'Mark', 'George', 'Steven', 'Kenneth', 'Andrew', 'Edward', 'Joshua', 'Brian', 'Kevin',
        'Ronald', 'Timothy', 'Jason', 'Jeffrey', 'Ryan', 'Gary', 'Jacob', 'Nicholas', 'Eric', 'Stephen',
        'Jonathan', 'Larry', 'Justin', 'Scott', 'Brandon', 'Benjamin', 'Samuel', 'Gregory', 'Alexander', 'Patrick',
        'Frank', 'Raymond', 'Jack', 'Dennis', 'Jerry', 'Tyler', 'Aaron', 'Jose', 'Adam', 'Nathan',
        'Henry', 'Douglas', 'Zachary', 'Peter', 'Kyle', 'Walter', 'Ethan', 'Jeremy', 'Harold', 'Keith',
        'Christian', 'Roger', 'Noah', 'Gerald', 'Carl', 'Terry', 'Sean', 'Austin', 'Arthur', 'Lawrence'
    ];
    last_names TEXT[] := ARRAY[
        'Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Miller', 'Davis', 'Martinez', 'Wilson',
        'Anderson', 'Taylor', 'Thomas', 'Hernandez', 'Moore', 'Martin', 'Jackson', 'Thompson', 'White', 'Lopez',
        'Lee', 'Gonzalez', 'Harris', 'Clark', 'Lewis', 'Robinson', 'Walker', 'Perez', 'Hall', 'Young',
        'Allen', 'Sanchez', 'Wright', 'King', 'Scott', 'Green', 'Baker', 'Adams', 'Nelson', 'Hill',
        'Ramirez', 'Campbell', 'Mitchell', 'Roberts', 'Carter', 'Phillips', 'Evans', 'Turner', 'Torres', 'Parker',
        'Collins', 'Edwards', 'Stewart', 'Flores', 'Morris', 'Nguyen', 'Murphy', 'Rivera', 'Cook', 'Rogers',
        'Morgan', 'Peterson', 'Cooper', 'Reed', 'Bailey', 'Bell', 'Gomez', 'Kelly', 'Howard', 'Ward',
        'Cox', 'Diaz', 'Richardson', 'Wood', 'Watson', 'Brooks', 'Bennett', 'Gray', 'James', 'Reyes',
        'Cruz', 'Hughes', 'Price', 'Myers', 'Long', 'Foster', 'Sanders', 'Ross', 'Morales', 'Powell',
        'Sullivan', 'Russell', 'Ortiz', 'Jenkins', 'Gutierrez', 'Perry', 'Butler', 'Barnes', 'Fisher', 'Henderson'
    ];
    domains TEXT[] := ARRAY['example.com', 'mail.com', 'test.com', 'demo.com', 'sample.com'];
    i INT := 0;
    random_first_name TEXT;
    random_last_name TEXT;
    random_phone_number TEXT;
    random_email TEXT;
    random_password TEXT;
    random_address_id INT;
	generated_phone_numbers TEXT[] := '{}';
BEGIN
  
    FOR i IN 1..1000000 LOOP
        -- Generate random data for each field
        random_first_name := first_names[(floor(random() * array_length(first_names, 1)) + 1)::int];
        random_last_name := last_names[(floor(random() * array_length(last_names, 1)) + 1)::int];
		random_phone_number := lpad((floor(random() * 1000000000000000))::bigint::text, 10, '0');
		
        random_email := LOWER(random_first_name || '.' || random_last_name || random_phone_number || '@' || domains[(floor(random() * array_length(domains, 1)) + 1)::int]);
        random_password := md5(random_first_name || random_last_name || (random() * 1000000)::int::text);
        random_address_id := (floor(random() * 1000) + 1)::int;

        -- Insert the random seller into the temporary table
        INSERT INTO temp_customers (first_name,last_name, phone_number, email, password, address_id)
        VALUES (random_first_name, random_last_name, random_phone_number, random_email, random_password, random_address_id);
    END LOOP;

    -- Insert data from the temporary table into the seller table
    INSERT INTO customer (first_name, last_name, phone_number, email, password, address_id)
    SELECT first_name, last_name, phone_number, email, password, address_id FROM temp_customers;
END;
$$ LANGUAGE plpgsql;


SELECT insert_random_customers_v2();
