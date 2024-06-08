CREATE OR REPLACE FUNCTION insert_random_products()
RETURNS VOID AS $$
DECLARE
    product_map JSON := '{
        "Laptop": ["High performance and sleek design", "Compact and portable", "Best in class features"],
        "Smartphone": ["High performance and sleek design", "Compact and portable", "Best in class features"],
        "Tablet": ["High performance and sleek design", "Compact and portable", "Best in class features"],
        "Headphones": ["Wireless and noise-cancelling", "Long battery life", "High precision"],
        "Smartwatch": ["Long battery life", "Track your fitness goals", "Compact and portable"],
        "Camera": ["4K resolution", "High performance and sleek design", "Compact and portable"],
        "Printer": ["High speed", "Multi-functional", "Fast and reliable"],
        "Monitor": ["High refresh rate", "Stunning visuals", "Compact and portable"],
        "Keyboard": ["Ergonomic design", "High precision", "Compact and portable"],
        "Mouse": ["High precision", "Ergonomic design", "Compact and portable"],
        "Router": ["High speed", "Stable connection", "Compact and portable"],
        "External Hard Drive": ["Large capacity", "Fast and reliable", "Compact and portable"],
        "USB Flash Drive": ["Compact and portable", "Fast and reliable", "Large capacity"],
        "SSD": ["Blazing fast speeds", "Large capacity", "Compact and portable"],
        "Graphics Card": ["Top-notch performance", "Latest generation", "High capacity"],
        "Motherboard": ["Advanced chipset", "Stable performance", "Latest generation"],
        "CPU": ["Top-notch performance", "Latest generation", "Stable performance"],
        "RAM": ["High capacity", "Fast and reliable", "Stable performance"],
        "Power Supply": ["Stable power", "High capacity", "Reliable"],
        "Case": ["Spacious and stylish", "Ergonomic design", "High performance"],
        "Drone": ["Lightweight and agile", "High performance", "Compact and portable"],
        "Game Console": ["Next-gen gaming", "Immersive experience", "High performance"],
        "VR Headset": ["Immersive experience", "Compact and portable", "High performance"],
        "Smart Speaker": ["Voice control", "High precision", "Compact and portable"],
        "Smart Light Bulb": ["Energy efficient", "Voice control", "Compact and portable"],
        "Fitness Tracker": ["Track your fitness goals", "Compact and portable", "High precision"],
        "Digital Photo Frame": ["Display your favorite memories", "Compact and portable", "High performance"],
        "Projector": ["Cinematic experience", "High performance", "Compact and portable"],
        "Home Security Camera": ["Enhanced security", "High precision", "Compact and portable"],
        "Smart Thermostat": ["Temperature control", "Energy efficient", "High precision"],
        "Electric Toothbrush": ["Whitening technology", "High precision", "Compact and portable"],
        "Hair Dryer": ["Quick drying", "High precision", "Compact and portable"],
        "Shaver": ["Smooth shave", "Compact and portable", "High precision"],
        "Coffee Maker": ["Brews perfect coffee", "High performance", "Compact and portable"],
        "Blender": ["Powerful blending", "Compact and portable", "High performance"],
        "Microwave": ["Quick cooking", "High performance", "Compact and portable"],
        "Air Fryer": ["Healthy frying", "High performance", "Compact and portable"],
        "Rice Cooker": ["Perfect rice every time", "Compact and portable", "High performance"],
        "Pressure Cooker": ["Tender and juicy", "Compact and portable", "High performance"],
        "Juicer": ["Freshly squeezed", "High performance", "Compact and portable"],
        "Vacuum Cleaner": ["Powerful suction", "Compact and portable", "High performance"],
        "Air Purifier": ["Clean and fresh air", "High performance", "Compact and portable"],
        "Humidifier": ["Optimal humidity", "Compact and portable", "High performance"],
        "Fan": ["Cool breeze", "Compact and portable", "High performance"],
        "Space Heater": ["Warm and cozy", "Compact and portable", "High performance"],
        "Iron": ["Wrinkle-free", "Compact and portable", "High performance"],
        "Sewing Machine": ["Precise stitching", "Compact and portable", "High performance"],
        "Water Filter": ["Clean water", "High performance", "Compact and portable"],
        "Dishwasher": ["Spotless dishes", "High performance", "Compact and portable"],
        "Washing Machine": ["Efficient washing", "High performance", "Compact and portable"],
        "Refrigerator": ["Keeps food fresh", "High performance", "Compact and portable"],
        "Oven": ["Even baking", "High performance", "Compact and portable"],
        "Cooktop": ["Perfect cooking", "High performance", "Compact and portable"],
        "Range Hood": ["Odor removal", "High performance", "Compact and portable"],
        "Toaster": ["Perfect toast", "High performance", "Compact and portable"],
        "Mixer": ["Mixes ingredients effortlessly", "High performance", "Compact and portable"],
        "Slow Cooker": ["Slow and steady", "High performance", "Compact and portable"],
        "Grill": ["Perfectly grilled", "High performance", "Compact and portable"],
        "Food Processor": ["Effortless chopping", "High performance", "Compact and portable"],
        "Ice Maker": ["Ice on demand", "High performance", "Compact and portable"],
        "Television": ["Stunning visuals", "High performance", "Compact and portable"],
        "Soundbar": ["Immersive sound", "High performance", "Compact and portable"],
        "Home Theater System": ["Complete home theater", "High performance", "Compact and portable"],
        "Blu-ray Player": ["High definition", "High performance", "Compact and portable"],
        "Streaming Device": ["Endless entertainment", "High performance", "Compact and portable"],
        "Smart Plug": ["Smart control", "High performance", "Compact and portable"],
        "Smart Lock": ["Enhanced security", "High performance", "Compact and portable"],
        "Video Doorbell": ["Visitor alerts", "High performance", "Compact and portable"],
        "Baby Monitor": ["Monitor your baby", "High performance", "Compact and portable"],
        "Security System": ["Full protection", "High performance", "Compact and portable"]
    }';
    product_names TEXT[];
    product_name_count INT;
    i INT;
    random_product_name TEXT;
    random_description TEXT;
    random_price DECIMAL(9,2);
    random_stock_quantity SMALLINT;
    random_seller_id INT;
BEGIN
    -- Extract product names from JSON object
    SELECT array_agg(key) INTO product_names
    FROM jsonb_each_text(product_map::jsonb);
    
    -- Get the count of product names
    product_name_count := array_length(product_names, 1);

    FOR i IN 1..100000 LOOP
        -- Select a random product name
        random_product_name := product_names[(floor(random() * product_name_count) + 1)::int];
        
        -- Select a random description for the chosen product name
        SELECT value INTO random_description
        FROM jsonb_array_elements_text(product_map::jsonb -> random_product_name)
        OFFSET (floor(random() * (SELECT jsonb_array_length(product_map::jsonb -> random_product_name)))::int);
        
        -- Generate random data for other fields
        random_price := round((random() * 1000 + 1)::numeric, 2);  -- Price between 1.00 and 1000.00
        random_stock_quantity := (floor(random() * 100) + 1)::int;  -- Stock between 1 and 100
        random_seller_id := (floor(random() * 10100) + 1)::int;

        -- Insert the random product into the product table
        INSERT INTO product (name, description, price, stock_quantity, seller_id)
        VALUES (random_product_name, random_description, random_price, random_stock_quantity, random_seller_id);
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Calling the function to insert products
SELECT insert_random_products();
