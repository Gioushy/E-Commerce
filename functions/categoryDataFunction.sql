CREATE OR REPLACE FUNCTION insert_real_categories()
RETURNS VOID AS $$
DECLARE
    category_records JSONB := '[
        {"name": "Electronics", "parent": null},
        {"name": "Computers", "parent": "Electronics"},
        {"name": "Software", "parent": "Electronics"},
        {"name": "Video Games", "parent": "Electronics"},
        {"name": "Cameras", "parent": "Electronics"},
        {"name": "Audio & Home Theater", "parent": "Electronics"},
        {"name": "Wearable Technology", "parent": "Electronics"},
        {"name": "Phones & Accessories", "parent": "Electronics"},
        {"name": "Smart Home", "parent": "Electronics"},
        {"name": "Books", "parent": null},
        {"name": "Fiction", "parent": "Books"},
        {"name": "Non-Fiction", "parent": "Books"},
        {"name": "Children", "parent": "Books"},
        {"name": "Science", "parent": "Books"},
        {"name": "Technology", "parent": "Books"},
        {"name": "Business", "parent": "Books"},
        {"name": "Arts & Photography", "parent": "Books"},
        {"name": "History", "parent": "Books"},
        {"name": "Self-Help", "parent": "Books"},
        {"name": "Clothing", "parent": null},
        {"name": "Men", "parent": "Clothing"},
        {"name": "Women", "parent": "Clothing"},
        {"name": "Kids", "parent": "Clothing"},
        {"name": "Shoes", "parent": "Clothing"},
        {"name": "Accessories", "parent": "Clothing"},
        {"name": "Jewelry", "parent": null},
        {"name": "Watches", "parent": "Jewelry"},
        {"name": "Necklaces", "parent": "Jewelry"},
        {"name": "Earrings", "parent": "Jewelry"},
        {"name": "Bracelets", "parent": "Jewelry"},
        {"name": "Home & Kitchen", "parent": null},
        {"name": "Furniture", "parent": "Home & Kitchen"},
        {"name": "Appliances", "parent": "Home & Kitchen"},
        {"name": "Decor", "parent": "Home & Kitchen"},
        {"name": "Bedding", "parent": "Home & Kitchen"},
        {"name": "Storage & Organization", "parent": "Home & Kitchen"},
        {"name": "Beauty & Personal Care", "parent": null},
        {"name": "Makeup", "parent": "Beauty & Personal Care"},
        {"name": "Skincare", "parent": "Beauty & Personal Care"},
        {"name": "Hair Care", "parent": "Beauty & Personal Care"},
        {"name": "Fragrance", "parent": "Beauty & Personal Care"},
        {"name": "Tools & Accessories", "parent": "Beauty & Personal Care"},
        {"name": "Sports & Outdoors", "parent": null},
        {"name": "Camping & Hiking", "parent": "Sports & Outdoors"},
        {"name": "Exercise & Fitness", "parent": "Sports & Outdoors"},
        {"name": "Cycling", "parent": "Sports & Outdoors"},
        {"name": "Fishing", "parent": "Sports & Outdoors"},
        {"name": "Team Sports", "parent": "Sports & Outdoors"},
        {"name": "Toys & Games", "parent": null},
        {"name": "Action Figures", "parent": "Toys & Games"},
        {"name": "Board Games", "parent": "Toys & Games"},
        {"name": "Building Toys", "parent": "Toys & Games"},
        {"name": "Dolls", "parent": "Toys & Games"},
        {"name": "Remote Control Toys", "parent": "Toys & Games"},
        {"name": "Automotive", "parent": null},
        {"name": "Car Electronics", "parent": "Automotive"},
        {"name": "Car Care", "parent": "Automotive"},
        {"name": "Motorcycle & Powersports", "parent": "Automotive"},
        {"name": "Tools & Equipment", "parent": "Automotive"},
        {"name": "Replacement Parts", "parent": "Automotive"},
        {"name": "Health & Household", "parent": null},
        {"name": "Personal Care", "parent": "Health & Household"},
        {"name": "Vitamins & Dietary Supplements", "parent": "Health & Household"},
        {"name": "Medical Supplies", "parent": "Health & Household"},
        {"name": "Household Supplies", "parent": "Health & Household"},
        {"name": "Baby", "parent": null},
        {"name": "Baby Products", "parent": "Baby"},
        {"name": "Feeding", "parent": "Baby"},
        {"name": "Diapering", "parent": "Baby"},
        {"name": "Bathing", "parent": "Baby"},
        {"name": "Nursery", "parent": "Baby"},
        {"name": "Grocery", "parent": null},
        {"name": "Snacks", "parent": "Grocery"},
        {"name": "Beverages", "parent": "Grocery"},
        {"name": "Pantry Staples", "parent": "Grocery"},
        {"name": "Breakfast Foods", "parent": "Grocery"},
        {"name": "Pet Supplies", "parent": null},
        {"name": "Pet Food", "parent": "Pet Supplies"},
        {"name": "Pet Grooming", "parent": "Pet Supplies"},
        {"name": "Pet Health", "parent": "Pet Supplies"},
        {"name": "Pet Toys", "parent": "Pet Supplies"},
        {"name": "Office Products", "parent": null},
        {"name": "Office Electronics", "parent": "Office Products"},
        {"name": "Office Furniture", "parent": "Office Products"},
        {"name": "Office Supplies", "parent": "Office Products"},
        {"name": "Garden & Outdoor", "parent": null},
        {"name": "Gardening", "parent": "Garden & Outdoor"},
        {"name": "Patio Furniture", "parent": "Garden & Outdoor"},
        {"name": "Outdoor Decor", "parent": "Garden & Outdoor"},
        {"name": "Tools & Home Improvement", "parent": null},
        {"name": "Power Tools", "parent": "Tools & Home Improvement"},
        {"name": "Hand Tools", "parent": "Tools & Home Improvement"},
        {"name": "Home Security", "parent": "Tools & Home Improvement"},
        {"name": "Electrical", "parent": "Tools & Home Improvement"}
    ]';
    category JSONB;
    parent_id INT;
BEGIN
    FOR category IN SELECT * FROM jsonb_array_elements(category_records) LOOP
        IF category->>'parent' IS NULL THEN
            -- Insert top-level category
            INSERT INTO category (name, parent_category_id)
            VALUES (category->>'name', NULL);
        ELSE
            -- Find the parent category id
            SELECT c.id INTO parent_id FROM category c WHERE c.name = category->>'parent';
            -- Insert subcategory with the parent_id
            INSERT INTO category (name, parent_category_id)
            VALUES (category->>'name', parent_id);
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Calling the function to insert categories
SELECT insert_real_categories();
