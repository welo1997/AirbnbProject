Select * 
FROM listings_cleaned
WHERE price > 10000;

SELECT *
FROM listings_cleaned
WHERE neighbourhood_cleansed = "Praha 1"
ORDER BY price DESC LIMIT 5000;

Select * 
FROM listings_cleaned
WHERE price< 1000;

Select * 
FROM listings_cleaned
WHERE price > 5000;

ALTER TABLE listings_cleaned
DROP COLUMN host_listings_count;

ALTER TABLE listings_cleaned
DROP COLUMN host_total_listings_count;

ALTER TABLE listings_cleaned
MODIFY COLUMN review_scores_rating DECIMAL(10,2);

UPDATE listings_cleaned
SET bedrooms = 1
WHERE bedrooms = 0;

UPDATE listings_cleaned
SET season = "Spring_2025"
WHERE season = "Spring";

DELETE FROM listings_cleaned
WHERE price > 15000;

SELECT AVG(price)
FROM listings_cleaned
WHERE accommodates = 1;

SELECT AVG(price)
FROM listings_cleaned
WHERE accommodates = 2;

SELECT AVG(price)
FROM listings_cleaned
WHERE accommodates = 3;

SELECT AVG(price)
FROM listings_cleaned
WHERE accommodates = 4;

SELECT AVG(price)
FROM listings_cleaned
WHERE accommodates = 5;

-- number of possible accomodated people increases value, however shows little difference between 2-3 and 4-5 being accomodated

SELECT AVG(price)
FROM listings_cleaned
WHERE neighbourhood_cleansed = 'Praha 1'
  AND accommodates = 2;
  
SELECT AVG(price)
FROM listings_cleaned
WHERE neighbourhood_cleansed = 'Praha 2'
  AND accommodates = 2;
  
SELECT AVG(price)
FROM listings_cleaned
WHERE neighbourhood_cleansed = 'Praha 5'
  AND accommodates = 2;
  
SELECT AVG(price)
FROM listings_cleaned
WHERE neighbourhood_cleansed = 'Praha 10'
  AND accommodates = 2;
  
SELECT 
    neighbourhood_cleansed, 
    ROUND(AVG(price), 2) AS avg_price
FROM listings_cleaned
GROUP BY neighbourhood_cleansed
ORDER BY avg_price DESC;
-- this query shows innaccurate data caused by too small sample sizes to be averaged out, f.e.

SELECT *
FROM listings_cleaned
WHERE neighbourhood_cleansed = "Praha 20";
-- outputs only one result, which results in innacurate average as the price column tends to be highly innacurate, therefore larger sample size is needed to mitigate this

SELECT neighbourhood_cleansed, COUNT(*) AS number_of_listings
FROM listings_cleaned
GROUP BY neighbourhood_cleansed;

SELECT neighbourhood_cleansed, COUNT(*) AS number_of_listings
FROM listings_cleaned
GROUP BY neighbourhood_cleansed
HAVING COUNT(*) < 50000;

-- i remove this data as the sample size is too low to give accurate result

-- create backup copy
CREATE TABLE listings_cleaned_backup AS
SELECT * FROM listings_cleaned;

-- now removing the data
DELETE FROM listings_cleaned
WHERE neighbourhood_cleansed IN (
    SELECT nc
    FROM (
        SELECT neighbourhood_cleansed AS nc, COUNT(*) AS count
        FROM listings_cleaned
        GROUP BY neighbourhood_cleansed
        HAVING COUNT(*) < 5
    ) AS subquery
);

SELECT 
    neighbourhood_cleansed, 
    ROUND(AVG(price), 2) AS avg_price
FROM listings_cleaned
GROUP BY neighbourhood_cleansed
ORDER BY avg_price DESC;

-- shows how host response time affect average rating
SELECT 
    host_response_time, 
    ROUND(AVG(review_scores_rating), 2) AS avg_rating
FROM listings_cleaned
GROUP BY host_response_time
ORDER BY avg_rating DESC;

-- shows number of reviews for each neighbourhood, shows which neighbourhoods are most visited
SELECT 
    neighbourhood_cleansed, 
    SUM(number_of_reviews) AS total_reviews
FROM listings_cleaned
GROUP BY neighbourhood_cleansed
ORDER BY total_reviews DESC
LIMIT 10;

-- shows the rating for top priced places along with neighbourhood they are in
SELECT 
    neighbourhood_cleansed, 
    price, 
    review_scores_rating
FROM listings_cleaned
WHERE review_scores_rating >= 4.5
ORDER BY price DESC
LIMIT 10;

-- number of possible accomodated people increases value
SELECT 
    accommodates, 
    ROUND(AVG(price), 2) AS avg_price
FROM listings_cleaned
GROUP BY accommodates
ORDER BY accommodates;


SELECT *
FROM listings_cleaned;

-- shows very little difference between how host verifies reservations and the resulting rating
SELECT 
    host_verifications, 
    ROUND(AVG(review_scores_rating), 2) AS avg_rating
FROM listings_cleaned
GROUP BY host_verifications
ORDER BY avg_rating DESC;

-- shows even accomodations with hundreds of reviews can have near perfect score 4.99
SELECT 
    number_of_reviews, 
    ROUND(AVG(review_scores_rating), 2) AS avg_rating
FROM listings_cleaned
GROUP BY number_of_reviews
ORDER BY avg_rating DESC;


-- average price per accomodates, will be used for visualization
SELECT 
    accommodates, 
    ROUND(AVG(price)) AS average_price
FROM 
    listings_cleaned
GROUP BY 
    accommodates
ORDER BY
    accommodates;
    
-- most visited are Praha 1,2,3,5, we focus visualization of those

SELECT 
    accommodates,
    ROUND(AVG(price)) AS average_price,
    neighbourhood_cleansed
FROM 
    listings_cleaned
WHERE neighbourhood_cleansed = "Praha 1"
GROUP BY 
    accommodates
ORDER BY
    accommodates;
    
SELECT *
FROM listings_cleaned
WHERE accommodates = 1
ORDER BY neighbourhood_cleansed ASC;