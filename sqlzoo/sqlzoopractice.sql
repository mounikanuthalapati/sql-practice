-- Lesson 1: SELECT Basics
-- 1. Select all columns from the 'world' table
SELECT * FROM world;

-- 2. Select specific columns (name, continent, population) from the 'world' table
SELECT name, continent, population FROM world;

-- 3. Select countries with a population greater than 200 million
SELECT name FROM world WHERE population > 200000000;

-- 4. Select countries from 'South America' and display population in millions
SELECT name, population/1000000 AS population_millions FROM world WHERE continent = 'South America';

-- Lesson 2: SELECT from WORLD
-- 1. Select countries with a population greater than 200 million
SELECT name FROM world WHERE population > 200000000;

-- 2. Select countries with a GDP greater than 1 trillion
SELECT name FROM world WHERE gdp > 1000000000000;

-- 3. Select countries with a population between 100 million and 200 million
SELECT name FROM world WHERE population BETWEEN 100000000 AND 200000000;

-- 4. Select countries with a population greater than 200 million or area greater than 3 million sq km
SELECT name, population, area FROM world WHERE population > 200000000 OR area > 3000000;

-- Lesson 3: SELECT from Nobel
-- 1. Select Nobel prize winners from 1950
SELECT winner FROM nobel WHERE yr = 1950;

-- 2. Select Nobel prize winners in 'Literature' for the year 1962
SELECT winner FROM nobel WHERE yr = 1962 AND subject = 'literature';

-- 3. Select Nobel prize winners in 'Peace' since the year 2000
SELECT winner FROM nobel WHERE subject = 'peace' AND yr >= 2000;

-- 4. Select Nobel prize winners in 'Literature' from 1980 to 1989
SELECT yr, subject, winner FROM nobel WHERE subject = 'literature' AND yr BETWEEN 1980 AND 1989;

-- Lesson 4: SELECT in SELECT
-- 1. Select countries with a population greater than the average population
SELECT name FROM world WHERE population > (SELECT AVG(population) FROM world);

-- 2. Select countries with a GDP greater than the average GDP
SELECT name FROM world WHERE gdp > (SELECT AVG(gdp) FROM world);

-- 3. Select Nobel prize winners who won in the same year as 'Albert Einstein'
SELECT winner FROM nobel WHERE yr = (SELECT yr FROM nobel WHERE winner = 'Albert Einstein');
