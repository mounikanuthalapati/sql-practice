-- ====================================================================================
-- Platform: SQLZoo
-- Topic: Mixed SQL Concepts (Joins, Subqueries, Aggregation, Operators, CASE)
-- Description: Practice problems for mastering various SQL topics using SQLZoo examples
-- Date: 2025-06-23
-- ====================================================================================

-- ============================================
-- 🔹 Section 1: Basic SELECT and WHERE
-- ============================================

-- 🔹 Problem 1: Movies from year 1962
-- Description: Select the id and title of movies released in 1962
SELECT id, title
FROM movie
WHERE yr = 1962;

-- 🔹 Problem 2: Year of 'Citizen Kane'
-- Description: Get the year when 'Citizen Kane' was released
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

-- 🔹 Problem 3: Movies with 'Star Trek' in title
-- Description: Get id, title, and year for Star Trek movies, ordered by year
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

-- ============================================
-- 🔹 Section 2: Aggregation
-- ============================================

-- 🔹 Problem 4: Count number of stops
-- Description: Count all rows in the 'stops' table
SELECT COUNT(*)
FROM stops;

-- ============================================
-- 🔹 Section 3: Filtering & Joins
-- ============================================

-- 🔹 Problem 5: Get stop ID for 'Craiglockhart'
-- Description: Find the ID for the stop named 'Craiglockhart'
SELECT id
FROM stops
WHERE name = 'Craiglockhart';

-- 🔹 Problem 6: LRT Route 4 stops
-- Description: List the names and IDs of stops on route 4 of the LRT company
SELECT stops.id, stops.name
FROM stops
JOIN route ON route.stop = stops.id
WHERE route.company = 'LRT'
  AND route.num = 4
ORDER BY route.pos;

-- ============================================
-- 🔹 Section 4: Joins and NULL Handling
-- ============================================

-- 🔹 Problem 7: Teachers without department
-- Description: Find teachers who are not assigned to any department
SELECT teacher.name
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id
WHERE dept.name IS NULL;

-- 🔹 Problem 8: Inner Join on teacher and dept
-- Description: Show teacher names with their department names
SELECT teacher.name, dept.name
FROM teacher
INNER JOIN dept ON teacher.dept = dept.id;

-- 🔹 Problem 9: Left Join - teacher to dept
SELECT teacher.name, dept.name
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;

-- 🔹 Problem 10: Left Join - dept to teacher
SELECT teacher.name, dept.name
FROM dept
LEFT JOIN teacher ON teacher.dept = dept.id;

-- ============================================
-- 🔹 Section 5: Handling NULL Values
-- ============================================

-- 🔹 Problem 11: Default phone if NULL
-- Description: Provide default number if mobile is null
SELECT teacher.name,
       IF(teacher.mobile IS NULL, '07986 444 2266', teacher.mobile) AS Mobile
FROM teacher;

-- 🔹 Problem 12: Replace NULL department with 'None'
-- Description: Show 'None' if department is NULL
SELECT teacher.name,
       IF(dept.name IS NULL, 'None', dept.name) AS deptname
FROM teacher
LEFT JOIN dept ON dept.id = teacher.dept;

-- ============================================
-- 🔹 Section 6: Aggregation and Grouping
-- ============================================

-- 🔹 Problem 13: Count of teachers and mobiles
SELECT COUNT(name), COUNT(mobile)
FROM teacher;

-- 🔹 Problem 14: Count of teachers per department
-- Description: Count teachers grouped by department
SELECT dept.name, COUNT(teacher.name)
FROM teacher
RIGHT JOIN dept ON dept.id = teacher.dept
GROUP BY dept.name;

-- ============================================
-- 🔹 Section 7: CASE Statements
-- ============================================

-- 🔹 Problem 15: Department categorization
-- Description: Map departments 1 & 2 as 'Sci', others as 'Art'
SELECT name,
       CASE
           WHEN dept = 1 THEN 'Sci'
           WHEN dept = 2 THEN 'Sci'
           ELSE 'Art'
       END AS dept_category
FROM teacher;

-- 🔹 Problem 16: More detailed department mapping
-- Description: Map departments to Sci, Art, or None
SELECT name,
       CASE
           WHEN dept = 1 THEN 'Sci'
           WHEN dept = 2 THEN 'Sci'
           WHEN dept = 3 THEN 'Art'
           ELSE 'None'
       END AS dept_category
FROM teacher;

-- ====================================================================================
-- Notes:
-- - Queries organized by concept for easier revision
-- - Consistent formatting for readability
-- - Ready for GitHub commit
-- ====================================================================================
