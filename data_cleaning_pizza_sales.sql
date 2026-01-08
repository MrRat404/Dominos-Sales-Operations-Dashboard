CREATE TABLE clean_pizza_sales AS
SELECT DISTINCT *
FROM pizza_sales;

DELETE FROM clean_pizza_sales
WHERE order_id IS NULL
   OR order_date IS NULL
   OR total_price IS NULL;
ALTER TABLE clean_pizza_sales
ALTER COLUMN order_date TYPE DATE,
ALTER COLUMN order_time TYPE TIME,
ALTER COLUMN quantity TYPE INT,
ALTER COLUMN unit_price TYPE NUMERIC(10,2),
ALTER COLUMN total_price TYPE NUMERIC(10,2);
UPDATE clean_pizza_sales
SET pizza_category = INITCAP(TRIM(pizza_category)),
    pizza_size = UPPER(TRIM(pizza_size)),
    pizza_name = INITCAP(TRIM(pizza_name));
DELETE FROM clean_pizza_sales
WHERE total_price <> quantity * unit_price;
