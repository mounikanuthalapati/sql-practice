-- ====================================================================================
-- Platform: SQLBolt
-- Topic: LEFT JOINs, Aggregation, Filtering, Grouping, and Key SQL Concepts
-- Description: Practice queries using LEFT JOINs, Aggregations, and basic filtering.
-- Date: [YYYY-MM-DD]
-- ====================================================================================

-- **Key SQL Concepts and Notes:**

-- 1. **JOINs**:
--    - Joins are used to combine rows from two or more tables based on a related column.
--    - **LEFT JOIN** (or LEFT OUTER JOIN) is used in most of the queries in this section.
--    - The LEFT JOIN ensures that all rows from the left table (employees/buildings) are shown, even if there is no matching row in the right table (buildings/employees).
--    - **INNER JOIN** returns only the rows where there is a match between the two tables.
--    - **RIGHT JOIN** and **FULL JOIN** could be used for more complex queries but are not used here.

-- 2. **Filtering**:
--    - **WHERE** clause: Used to filter records based on a specified condition.
--    - **IS NULL**: Used to filter out rows where a column has no value (NULL).

-- 3. **Aggregation**:
--    - **COUNT()**: Used to count the number of rows in a result set, typically used in `GROUP BY`.
--    - **SUM()**: Adds up the values of a numeric column.
--    - **AVG()**: Returns the average value of a numeric column.
--    - **MAX()**: Returns the highest value of a column.

-- 4. **GROUP BY**:
--    - Used to group rows that have the same values in specified columns.
--    - Often used with aggregation functions like `COUNT()`, `SUM()`, `AVG()`, and `MAX()` to perform calculations on groups of data.

-- 5. **SELECT DISTINCT**:
--    - Used to eliminate duplicate values in the result set and return only unique records.

-- ====================================================================================

-- 🔹 Problem 1: Retrieve distinct building names for all employees
-- Description: This query retrieves all unique building names that employees are assigned to, 
-- even if there are no employees in some buildings. LEFT JOIN ensures that all buildings are shown,
-- even if they have no employees assigned.
SELECT DISTINCT building 
FROM employees 
LEFT JOIN buildings 
  ON employees.building = buildings.building_name;

-- 🔹 Problem 2: Get employee roles and their associated building names
-- Description: This query retrieves the role of employees along with the names of the buildings
-- they are assigned to. The LEFT JOIN ensures that buildings without employees are also shown.
SELECT DISTINCT employees.role, buildings.building_name 
FROM buildings 
LEFT JOIN employees 
  ON employees.building = buildings.building_name;

-- 🔹 Problem 3: List employees without a building assignment
-- Description: This query lists the names and roles of employees who do not have an assigned building.
-- LEFT JOIN allows us to find buildings with no employees assigned to them.
SELECT name, role 
FROM employees 
WHERE building IS NULL;

-- 🔹 Problem 4: List buildings without any employees assigned to them
-- Description: This query lists buildings that currently have no employees assigned to them.
-- LEFT JOIN helps find buildings with no employees assigned.
SELECT building_name 
FROM buildings 
LEFT JOIN employees 
  ON buildings.building_name = employees.building 
WHERE employees.building IS NULL;

-- 🔹 Problem 5: Calculate the gross sales (in millions) for each movie
-- Description: This query calculates the total gross sales for each movie by summing up domestic and international sales.
-- The result is in millions of dollars. We are using an INNER JOIN to link the `movies` and `boxoffice` tables based on `movie_id`.
SELECT title, 
       (domestic_sales + international_sales) / 1000000 AS gross_sales_millions
FROM movies
JOIN boxoffice 
  ON movies.id = boxoffice.movie_id;

-- 🔹 Problem 6: Calculate the movie ratings as percentages
-- Description: This query calculates the movie ratings in percentage form by multiplying the rating by 10.
-- This is done with an INNER JOIN between `movies` and `boxoffice`.
SELECT title, 
       rating * 10 AS rating_percent
FROM movies
JOIN boxoffice 
  ON movies.id = boxoffice.movie_id;

-- 🔹 Problem 7: List movies released in even years
-- Description: This query lists all movies released in even years (e.g., 2020, 2022).
-- Here, we're simply filtering based on the `Year` column.
SELECT * 
FROM movies 
WHERE Year % 2 = 0;

-- 🔹 Problem 8: Find the maximum number of years any employee has worked
-- Description: This query returns the highest value for years of employment among all employees.
-- It uses the `MAX` aggregate function to get the highest number of years worked.
SELECT MAX(years_employed) 
FROM employees;

-- 🔹 Problem 9: Calculate the average years of employment for each employee role
-- Description: This query calculates the average number of years employees have worked, grouped by their role.
-- The `AVG` function is used to calculate the average years of employment.
SELECT AVG(years_employed), name, role 
FROM employees 
GROUP BY role;

-- 🔹 Problem 10: Calculate the total years of employment for each building
-- Description: This query calculates the total years employees have worked in each building.
-- It uses the `SUM` aggregate function to sum the `years_employed` for each building.
SELECT SUM(years_employed), building 
FROM employees 
GROUP BY building;

-- 🔹 Problem 11: Count the number of employees with the role of 'Artist'
-- Description: This query counts how many employees hold the role of 'Artist'.
-- The `COUNT` function is used to count the number of employees with the role 'Artist'.
SELECT COUNT(role), role 
FROM employees 
WHERE role = 'Artist' 
GROUP BY role;

-- 🔹 Problem 12: Count the number of employees in each role
-- Description: This query counts the number of employees for each role.
-- It groups employees by their role and counts how many employees are in each role.
SELECT COUNT(role), role 
FROM employees 
GROUP BY role;

-- 🔹 Problem 13: Calculate the total years of employment for 'Engineer' role
-- Description: This query sums up the total years employees with the role of 'Engineer' have worked.
-- The `SUM` function is used to get the total years employed for engineers.
SELECT SUM(years_employed) 
FROM employees 
WHERE role = 'Engineer';

-- 🔹 Problem 14: Count the number of movies directed by each director
-- Description: This query counts how many movies each director has made based on the box office data.
-- We join the `movies` and `boxoffice` tables and group by `director`.
SELECT COUNT(title), director 
FROM movies 
JOIN boxoffice 
  ON movies.id = boxoffice.movie_id 
GROUP BY director;

-- 🔹 Problem 15: Calculate total sales (domestic + international) by director
-- Description: This query calculates the total sales (domestic + international) for each director.
-- We join the `movies` and `boxoffice` tables and group by `director`.
SELECT SUM(domestic_sales + international_sales) AS total_sales, director 
FROM movies 
JOIN boxoffice 
  ON movies.id = boxoffice.movie_id 
GROUP BY director;
