-- ====================================================================================
-- Platform: SQLZoo
-- Topic: World Database Queries (Selection, Aggregation, Subqueries, Joins)
-- Description: Practice problems for mastering SQL using the world and nobel tables
-- Date: 2025-05-08
-- ====================================================================================

-- 📘 Notes:
-- SELECT: Retrieves columns from one or more tables
-- WHERE: Filters records based on conditions
-- LIKE: Matches patterns in text
-- IN: Filters based on a list of values
-- BETWEEN: Filters values in a given range
-- GROUP BY / HAVING: Aggregates and filters grouped data
-- ORDER BY: Sorts query results
-- JOIN: Combines rows from related tables
-- VIEW: Creates a virtual table based on a query

-- ====================================================================================
-- 🔹 Problem 1: Countries with large area or population, but not both
-- Description: Return countries with area > 3M or population > 250M, but not both
SELECT name, population, area
FROM world
WHERE (area > 3000000 OR population > 250000000)
  AND NOT (area > 3000000 AND population > 250000000);

-- ----------------------------------------------------------------------------
-- 🔹 Problem 2: South America population and GDP
-- Description: Show population (millions) and GDP (billions) for South American countries
SELECT name,
       ROUND(population / 1000000.0, 2) AS population_millions,
       ROUND(gdp / 1000000000.0, 2) AS gdp_billions
FROM world
WHERE continent = 'South America';

-- ----------------------------------------------------------------------------
-- 🔹 Problem 3: Names with all vowels and no spaces
-- Description: Country names that contain all vowels and no spaces
SELECT name
FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %';

-- ----------------------------------------------------------------------------
-- 🔹 Problem 4: Name and capital of same length
-- Description: Countries where name and capital have the same length
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);

-- ----------------------------------------------------------------------------
-- 🔹 Problem 5: Countries with large GDP
-- Description: Countries with GDP > 1 trillion, showing GDP per capita rounded to nearest 1000
SELECT name, ROUND(gdp / population, -3) AS gdp_per_capita
FROM world
WHERE gdp > 1000000000000;

-- ----------------------------------------------------------------------------
-- 🔹 Problem 6: Name and capital starting with same letter, but not identical
-- Description: Countries where name and capital start with same letter but are not the same
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)
  AND name <> capital;

-- ----------------------------------------------------------------------------
-- 🔹 Problem 7: Nobel prize in 1950
-- Description: Show all Nobel prize winners from 1950
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

-- ----------------------------------------------------------------------------
-- 🔹 Problem 8: Literature Nobel prize in 1962
-- Description: Show winner of literature Nobel prize in 1962
SELECT winner
FROM nobel
WHERE yr = 1962 AND subject = 'Literature';

-- ----------------------------------------------------------------------------
-- 🔹 Problem 9: Years and subjects for Einstein
-- Description: Show all years and subjects where Albert Einstein won
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

-- ----------------------------------------------------------------------------
-- 🔹 Problem 10: Peace prize winners since 2000
-- Description: Show peace Nobel winners from year 2000 onwards
SELECT winner
FROM nobel
WHERE yr >= 2000 AND subject = 'Peace';

-- ----------------------------------------------------------------------------
-- 🔹 Problem 11: Literature prize winners in the 1980s
-- Description: Show all literature winners between 1980 and 1989
SELECT *
FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

-- ----------------------------------------------------------------------------
-- 🔹 Problem 12: Specific Nobel winners
-- Description: Return rows for selected U.S. presidents who won the Nobel prize
SELECT *
FROM nobel
WHERE winner IN ('Thomas Woodrow Wilson', 'Theodore Roosevelt', 'Jimmy Carter', 'Barack Obama');

-- ----------------------------------------------------------------------------
-- 🔹 Problem 13: Winners named John
-- Description: Show Nobel winners whose names start with 'John'
SELECT winner
FROM nobel
WHERE winner LIKE 'John%';

-- ----------------------------------------------------------------------------
-- 🔹 Problem 14: Subject/year combination search
-- Description: Chemistry in 1984 or Physics in 1980
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Chemistry' AND yr = 1984)
   OR (subject = 'Physics' AND yr = 1980);

-- ----------------------------------------------------------------------------
-- 🔹 Problem 15: Exclude Chemistry and Medicine in 1980
-- Description: Show all Nobel entries from 1980 except Chemistry and Medicine
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980
  AND subject NOT IN ('Chemistry', 'Medicine');

-- ----------------------------------------------------------------------------
-- 🔹 Problem 16: Create view of movie stats
-- Description: Create view for movie titles, ratings, and domestic sales
CREATE VIEW movie_stats AS
SELECT m.title, b.rating, b.domestic_sales
FROM movies m
JOIN boxoffice b ON m.id = b.movie_id;

-- ----------------------------------------------------------------------------
-- 🔹 Problem 17: Medicine before 1910 or Literature after 2003
-- Description: Combine two Nobel queries with different conditions
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910)
   OR (subject = 'Literature' AND yr >= 2004);

-- ----------------------------------------------------------------------------
-- 🔹 Problem 18: Winners titled 'Sir', ordered by year and name
-- Description: List of winners starting with 'Sir' ordered by year descending
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner;

-- ----------------------------------------------------------------------------
-- 🔹 Problem 19: Exact winner match
-- Description: Find rows for specific winners with special characters
SELECT * FROM nobel WHERE winner = "EUGENE O'NEILL";
SELECT * FROM nobel WHERE winner = "PETER GRÜNBERG";

-- ----------------------------------------------------------------------------
-- 🔹 Problem 20: Prioritize subjects
-- Description: Physics and Chemistry first, then others
SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY CASE WHEN subject IN ('Physics', 'Chemistry') THEN 1 ELSE 2 END, subject, winner;

-- ----------------------------------------------------------------------------
-- 🔹 Problem 21: Countries with larger population than Russia
-- Description: Show countries with population greater than Russia
SELECT name
FROM world
WHERE population > (
    SELECT population FROM world WHERE name = 'Russia'
);

-- ----------------------------------------------------------------------------
-- 🔹 Problem 22: Total world population
-- Description: Show global population total
SELECT SUM(population) AS total_population
FROM world;

-- ----------------------------------------------------------------------------
-- 🔹 Problem 23: Distinct continents
-- Description: List all unique continents
SELECT DISTINCT continent
FROM world;

-- ----------------------------------------------------------------------------
-- 🔹 Problem 24: GDP of Africa
-- Description: Total GDP for African continent
SELECT SUM(gdp) AS total_africa_gdp
FROM world
WHERE continent = 'Africa';

-- ----------------------------------------------------------------------------
-- 🔹 Problem 25: Count continents with area > 1M
-- Description: Count how many countries have area > 1 million sq km
SELECT COUNT(continent)
FROM world
WHERE area > 1000000;

-- ----------------------------------------------------------------------------
-- 🔹 Problem 26: Sum population of Baltic countries
-- Description: Total population of Estonia, Latvia, and Lithuania
SELECT SUM(population) AS baltic_population
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- ----------------------------------------------------------------------------
-- 🔹 Problem 27: Count countries per continent
-- Description: Show number of countries per continent
SELECT continent, COUNT(*) AS country_count
FROM world
GROUP BY continent;

-- ----------------------------------------------------------------------------
-- 🔹 Problem 28: Continents with countries over 10M population
-- Description: Count countries with population > 10M per continent
SELECT continent, COUNT(*) AS big_country_count
FROM world
WHERE population > 10000000
GROUP BY continent;

-- ----------------------------------------------------------------------------
-- 🔹 Problem 29: Continents with population over 100M
-- Description: List continents where total population > 100 million
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) > 100000000;

-- ====================================================================================
-- Notes:
-- - Format queries neatly (indent SELECT/FROM/WHERE)
-- - Use comments generously for clarity
-- - Group related problems under the same topic/file if they're short
-- ====================================================================================
