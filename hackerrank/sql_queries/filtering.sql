-- ====================================================================================
-- Platform: HackerRank
-- Topic: Pattern Matching / String Filtering
-- Description: Practice problems for mastering vowel-based city filtering in SQL
-- Date: 2025-04-26
-- ====================================================================================

-- 🔹 Problem 1: Cities starting with vowels
-- Description: Query the list of CITY names starting with vowels (a, e, i, o, u).
--              Your result cannot contain duplicates.
SELECT DISTINCT city 
FROM station
WHERE city LIKE 'a%' 
   OR city LIKE 'e%' 
   OR city LIKE 'i%' 
   OR city LIKE 'o%' 
   OR city LIKE 'u%';

-- ----------------------------------------------------------------------------

-- 🔹 Problem 2: Cities ending with vowels
-- Description: Query the list of CITY names ending with vowels (a, e, i, o, u).
--              Your result cannot contain duplicates.
SELECT DISTINCT city 
FROM station
WHERE city LIKE '%a' 
   OR city LIKE '%e' 
   OR city LIKE '%i' 
   OR city LIKE '%o' 
   OR city LIKE '%u';

-- ----------------------------------------------------------------------------

-- 🔹 Problem 3: Cities starting and ending with vowels (using REGEXP)
-- Description: Query CITY names that start and end with vowels using regular expressions.
--              Your result cannot contain duplicates.
SELECT DISTINCT city
FROM station
WHERE CITY REGEXP '^[aeiouAEIOU].*[aeiouAEIOU]$';

-- ----------------------------------------------------------------------------

-- 🔹 Problem 4: Cities starting and ending with vowels (using LIKE)
-- Description: Query CITY names that start and end with vowels using LIKE patterns.
--              Your result cannot contain duplicates.
SELECT DISTINCT city 
FROM station
WHERE (CITY LIKE 'a%' 
    OR CITY LIKE 'e%' 
    OR CITY LIKE 'i%' 
    OR CITY LIKE 'o%'
    OR CITY LIKE 'u%')
  AND (CITY LIKE '%a' 
    OR CITY LIKE '%e'
    OR CITY LIKE '%i'
    OR CITY LIKE '%o'
    OR CITY LIKE '%u');

-- ----------------------------------------------------------------------------

-- 🔹 Problem 5: Cities NOT starting with vowels
-- Description: Query CITY names that do not start with vowels.
--              Your result cannot contain duplicates.
SELECT DISTINCT city 
FROM station
WHERE city NOT LIKE 'a%' 
  AND city NOT LIKE 'e%' 
  AND city NOT LIKE 'i%' 
  AND city NOT LIKE 'o%' 
  AND city NOT LIKE 'u%';

-- ----------------------------------------------------------------------------

-- 🔹 Problem 6: Cities NOT ending with vowels
-- Description: Query CITY names that do not end with vowels.
--              Your result cannot contain duplicates.
SELECT DISTINCT city 
FROM station
WHERE city NOT LIKE '%a' 
  AND city NOT LIKE '%e' 
  AND city NOT LIKE '%i' 
  AND city NOT LIKE '%o' 
  AND city NOT LIKE '%u';

-- ----------------------------------------------------------------------------

-- 🔹 Problem 7: Cities NOT starting OR NOT ending with vowels
-- Description: Query CITY names that either do not start OR do not end with vowels.
--              Your result cannot contain duplicates.
SELECT DISTINCT city 
FROM station
WHERE (CITY NOT LIKE 'a%' 
    AND CITY NOT LIKE 'e%' 
    AND CITY NOT LIKE 'i%' 
    AND CITY NOT LIKE 'o%'
    AND CITY NOT LIKE 'u%')
   OR (CITY NOT LIKE '%a' 
    AND CITY NOT LIKE '%e'
    AND CITY NOT LIKE '%i'
    AND CITY NOT LIKE '%o'
    AND CITY NOT LIKE '%u');

-- ----------------------------------------------------------------------------

-- 🔹 Problem 8: Cities NOT starting AND NOT ending with vowels
-- Description: Query CITY names that do not start AND do not end with vowels.
--              Your result cannot contain duplicates.
SELECT DISTINCT city 
FROM station
WHERE NOT (CITY LIKE 'a%' 
    OR CITY LIKE 'e%' 
    OR CITY LIKE 'i%' 
    OR CITY LIKE 'o%'
    OR CITY LIKE 'u%')
  AND NOT (CITY LIKE '%a' 
    OR CITY LIKE '%e'
    OR CITY LIKE '%i'
    OR CITY LIKE '%o'
    OR CITY LIKE '%u');

-- ====================================================================================
-- 💡 Notes on SQL Pattern Matching Techniques:
-- ====================================================================================

-- ✅ 1. Using LIKE for pattern checks:
--    - 'a%'  → starts with 'a'
--    - '%e'  → ends with 'e'
--    - Can combine multiple LIKEs with OR/AND.

-- ✅ 2. Using NOT LIKE for exclusion:
--    - city NOT LIKE 'a%' → does not start with 'a'
--    - Combine multiple NOT LIKEs for complex exclusions.

-- ✅ 3. Using LEFT() and RIGHT():
--    - LEFT(city, 1)  → gets the first character
--    - RIGHT(city, 1) → gets the last character
--    - Useful with IN/NOT IN: e.g., LEFT(city, 1) IN ('a', 'e', ...)

-- ✅ 4. Using LOWER() for case-insensitive comparison:
--    - Ensures 'A' and 'a' are treated the same.
--    - Example: LOWER(LEFT(city, 1)) IN ('a', 'e', ...)

-- ✅ 5. Using REGEXP (MySQL/PostgreSQL):
--    - '^a'  → starts with 'a'
--    - 'e$'  → ends with 'e'
--    - '^[aeiou].*[aeiou]$' → starts and ends with a vowel
--    - Cleaner syntax for complex pattern filtering.

-- ✅ 6. Combining conditions:
--    - Use AND for "starts AND ends with vowels"
--    - Use OR for "starts OR ends with vowels"
--    - Use NOT (...) for negations

-- ====================================================================================
-- End of File: vowel_city_filtering.sql
-- ====================================================================================
