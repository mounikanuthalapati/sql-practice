-- Lesson 1: SELECT queries 101
-- 1. Find the title of each film
SELECT title FROM movies;

-- 2. Find the director of each film
SELECT director FROM movies;

-- 3. Find the title and director of each film
SELECT title, director FROM movies;

-- 4. Find the title and year of each film
SELECT title, year FROM movies;

-- 5. Find all the information about each film
SELECT * FROM movies;

-- Lesson 2: Queries with constraints (Pt. 1)
-- 1. Find the movie with a row id of 6
SELECT * FROM movies WHERE id = 6;

-- 2. Find the movies released in the years between 2000 and 2010
SELECT * FROM movies WHERE year BETWEEN 2000 AND 2010;

-- 3. Find the movies not released in the years between 2000 and 2010
SELECT * FROM movies WHERE year NOT BETWEEN 2000 AND 2010;

-- 4. Find the first 5 Pixar movies and their release year
SELECT title, year FROM movies LIMIT 5;

-- Lesson 3: Queries with constraints (Pt. 2)
-- 1. Find all the Toy Story movies
SELECT title FROM movies WHERE title LIKE 'Toy Story%';

-- 2. Find all the movies directed by John Lasseter
SELECT title FROM movies WHERE director = 'John Lasseter';

-- 3. Find all the movies (and director) not directed by John Lasseter
SELECT title, director FROM movies WHERE director != 'John Lasseter';

-- 4. Find all the WALL-* movies
SELECT title FROM movies WHERE title LIKE 'WALL-%';

-- Lesson 4: Filtering and sorting Query results
-- 1. List all directors of Pixar movies (alphabetically), without duplicates
SELECT DISTINCT director FROM movies ORDER BY director;

-- 2. List the last four Pixar movies released (ordered from most recent to least)
SELECT title FROM movies ORDER BY year DESC LIMIT 4;

-- 3. List the first five Pixar movies sorted alphabetically
SELECT title FROM movies ORDER BY title LIMIT 5;

-- 4. List the next five Pixar movies sorted alphabetically
SELECT title FROM movies ORDER BY title LIMIT 5 OFFSET 5;

-- Lesson 5: Review Simple SELECT Queries
-- 1. List all the Canadian cities and their populations
SELECT city, population FROM north_american_cities WHERE country = 'Canada';

-- 2. Order all the cities in the United States by their latitude from north to south
SELECT city FROM north_american_cities WHERE country = 'United States' ORDER BY latitude DESC;

-- 3. List all the cities west of Chicago, ordered from west to east
SELECT city FROM north_american_cities WHERE longitude < -87.6298 ORDER BY longitude;

-- 4. List the two largest cities in Mexico (by population)
SELECT city, population FROM north_american_cities WHERE country = 'Mexico' ORDER BY population DESC LIMIT 2;

-- 5. List the third and fourth largest cities (by population) in the United States and their population
SELECT city, population FROM north_american_cities WHERE country = 'United States' ORDER BY population DESC LIMIT 2 OFFSET 2;

-- Lesson 6: Multi-table queries with JOINs
-- 1. Find the domestic and international sales for each movie
SELECT m.title, b.domestic_sales, b.international_sales
FROM movies m
INNER JOIN boxoffice b ON m.id = b.movie_id;

-- 2. Show the sales numbers for each movie that did better internationally rather than domestically
SELECT m.title, b.domestic_sales, b.international_sales
FROM movies m
INNER JOIN boxoffice b ON m.id = b.movie_id
WHERE b.international_sales > b.domestic_sales;

-- 3. List all the movies by their ratings in descending order
SELECT m.title, b.rating
FROM movies m
INNER JOIN boxoffice b ON m.id = b.movie_id
ORDER BY b.rating DESC;
