USE sakila;

-- Select all the actors with the first name ‘Scarlett’.
SELECT first_name, last_name
FROM actor 
WHERE first_name = 'Scarlett';

-- Select all the actors with the last name ‘Johansson’.
SELECT last_name, first_name
FROM actor 
WHERE last_name = 'Johansson';

-- How many films (movies) are available for rent?
SELECT COUNT(inventory_id) 
FROM rental; -- A: 16044 available for rent

-- How many films have been rented?
SELECT COUNT(rental_id) 
FROM rental; -- 16044 have been rented


-- What is the shortest and longest rental period?
SELECT MIN(TIMESTAMPDIFF(HOUR, rental_date, return_date)) 
FROM rental; -- 18h

-- giv more context an safe results in column "shortest or longest rental period (below)
SELECT MIN(TIMESTAMPDIFF(HOUR, rental_date, return_date)) 
AS 'shortest_rental_period' 
FROM rental; -- 18h

SELECT MAX(TIMESTAMPDIFF(HOUR, rental_date, return_date)) 
AS 'longest_rental_period' 
FROM rental; -- 221h

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
-- first see film duration per title -> guess it is minutes :D
SELECT length, title
FROM film;

-- shortst duration
SELECT MIN(length) 
AS 'shortest_moview_duration' 
FROM film; # 46m

-- longest duration
SELECT MAX(length) 
AS 'longest_moview_duration' 
FROM film; -- 185m

-- What's the average movie duration? -> additional round to 2 decimals
SELECT ROUND(AVG(length), 2)
AS 'average_movie_duration'
FROM film;

-- What's the average movie duration expressed in format (hours, minutes)?
-- first Return the largest integer value 
SELECT 
FLOOR(AVG(length)/60) AS hours,
ROUND((AVG(length)%60), 2) AS minutes
FROM film;

-- How many movies longer than 3 hours?
SELECT COUNT(film_id) 
FROM film 
WHERE length > 180; -- 39 movies

-- Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.

-- What's the length of the longest film title?
SELECT MAX(LENGTH(title)) 
AS 'longest_film_title' 
FROM film; -- 27 chars
