USE CAR_PREDICTION;
SELECT * FROM CAR_PRICE_PREDICTION;

-- QUERY 1 
-- - List all car brands available in the dataset.
SELECT  DISTINCT BRAND FROM CAR_PRICE_PREDICTION;

-- QUERY 2
-- - Show the details of cars manufactured after the year 2020.
SELECT * FROM CAR_PRICE_PREDICTION
WHERE YEAR > 2020;

-- QUERY 3
-- Retrieve all cars where the fuel type is "Petrol".
SELECT * FROM CAR_PRICE_PREDICTION
WHERE FUEL_TYPE = 'PETROL';

-- QUERY 4 
-- Find the car models with mileage less than 50,000.
SELECT * FROM CAR_PRICE_PREDICTION
WHERE MILEAGE < 50000;

-- QUERY 5 
-- Display the car_id, brand, and price of cars sorted by price in descending order.
SELECT CAR_ID,BRAND,PRICE FROM CAR_PRICE_PREDICTION 
ORDER BY PRICE DESC;

-- QUERY 6
-- Find the average price of cars grouped by brand
SELECT BRAND,ROUND(AVG(PRICE),2) AS AVG_PRICE FROM CAR_PRICE_PREDICTION 
GROUP BY BRAND;

-- QUERY 7
-- Retrieve the top 5 most expensive cars in the dataset.
SELECT * FROM CAR_PRICE_PREDICTION 
ORDER BY PRICE DESC
LIMIT 5;

-- QUERY 8 
-- how all cars where the transmission is "Automatic" and condition is "LIKE NEW".
SELECT * FROM CAR_PRICE_PREDICTION 
WHERE TRANSMISSION  = 'AUTOMATIC' AND CONDITIONS = 'LIKE NEW';

-- QUERY 9
-- Count how many cars are available for each fuel type.
SELECT FUEL_TYPE,COUNT(FUEL_TYPE) AS COUNT FROM CAR_PRICE_PREDICTION
GROUP BY FUEL_TYPE;

-- QUERY 10 
-- Find cars with engine_size greater than 3.5 and mileage less than 30,000.
SELECT * FROM CAR_PRICE_PREDICTION 
WHERE ENGINE_SIZE > 3.5 AND MILEAGE <30000;

-- QUERY 11 
-- Write a query to find the cheapest car for each brand
SELECT BRAND,MIN(PRICE) AS  CHEAPEST_PRICE FROM CAR_PRICE_PREDICTION
GROUP BY BRAND 
ORDER BY CHEAPEST_PRICE DESC;

-- QUERY 12 
-- Retrieve the brand and model of cars whose price is above the average price of all cars.
SELECT BRAND,MODEL,PRICE FROM CAR_PRICE_PREDICTION
WHERE PRICE >(SELECT ROUND(AVG(PRICE),2) AS AVG_PRICE FROM CAR_PRICE_PREDICTION);

-- QUERY 13
-- Show the number of cars manufactured each year (group by year).
SELECT YEAR,COUNT(*) AS NUMBER_CARS FROM CAR_PRICE_PREDICTION
GROUP BY YEAR
ORDER BY YEAR;

-- QUERY 14 
-- Find the car(s) with the maximum mileage in the dataset.
SELECT MAX(MILEAGE) AS MAX_MILEAGE FROM CAR_PRICE_PREDICTION;

-- QUERY 15
-- Find the average price of cars grouped by fuel_type.
SELECT FUEL_TYPE, ROUND(AVG(PRICE),2) AS AVG_PRICE_FUEL FROM CAR_PRICE_PREDICTION 
GROUP BY FUEL_TYPE 
ORDER BY AVG_PRICE_FUEL DESC;

-- QUERY 16
-- Show cars ordered by mileage in ascending order.
SELECT * FROM CAR_PRICE_PREDICTION
ORDER BY MILEAGE ASC;

-- QUERY 17
-- Rank cars within each brand based on their price.
SELECT BRAND,MILEAGE,PRICE,MODEL ,RANK()
 OVER(PARTITION BY BRAND ORDER BY PRICE )AS CAR_RANK
 FROM CAR_PRICE_PREDICTION;
 
 -- QUERY 18 
 -- Write a query to calculate the age of each car (current_year - year) and display it with price.
SELECT PRICE, 
(EXTRACT(YEAR FROM CURRENT_DATE) - YEAR) AS CAR_AGE 
FROM CAR_PRICE_PREDICTION;

-- QUERY 19 
-- Find cars where the model name contains the word "EXPLORER".
SELECT * FROM CAR_PRICE_PREDICTION 
WHERE MODEL = "EXPLORER";

-- QUERY 20 
-- Show cars that are not in "used" condition.
SELECT * FROM CAR_PRICE_PREDICTION 
WHERE CONDITIONS  NOT IN ('USED');

-- QUERY 21 
-- Retrieve cars where year BETWEEN 2010 AND 2020
SELECT * FROM CAR_PRICE_PREDICTION 
WHERE YEAR BETWEEN 2010 AND 2020;

-- QUERY 22 
-- Show cars that have mileage less than the minimum mileage of cars from Toyota.
SELECT * FROM CAR_PRICE_PREDICTION
WHERE MILEAGE < ( SELECT MIN(MILEAGE) AS MIN_MILEAGE FROM CAR_PRICE_PREDICTION WHERE BRAND = "TOYOTA");

-- QUERY 23
-- Retrieve cars where year is equal to the maximum year in the dataset.
SELECT * FROM CAR_PRICE_PREDICTION 
WHERE YEAR = (SELECT MAX(YEAR) AS MAX_YEAR FROM CAR_PRICE_PREDICTION);

-- QUERY 24
-- Show cars where the model name starts with "E" and fuel_type = 'Petrol'
SELECT * FROM CAR_PRICE_PREDICTION 
WHERE MODEL LIKE "E%" AND FUEL_TYPE = 'PETROL';

-- QUERY 25 
-- Retrieve cars that have both low mileage (<30,000) and low price (<500,000).
SELECT * FROM CAR_PRICE_PREDICTION 
WHERE MILEAGE < 30000 AND PRICE < 50000;

-- QUERY 26 
-- - Find the most common transmission type in the dataset
SELECT TRANSMISSION,COUNT(*) AS TRANSMISSION_COUNT FROM CAR_PRICE_PREDICTION
GROUP BY TRANSMISSION 
ORDER BY TRANSMISSION_COUNT
LIMIT 1;

