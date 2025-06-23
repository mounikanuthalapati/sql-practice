Description: Query all columns for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA. 
SQL Query: 
SELECT * FROM CITY WHERE CountryCode = 'USA' AND Population 
 
-- 
 
Description: Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA. 
SQL Query: 
SELECT NAME FROM CITY WHERE CountryCode = 'USA' AND Population 
 
-- 
 
Description: Query all columns (attributes) for every row in the CITY table. 
SQL Query: 
SELECT * FROM CITY; 
 
-- 
 
Description: Query all columns for a city in the CITY table with the ID 1661. 
SQL Query: 
SELECT * FROM CITY WHERE ID = 1661; 
 
-- 
 
Description: Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN. 
SQL Query: 
SELECT * FROM CITY WHERE CountryCode = 'JPN'; 
 
-- 
 
Description: Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN. 
SQL Query: 
SELECT NAME FROM CITY WHERE CountryCode = 'JPN'; 
 
-- 
 
Description: Query a list of CITY and STATE from the STATION table. 
SQL Query: 
SELECT CITY, STATE FROM STATION; 
 
-- 
 
Description: Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer. 
SQL Query: 
SELECT DISTINCT CITY FROM STATION WHERE MOD(ID, 2) = 0; 
 
-- 
 
Description: Find the difference between the total number of CITY entries in the STATION table and the number of distinct CITY entries in the table. 
SQL Query: 
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) AS difference FROM STATION; 
