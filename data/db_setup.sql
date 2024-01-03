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

--SELECT * from item_categories
--CREATE SEQUENCE items_serial AS integer START 1 OWNED BY items.id;

--ALTER TABLE items ALTER COLUMN id SET DEFAULT nextval('items_serial');

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
-- SELECT * FROM items

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
-- SELECT floor(random() * 10 + 1)::int;
-- INSERT INTO quantities (quantity, item_id)
-- VALUES ((SELECT floor(random() * 10 + 1)::int), 1);
--INSERT INTO quantities (quantity, item_id)
--VALUES ((SELECT floor(random() * 10 + 1)::int), 2);
--INSERT INTO quantities (quantity, item_id)
-- VALUES ((SELECT floor(random() * 10 + 1)::int), 3);
-- INSERT INTO quantities (quantity, item_id)
-- VALUES ((SELECT floor(random() * 10 + 1)::int), 4);
-- INSERT INTO quantities (quantity, item_id)
-- VALUES ((SELECT floor(random() * 10 + 1)::int), 5);
--SELECT * FROM quantities
--CREATE VIEW vending_machine AS
SELECT items.id AS id, price, item_categories.name AS category_name 
FROM items 
JOIN item_categories ON items.category_id = item_categories.id;
