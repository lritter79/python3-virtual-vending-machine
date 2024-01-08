---- Table: public.item_categories

-- DROP TABLE IF EXISTS public.item_categories;

-- CREATE TABLE IF NOT EXISTS public.item_categories
-- (
--     name text COLLATE pg_catalog."default",
--     id integer NOT NULL DEFAULT 'nextval('catergories_serial'::regclass)',
--     CONSTRAINT item_categories_pkey PRIMARY KEY (id)
-- )

-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS public.item_categories
--     OWNER to postgres;

--SELECT * from item_categories
-- Table: public.items

-- DROP TABLE IF EXISTS public.items;

-- CREATE TABLE IF NOT EXISTS public.items
-- (
--     name text COLLATE pg_catalog."default",
--     id integer NOT NULL DEFAULT 'nextval('items_serial'::regclass)',
--     category_id integer NOT NULL,
--     price real,
--     CONSTRAINT items_pkey PRIMARY KEY (id),
--     CONSTRAINT category_id_fkey FOREIGN KEY (category_id)
--         REFERENCES public.item_categories (id) MATCH SIMPLE
--         ON UPDATE NO ACTION
--         ON DELETE NO ACTION
--         NOT VALID
-- )

-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS public.items
--     OWNER to postgres;
-- -- Index: fki_category_id_fkey

-- -- DROP INDEX IF EXISTS public.fki_category_id_fkey;

-- CREATE INDEX IF NOT EXISTS fki_category_id_fkey
--     ON public.items USING btree
--     (category_id ASC NULLS LAST)
--     TABLESPACE pg_default;

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
-- Table: public.slots

-- DROP TABLE IF EXISTS public.slots;

-- CREATE TABLE IF NOT EXISTS public.slots
-- (
--     slot_row "char" NOT NULL,
--     slot_column integer NOT NULL,
--     item_id integer NOT NULL,
--     CONSTRAINT unique_item UNIQUE (item_id),
--     CONSTRAINT items_fkey FOREIGN KEY (item_id)
--         REFERENCES public.items (id) MATCH SIMPLE
--         ON UPDATE NO ACTION
--         ON DELETE NO ACTION
-- )

-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS public.slots
--     OWNER to postgres;
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


---- Table: public.quantities

-- DROP TABLE IF EXISTS public.quantities;

-- CREATE TABLE IF NOT EXISTS public.quantities
-- (
--     quantity integer NOT NULL DEFAULT 0,
--     item_id integer,
--     CONSTRAINT uniq_item_id UNIQUE (item_id),
--     CONSTRAINT items_fkey FOREIGN KEY (item_id)
--         REFERENCES public.items (id) MATCH SIMPLE
--         ON UPDATE NO ACTION
--         ON DELETE NO ACTION
-- )

-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS public.quantities
--     OWNER to postgres;

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

-- CALL updateitemquantity(1)