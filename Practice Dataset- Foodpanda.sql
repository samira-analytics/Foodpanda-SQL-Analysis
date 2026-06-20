-- Practice Dataset- foodpanda

-- Data Cleaning

SELECT*
FROM foodpanda;

CREATE TABLE foodpanda_raw
LIKE foodpanda;

INSERT INTO foodpanda_raw
SELECT*
FROM foodpanda;

SELECT*
FROM foodpanda_raw;

-- Remove Duplicates

CREATE TABLE `foodpanda_raw2` (
  `customer_id` text,
  `gender` text,
  `age` text,
  `city` text,
  `signup_date` text,
  `order_id` text,
  `order_date` text,
  `restaurant_name` text,
  `dish_name` text,
  `category` text,
  `quantity` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `payment_method` text,
  `order_frequency` int DEFAULT NULL,
  `last_order_date` text,
  `loyalty_points` int DEFAULT NULL,
  `churned` text,
  `rating` int DEFAULT NULL,
  `rating_date` text,
  `delivery_status` text,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO foodpanda_raw2
SELECT*,
ROW_NUMBER () OVER(PARTITION BY customer_id,gender,age,city,signup_date,
order_id,order_date,restaurant_name,dish_name,category,quantity,price,payment_method,
order_frequency, last_order_date,loyalty_points,churned,rating,rating_date,
delivery_status) AS row_num
FROM foodpanda_raw;

SELECT*
FROM foodpanda_raw2
WHERE row_num>1;
-- No duplicates

-- Remove NUll values

SELECT *
FROM foodpanda_raw2
WHERE customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR city IS NULL
   OR signup_date IS NULL
   OR order_id IS NULL
   OR order_date IS NULL
   OR restaurant_name IS NULL
   OR dish_name IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price IS NULL
   OR payment_method IS NULL
   OR order_frequency IS NULL
   OR last_order_date IS NULL
   OR loyalty_points IS NULL
   OR churned IS NULL
   OR rating IS NULL
   OR rating_date IS NULL
   OR delivery_status IS NULL;
   
   SELECT*
   FROM foodpanda_raw2
   WHERE price IS NULL;
   
   SELECT *
FROM foodpanda_raw2
WHERE customer_id IS NULL OR customer_id = ''
   OR city IS NULL OR city = ''
   OR payment_method IS NULL OR payment_method = '';
   
   -- NO null values
   
   -- TRIM dates
SELECT*
FROM foodpanda_raw2;

SELECT signup_date,TRIM(signup_date)
FROM foodpanda_raw2;

UPDATE foodpanda_raw2
SET signup_date=TRIM(signup_date);

SELECT last_order_date,TRIM(last_order_date)
FROM foodpanda_raw2;

UPDATE foodpanda_raw2
SET last_order_date=TRIM(last_order_date);

SELECT rating_date,TRIM(rating_date)
FROM foodpanda_raw2;

UPDATE foodpanda_raw2
SET rating_date=TRIM(rating_date);

SELECT order_date,TRIM(order_date)
FROM foodpanda_raw2;

UPDATE foodpanda_raw2
SET order_date=TRIM(order_date);

-- Change Date Format from TEXT TO DATE

SELECT signup_date,
STR_TO_DATE (`signup_date`,'%m/%d/%Y')
FROM foodpanda_raw2;

UPDATE foodpanda_raw2
SET `signup_date`= STR_TO_DATE (`signup_date`,'%m/%d/%Y');

ALTER TABLE foodpanda_raw2
MODIFY COLUMN `signup_date` DATE;

SELECT order_date,
STR_TO_DATE (`order_date`,'%m/%d/%Y')
FROM foodpanda_raw2;

UPDATE foodpanda_raw2
SET `order_date`= STR_TO_DATE (`order_date`,'%m/%d/%Y');

ALTER TABLE foodpanda_raw2
MODIFY COLUMN `order_date` DATE;

SELECT last_order_date,
STR_TO_DATE (`last_order_date`,'%m/%d/%Y')
FROM foodpanda_raw2;

UPDATE foodpanda_raw2
SET `last_order_date`= STR_TO_DATE (`last_order_date`,'%m/%d/%Y');


ALTER TABLE foodpanda_raw2
MODIFY COLUMN `last_order_date` DATE;

SELECT rating_date,
STR_TO_DATE (`rating_date`,'%m/%d/%Y')
FROM foodpanda_raw2;

UPDATE foodpanda_raw2
SET `rating_date`= STR_TO_DATE (`rating_date`,'%m/%d/%Y');

ALTER TABLE foodpanda_raw2
MODIFY COLUMN `rating_date` DATE;

SELECT*
FROM foodpanda_raw2;

ALTER TABLE foodpanda_raw2
DROP COLUMN row_num;

CREATE TABLE foodpanda_orders
LIKE foodpanda_raw2;

INSERT foodpanda_orders
SELECT*
FROM foodpanda_raw2;

SELECT*
FROM foodpanda_orders;

-- Exploratary Data Analysis

SELECT order_id,quantity,price,
quantity*price AS total_revenue
FROM foodpanda_orders;

-- Total no. of customers

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM foodpanda_orders;

-- Total no.of orders

SELECT COUNT(DISTINCT order_id) AS total_orders
FROM foodpanda_orders;

-- Customers by city

SELECT city, COUNT(DISTINCT customer_id) AS customers
FROM foodpanda_orders
GROUP BY city
ORDER BY customers DESC;

-- Monthly Revenue Trend

SELECT DATE_FORMAT(order_date,'%Y-%m') AS `month`,
round(SUM(price),2)AS revenue
FROM foodpanda_orders
GROUP BY `month`
ORDER BY `month`;

-- Popular dishes
SELECT dish_name,
       SUM(quantity) AS total_quantity
FROM foodpanda_orders
GROUP BY dish_name
ORDER BY total_quantity DESC
LIMIT 10;
