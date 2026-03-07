-- Zara Product Analysis SQL Script

-- Create Table
CREATE TABLE zara_products (
    product_id INT,
    product_position VARCHAR(50),
    promotion VARCHAR(10),
    product_category VARCHAR(100),
    seasonal VARCHAR(10),
    sales_volume INT,
    price DECIMAL(10,2),
    terms VARCHAR(100),
    section VARCHAR(20)
);


-- Total Sales
SELECT SUM(sales_volume) AS total_sales
FROM zara_products;

-- Average Price 
SELECT AVG(price) AS avg_price
FROM zara_products;

-- Total Products
SELECT COUNT(DISTINCT product_id) AS total_products
FROM zara_products;

-- Promotion Percentage
SELECT 
ROUND(
100 * SUM(CASE WHEN promotion='Yes' THEN 1 ELSE 0 END) / COUNT(*),2
) AS promotion_percentage
FROM zara_products;


-- Sales by Section
SELECT
section,
SUM(sales_volume) AS total_sales
FROM zara_products
GROUP BY section
ORDER BY total_sales DESC;

-- Sales by Product Position
SELECT
product_position,
SUM(sales_volume) AS total_sales
FROM zara_products
GROUP BY product_position
ORDER BY total_sales DESC;

-- Promotion Impact
SELECT
promotion,
SUM(sales_volume) AS total_sales
FROM zara_products
GROUP BY promotion;

-- Seasonal vs Non Seasonal
SELECT
seasonal,
SUM(sales_volume) AS total_sales
FROM zara_products
GROUP BY seasonal;

-- Top Selling Product Types
SELECT
terms,
SUM(sales_volume) AS total_sales
FROM zara_products
GROUP BY terms
ORDER BY total_sales DESC;

-- Average Price by Section
SELECT
section,
AVG(price) AS avg_price
FROM zara_products
GROUP BY section;

-- Price vs Sales Volume
SELECT
price,
sales_volume
FROM zara_products
ORDER BY price;