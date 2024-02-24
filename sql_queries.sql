-- creating database

create database walmart_sales;

-- reading data after importing

SELECT 
    *
FROM
    sales;

-- Feature Engineering----------------------------------------------------------------------------------------------

-- checking data types

desc sales;


-- changing date and time date types
alter table sales
modify time time;


alter table sales
modify date datetime;


-- categorizing time into different time of day

SELECT 
    time,
    (CASE
        WHEN `time` BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN `time` BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END) AS time_of_day
FROM
    sales;
    
-- creating time_of day column
    
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

-- populating the time_of_day column based on values created

UPDATE sales
SET time_of_day = (
    CASE
        WHEN `time` BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN `time` BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END);


-- creating day_name column

SELECT 
    date, DAYNAME(date)
FROM
    sales;

alter table sales add column day_name varchar(10);

UPDATE sales 
SET 
    day_name = DAYNAME(date);
    
    
-- creating month_name column
SELECT 
    date, MONTHNAME(date)
FROM
    sales;

alter table sales add column month_name varchar(30);
UPDATE sales 
SET 
    month_name = MONTHNAME(date);


-- reading our data with newly added columns

SELECT 
    *
FROM
    sales;


-- ----------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------- Generic Questions--------------------------------------

-- How many branches does the store have?

SELECT 
    COUNT(DISTINCT branch) AS num_of_branches
FROM
    sales;
    
-- Insight: the store has 3 branches.


--  In which city is each branch?

SELECT DISTINCT
    city, branch
FROM
    sales;

-- Insight: branch A is located in Yangon, branch B in Mandalay and branch C in Naypyitaw


-- What are the unique customer types of the store?

SELECT DISTINCT
    Customer_type
FROM
    sales;
    
-- Insight : the store has two main customer types ;member and normal.
    
   
--  What payment methods does the store have?

SELECT DISTINCT
    payment
FROM
    sales;
    
-- Insight : Ewallet, Cash, Credit card
    
    
-- what is the gender distribution of customers of this store?
    
SELECT 
    gender, COUNT(*) AS gender_cnt
FROM
    sales
GROUP BY gender
ORDER BY gender_cnt DESC;

-- Insight :  The store has 501 female customers and 499 male customers.


-- ------------------------------------- Product Analysis-------------------------------------------------------------------------------------------------
    
-- What is the average unit price of each product line?
    
    SELECT 
    Product_line, ROUND(AVG(Unit_price), 2) AS Avg_Unit_Price
FROM
    sales
GROUP BY Product_line;

-- Insight : Health and beauty- $54.85, Electronic accessories-$53.55, Home and lifestyle- $55.32,Sports and travel-$56.99,
-- Food and beverages-$56.01,Fashion accessories- $57.15


-- What is the most selling product line?

SELECT 
    product_line, SUM(total) AS total_sale
FROM
    sales
GROUP BY product_line
ORDER BY total_sale DESC;

-- Insight: most selling productline is food and beverages


-- which productline incurred the largest taxes?

SELECT 
    product_line, AVG(Tax) AS avg_tax
FROM
    sales
GROUP BY product_line
ORDER BY avg_tax DESC;

-- Insight : Highest charges are paid mostly on  Home & Lifestyle product line


-- ------------------------------------------- Sales Analysis---------------------------------------------------------------------------------------

--   What month recorded the highest sale?
  
SELECT 
    month_name, round(sum(total),2) AS total_sale
FROM
    sales
GROUP BY month_name
ORDER BY total_sale DESC;

-- Insight: The store made their highest sale in January with an amount of $116291.87


  -- What month had the highest COGS?
  
SELECT 
    month_name AS month, round(sum(cogs),2) AS cogs
FROM
    sales
GROUP BY month_name
ORDER BY cogs DESC;

-- Insight: The highest cogs of the store was in January amounting to $110754.16


-- What time of day does the store make the most sale?

SELECT 
    time_of_day, round(SUM(total),2) AS total_sale
FROM
    sales
GROUP BY time_of_day
ORDER BY total_sale DESC;

-- Insight : the store made the highest sale in the evenings with an amount of $138370.92


-- which day does the store make the highest revenue?
SELECT 
    day_name, SUM(gross_income) AS total_revenue
FROM
    sales
GROUP BY day_name
ORDER BY total_revenue DESC;

-- Insight : It appears the store makes the highest revenue mostly on saturdays


-- which branch recorded the highest sale?

SELECT 
    city, branch, round(SUM(total),2) AS total_sale
FROM
    sales
GROUP BY city , branch
ORDER BY total_sale desc;

-- branch C in Naypyitaw recorded the highest sale with $110568.71 


-- which branch sold more products than the average quantity of products sold?

SELECT 
    branch, SUM(quantity) AS qty
FROM
    sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT 
        AVG(quantity)
    FROM
        sales);
        
-- Insight :branch A sold the most quantity of goods


-- which of the customer type contribute most to total sales?

SELECT 
    customer_type, round(SUM(total), 2) AS total_sale
FROM
    sales
GROUP BY customer_type
ORDER BY total_sale DESC;

-- the member customer type contribute most to sales with an amount of $164223.44


-- which gender makes the most purchases?

SELECT
	gender,
    COUNT(*)
FROM sales
GROUP BY gender;
 
-- Insight : females make the most purchases


-- ----------------------------- Customer satisfaction-----------------------------------------------------------------------------------------------------
  
  -- what is the average rating of each branch by customers?

SELECT 
    ROUND(AVG(rating), 2) AS avg_rating, branch
FROM
    sales
GROUP BY branch
ORDER BY avg_rating DESC;

-- Insight: Branch C is highly rated as compared to the other 2 branches


-- Do certain product lines receive higher ratings than others?

SELECT 
    ROUND(AVG(rating), 2) AS avg_rating, Product_line
FROM
    sales
GROUP BY product_line
ORDER BY avg_rating DESC;
 
 -- As compared to other product lines, food and beverages has the highest rating of 7.11


-- what product line is mostly preferred by each gender?

SELECT 
    gender, product_line, COUNT(gender) AS total_count
FROM
    sales
GROUP BY gender , product_line
ORDER BY total_count DESC;

-- Insight : Females mostly prefer food and beverages, males on the other hand prefer health and beauty  products


-- What customer type make the most purchases?
SELECT 
    customer_type, COUNT(*)
FROM
    sales
GROUP BY customer_type;

-- Insight:  the member customer type makes the most purchases


-- which customer type pays the most taxes?

SELECT 
    customer_type, AVG(tax) AS tax
FROM
    sales
GROUP BY customer_type
ORDER BY tax DESC;

-- Insight : the member customer type pay the most taxes




-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



