CREATE OR REPLACE FUNCTION insert_realistic_addresses()
RETURNS VOID AS $$
DECLARE
    us_states_cities JSONB := '[
        {"state": "Alabama", "cities": ["Birmingham", "Montgomery", "Mobile"]},
        {"state": "Alaska", "cities": ["Anchorage", "Fairbanks", "Juneau"]},
        {"state": "Arizona", "cities": ["Phoenix", "Tucson", "Mesa"]},
        {"state": "Arkansas", "cities": ["Little Rock", "Fort Smith", "Fayetteville"]},
        {"state": "California", "cities": ["Los Angeles", "San Diego", "San Francisco"]},
        {"state": "Colorado", "cities": ["Denver", "Colorado Springs", "Aurora"]},
        {"state": "Connecticut", "cities": ["Bridgeport", "New Haven", "Stamford"]},
        {"state": "Delaware", "cities": ["Wilmington", "Dover", "Newark"]},
        {"state": "Florida", "cities": ["Miami", "Orlando", "Tampa"]},
        {"state": "Georgia", "cities": ["Atlanta", "Augusta", "Columbus"]}
    ]';
    state_city_pair JSONB;
    random_state TEXT;
    random_city TEXT;
    random_street TEXT;
    random_block TEXT;
    random_postal_code TEXT;
    i INT;
    street_names TEXT[] := ARRAY['Main St', 'High St', 'Broad St', 'Church St', 'Elm St', 'Market St', 'Maple St', 'Cedar St', 'Park St', 'Pine St'];
BEGIN
    FOR i IN 1..1000 LOOP
        -- Select a random state-city pair
        state_city_pair := us_states_cities->(floor(random() * jsonb_array_length(us_states_cities))::int);
        
        -- Extract state and city
        random_state := state_city_pair->>'state';
        random_city := (state_city_pair->'cities')->>(floor(random() * jsonb_array_length(state_city_pair->'cities'))::int);
        
        -- Generate random data for other fields
        random_street := street_names[(floor(random() * array_length(street_names, 1)) + 1)::int];
        random_block := (random() * 1000)::int::text;
        random_postal_code := lpad((random() * 100000)::int::text, 5, '0');
        
        -- Insert the random address into the address table
        INSERT INTO address (country, city, state, street_name, block_number, postal_code)
        VALUES ('United States', random_city, random_state, random_street, random_block, random_postal_code);
    END LOOP;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION insert_random_addresses();
-- Calling the function to insert addresses
SELECT insert_realistic_addresses();
