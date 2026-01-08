ALTER TABLE clean_pizza_sales
ADD COLUMN order_hour INT,
ADD COLUMN order_day VARCHAR(10),
ADD COLUMN order_month VARCHAR(10);

UPDATE clean_pizza_sales
SET
  order_hour = EXTRACT(HOUR FROM order_time),
  order_day = TO_CHAR(order_date, 'Day'),
  order_month = TO_CHAR(order_date, 'Month');
