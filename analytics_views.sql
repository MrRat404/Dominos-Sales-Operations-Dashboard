#Revenue Trend (Daily)
CREATE VIEW daily_revenue AS
SELECT
  order_date,
  SUM(total_price) AS daily_revenue
FROM clean_pizza_sales
GROUP BY order_date;

#Peak Hours Analysis
  
CREATE VIEW hourly_orders AS
SELECT
  order_hour,
  COUNT(DISTINCT order_id) AS total_orders,
  SUM(total_price) AS revenue
FROM clean_pizza_sales
GROUP BY order_hour
ORDER BY order_hour;

#Top Performing Pizzas

CREATE VIEW top_pizzas AS
SELECT
  pizza_name,
  SUM(quantity) AS total_quantity_sold,
  SUM(total_price) AS total_revenue
FROM clean_pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC;

#Category Performance
CREATE VIEW category_performance AS
SELECT
  pizza_category,
  COUNT(DISTINCT order_id) AS orders,
  SUM(total_price) AS revenue
FROM clean_pizza_sales
GROUP BY pizza_category;

#Average Order Value (AOV)
CREATE VIEW avg_order_value AS
SELECT
  ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM clean_pizza_sales;
