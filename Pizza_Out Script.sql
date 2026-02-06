
-- 1. Total Revenue Generated
SELECT
ROUND( (SELECT SUM(total_price) 
FROM pizza_sales),2)
AS 'Total Revenue Generated';

-- 2. Average Order Value
SELECT
ROUND(
(SELECT SUM(total_price) / COUNT(DISTINCT order_id) 
FROM pizza_sales), 2)
AS 'Average Order Value';

-- 3. Total Pizzas Sold
SELECT SUM(quantity) 
AS 'Total Pizzas Sold'
FROM pizza_sales;

-- 4. Total Orders Placed
SELECT COUNT(DISTINCT order_id)
AS 'Total Orders Placed'
FROM pizza_sales;

-- 5. Average Pizzas per Order
SELECT
ROUND(
(SELECT SUM(quantity) / COUNT(DISTINCT order_id) 
FROM pizza_sales),2)
AS 'Average Pizzas Per Order'; 

-- Daily Trend
/*UPDATE pizza_sales 
SET 
    order_date = STR_TO_DATE(order_date, '%d-%m-%Y'); */
SELECT 
    DAYNAME(order_date) AS `Order Day`, 
    COUNT(DISTINCT order_id) AS `Total Orders` 
FROM pizza_sales 
GROUP BY DAYNAME(order_date); 

-- Hourly Trend
SELECT 
    HOUR(order_time) AS `Order Hours`, 
    COUNT(DISTINCT order_id) AS `Total Orders`
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time); 
-- Percentage of Sales by Pizza Category
SELECT 
    pizza_category AS 'Pizza Category',
    ROUND(SUM(total_price), 2) AS 'Total Sales',
    ROUND(SUM(total_price) * 100 / (SELECT 
                    SUM(total_price)
                FROM
                    pizza_sales),
            2) AS 'Percentage of Sales'
FROM
    pizza_sales
GROUP BY pizza_category; 

-- Percentage of Sales by Pizza Size
SELECT 
    pizza_size AS 'Pizza Size',
    ROUND(SUM(total_price), 2) AS 'Total Sales',
    ROUND(SUM(total_price) * 100 / (SELECT 
                    SUM(total_price)
                FROM
                    pizza_sales),
            2) AS 'Percentage of Sales'
FROM
    pizza_sales
GROUP BY pizza_size
ORDER BY 'Percentage of Sales'

-- Total Pizzas Sold by Category
SELECT 
    pizza_category AS 'Pizza Category',
    SUM(quantity) AS 'Total Pizzas Sold'
FROM
    pizza_sales
GROUP BY pizza_category  

-- Top 5 Best Sellers by Total Pizzas Sold

SELECT 
    pizza_name AS 'Pizza Name',
    SUM(quantity) AS 'Total Pizzas Sold'
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC
LIMIT 5; 

--  5 Worst Sellers by Total Pizzas Sold
SELECT 
    pizza_name AS 'Pizza Name',
    SUM(quantity) AS 'Total Pizzas Sold'
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC
LIMIT 5;

