CREATE OR REPLACE FUNCTION map_products_to_semantic_categories() RETURNS VOID AS $$
DECLARE
    product_record RECORD;
    category_id INT;
BEGIN
    FOR product_record IN 
        SELECT id, name FROM product 
    LOOP
        -- Default to NULL for category assignment
        category_id := NULL;

        -- Mapping Logic based on product descriptions
        IF product_record.name ILIKE '%laptop%' THEN
            category_id := 2;  -- Computers
        ELSIF product_record.name ILIKE '%smartphone%' THEN
            category_id := 8;  -- Phones & Accessories
        ELSIF product_record.name ILIKE '%tablet%' THEN
            category_id := 1;  -- Electronics
        ELSIF product_record.name ILIKE '%headphones%' THEN
            category_id := 6;  -- Audio & Home Theater
        ELSIF product_record.name ILIKE '%smartwatch%' THEN
            category_id := 7;  -- Wearable Technology
        ELSIF product_record.name ILIKE '%camera%' THEN
            category_id := 5;  -- Cameras
        ELSIF product_record.name ILIKE '%printer%' THEN
            category_id := 1;  -- Electronics
        ELSIF product_record.name ILIKE '%monitor%' THEN
            category_id := 2;  -- Computers
        ELSIF product_record.name ILIKE '%keyboard%' THEN
            category_id := 2;  -- Computers
        ELSIF product_record.name ILIKE '%mouse%' THEN
            category_id := 2;  -- Computers
        ELSIF product_record.name ILIKE '%router%' THEN
            category_id := 9;  -- Smart Home
        ELSIF product_record.name ILIKE '%external hard drive%' THEN
            category_id := 2;  -- Computers
        ELSIF product_record.name ILIKE '%usb flash drive%' THEN
            category_id := 2;  -- Computers
        ELSIF product_record.name ILIKE '%ssd%' THEN
            category_id := 2;  -- Computers
        ELSIF product_record.name ILIKE '%graphics card%' THEN
            category_id := 2;  -- Computers
        ELSIF product_record.name ILIKE '%motherboard%' THEN
            category_id := 2;  -- Computers
        ELSIF product_record.name ILIKE '%cpu%' THEN
            category_id := 2;  -- Computers
        ELSIF product_record.name ILIKE '%ram%' THEN
            category_id := 2;  -- Computers
        ELSIF product_record.name ILIKE '%power supply%' THEN
            category_id := 2;  -- Computers
        ELSIF product_record.name ILIKE '%case%' THEN
            category_id := 2;  -- Computers
        ELSIF product_record.name ILIKE '%drone%' THEN
            category_id := 9;  -- Smart Home
        ELSIF product_record.name ILIKE '%game console%' THEN
            category_id := 4;  -- Video Games
        ELSIF product_record.name ILIKE '%vr headset%' THEN
            category_id := 7;  -- Wearable Technology
        ELSIF product_record.name ILIKE '%smart speaker%' THEN
            category_id := 9;  -- Smart Home
        ELSIF product_record.name ILIKE '%smart light bulb%' THEN
            category_id := 9;  -- Smart Home
        ELSIF product_record.name ILIKE '%fitness tracker%' THEN
            category_id := 43;  -- Sports & Outdoors
        ELSIF product_record.name ILIKE '%digital photo frame%' THEN
            category_id := 9;  -- Smart Home
        ELSIF product_record.name ILIKE '%projector%' THEN
            category_id := 1;  -- Electronics
        ELSIF product_record.name ILIKE '%home security camera%' THEN
            category_id := 9;  -- Smart Home
        ELSIF product_record.name ILIKE '%smart thermostat%' THEN
            category_id := 9;  -- Smart Home
        ELSIF product_record.name ILIKE '%electric toothbrush%' THEN
            category_id := 62;  -- Personal Care
        ELSIF product_record.name ILIKE '%hair dryer%' THEN
            category_id := 62;  -- Personal Care
        ELSIF product_record.name ILIKE '%shaver%' THEN
            category_id := 62;  -- Personal Care
        ELSIF product_record.name ILIKE '%coffee maker%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%blender%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%microwave%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%air fryer%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%rice cooker%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%pressure cooker%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%juicer%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%vacuum cleaner%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%air purifier%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%humidifier%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%fan%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%space heater%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%iron%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%sewing machine%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%water filter%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%dishwasher%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%washing machine%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%refrigerator%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%oven%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%cooktop%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%range hood%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%toaster%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%mixer%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%slow cooker%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%grill%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%food processor%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%ice maker%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%television%' THEN
            category_id := 33;  -- Appliances
        ELSIF product_record.name ILIKE '%soundbar%' THEN
            category_id := 1;  -- Electronics
        ELSIF product_record.name ILIKE '%home theater system%' THEN
            category_id := 1;  -- Electronics
        ELSIF product_record.name ILIKE '%blu-ray player%' THEN
            category_id := 1;  -- Electronics
        ELSIF product_record.name ILIKE '%streaming device%' THEN
            category_id := 1;  -- Electronics
        ELSIF product_record.name ILIKE '%smart plug%' THEN
            category_id := 9;  -- Smart Home
        ELSIF product_record.name ILIKE '%smart lock%' THEN
            category_id := 9;  -- Smart Home
        ELSIF product_record.name ILIKE '%video doorbell%' THEN
            category_id := 9;  -- Smart Home
        ELSIF product_record.name ILIKE '%baby monitor%' THEN
            category_id := 9;  -- Smart Home
        ELSIF product_record.name ILIKE '%security system%' THEN
            category_id := 9;  -- Smart Home
        END IF;

        -- Insert into the mapping table if a valid category ID is found
        IF category_id IS NOT NULL THEN
            INSERT INTO category_products (category_id, product_id)
            VALUES (category_id, product_record.id);
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT map_products_to_semantic_categories();
