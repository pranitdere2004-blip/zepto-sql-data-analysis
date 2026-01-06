create database zepto;
use zepto;

drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category varchar(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8, 2),
discountPercent NUMERIC(5, 2),
availableQuantity INTEGER,
discountedSellingprice NUMERIC(8, 2),
weightInGrm INTEGER,
outOfStock BOOLEAN,
qauntity INTEGER
);

-- After creating the table, the Zepto dataset was imported into the database for further analysis.

desc zepto;

-- A] Data exploration
select count(*) from zepto;

-- sample data
select * from zepto
limit 10;

-- null values 
select * from zepto
where name is null
or
category is null
or
mrp is null
or
discountPercent is null
or
availableQuantity is null
or
discountedSellingprice is null
or
weightInGrm is null
or
outOfStock is null
or
qauntity is null;

-- Different product categories
select distinct category
from zepto
order by category;

-- Products names present multiple times
select name, count(sku_id) as "Number of SKUs"
from zepto
group by name
having count(sku_id) > 1
order by count(sku_id) desc;

-- B] Data cleaning 

-- products with price = 0
select * from zepto
where mrp = 0 or discountedSellingprice = 0;

delete from zepto
where mrp = 0;

-- Converts paise to rupees
update zepto
set mrp = mrp / 100.0,
discountedSellingprice = discountedSellingprice / 100.0;

select mrp, discountedSellingprice from zepto;

-- C] Business Insight Questions with SQL Analysis

-- Q.1)Find the top 10 best-value products based on the discount percentage.
SELECT name, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

-- Q.2)Find the average MRP for each product category.
SELECT category, AVG(mrp) AS avg_mrp
FROM zepto
GROUP BY category;

-- Q.3)Find the total estimated revenue for each product category.
SELECT category, SUM(discountedSellingprice * qauntity) AS revenue
FROM zepto
GROUP BY category;

-- Q.4)Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10;

-- Q.5)Identify the top 5 categories offering the highest average discount percentage.
SELECT category, AVG(discountPercent) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q.6)Find the price per gram for products above 100g and sort by best value.
SELECT name, discountedSellingprice / weightInGrm AS price_per_gram
FROM zepto
WHERE weightInGrm > 100
ORDER BY price_per_gram;

-- Q.7) Group products into Low, Medium, and Bulk based on weight.
SELECT name,
CASE
  WHEN weightInGrm < 500 THEN 'Low'
  WHEN weightInGrm BETWEEN 500 AND 2000 THEN 'Medium'
  ELSE 'Bulk'
END AS weight_category
FROM zepto;

-- Q.8)What is the total inventory weight for each category?
SELECT category, SUM(weightInGrm * qauntity) AS total_weight
FROM zepto
GROUP BY category;

-- Q.9)Find the top 10 products giving maximum discount value in rupees.
SELECT name, (mrp - discountedSellingprice) AS discount_value
FROM zepto
ORDER BY discount_value DESC
LIMIT 10;

-- Q.10)Count how many products are in stock and out of stock.
SELECT outOfStock, COUNT(*) AS total_products
FROM zepto
GROUP BY outOfStock;

-- Q.11)Find products with very low inventory quantity (less than 10).
SELECT name, qauntity
FROM zepto
WHERE qauntity < 10;

-- Q.12)Find the average selling price for each category.
SELECT category, AVG(discountedSellingprice) AS avg_price
FROM zepto
GROUP BY category;

-- Q.13)List products that are sold without any discount.
SELECT name, mrp
FROM zepto
WHERE discountPercent = 0;

-- Q.14)Find categories having the maximum number of products.
SELECT category, COUNT(*) AS total_products
FROM zepto
GROUP BY category
ORDER BY total_products DESC;

-- Q.15)Find the total inventory value for each category.
SELECT category, SUM(mrp * qauntity) AS inventory_value
FROM zepto
GROUP BY category;
