-- CREATE SEQUENCE catergories_serial AS integer START 1 OWNED BY item_categories.id;

-- ALTER TABLE item_categories ALTER COLUMN id SET DEFAULT nextval('catergories_serial');

-- INSERT INTO item_categories (name)
-- VALUES ('candy');
-- INSERT INTO item_categories (name)
-- VALUES ('gum');
-- INSERT INTO item_categories (name)
-- VALUES ('beverage');
-- INSERT INTO item_categories (name)
-- VALUES ('snack');

-- SELECT * from item_categories
-- CREATE SEQUENCE items_serial AS integer START 1 OWNED BY items.id;

-- ALTER TABLE items ALTER COLUMN id SET DEFAULT nextval('items_serial');

-- INSERT INTO items (name, category_id)
-- VALUES ('Peanutbutter Cup', 1)
-- INSERT INTO items (name, category_id)
-- VALUES ('Peanutbutter Chew', 2);
-- INSERT INTO items (name, category_id)
-- VALUES ('Peanutbutter Yoohoo', 3);
-- INSERT INTO items (name, category_id)
-- VALUES ('Peanutbutter Sandwich', 4);
-- INSERT INTO items (name, category_id)
-- VALUES ('Yoohoo', 3);

-- INSERT INTO slots (slot_row, slot_column, item_id)
-- VALUES ('A', 2, 1);
-- INSERT INTO slots (slot_row, slot_column, item_id)
-- VALUES ('B', 2, 2);
-- INSERT INTO slots (slot_row, slot_column, item_id)
-- VALUES ('D', 9, 3);
-- INSERT INTO slots (slot_row, slot_column, item_id)
-- VALUES ('G', 4, 4);
-- INSERT INTO slots (slot_row, slot_column, item_id)
-- VALUES ('C', 7, 5);
-- SELECT  * FROM slots

-- INSERT INTO quantities (quantity, item_id)
-- VALUES ((SELECT floor(random() * 10 + 1)::int), 1);
-- INSERT INTO quantities (quantity, item_id)
-- VALUES ((SELECT floor(random() * 10 + 1)::int), 2);
-- INSERT INTO quantities (quantity, item_id)
-- VALUES ((SELECT floor(random() * 10 + 1)::int), 3);
-- INSERT INTO quantities (quantity, item_id)
-- VALUES ((SELECT floor(random() * 10 + 1)::int), 4);
-- INSERT INTO quantities (quantity, item_id)
-- VALUES ((SELECT floor(random() * 10 + 1)::int), 5);

-- CREATE VIEW vending_machine AS
-- SELECT items.id AS id, price, item_categories.name AS category_name 
-- FROM items 
-- JOIN item_categories ON items.category_id = item_categories.id;

-- CREATE OR REPLACE PROCEDURE vend_item(item_id INT)
-- LANGUAGE plpgsql
-- AS $$
--         DECLARE current_quantity INT;
--         DECLARE vend_item_id INT;
-- BEGIN
-- 	SELECT item_id INTO vend_item_id;
--     -- Check if the item exists in the items table
--     IF EXISTS (SELECT 1 FROM items WHERE items.id = vend_item_id) THEN
--         -- Check if quantity is greater than 0 in the quantity table
--         SELECT quantity INTO current_quantity FROM quantities WHERE quantities.item_id = vend_item_id;

--         IF current_quantity > 0 THEN
--             -- Update the quantity by subtracting 1
--             UPDATE quantities SET quantity = quantity - 1 WHERE quantities.item_id = vend_item_id;
--             RAISE NOTICE 'Quantity updated successfully';
--         ELSE
--             RAISE EXCEPTION 'Item has run out';
--         END IF;
--     ELSE
--         RAISE EXCEPTION 'Item does not exist';
--     END IF;
-- END;
-- $$;

