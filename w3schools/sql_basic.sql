-- SQL Home: Introduction to SQL
-- SQL is a standard language for accessing and manipulating databases.
-- It allows you to create, read, update, and delete data in a database.

-- SQL Syntax
-- SQL statements are not case-sensitive.
-- SQL statements must end with a semicolon (;).
-- SQL keywords are typically written in uppercase.

-- SQL SELECT Statement
-- The SELECT statement is used to select data from a database.
-- Example:
SELECT * FROM Customers;

-- SQL WHERE Clause
-- The WHERE clause is used to filter records.
-- Example:
SELECT * FROM Customers WHERE Country='Germany';

-- SQL AND, OR, and NOT Operators
-- The AND operator displays a record if all the conditions separated by AND are TRUE.
-- The OR operator displays a record if any of the conditions separated by OR are TRUE.
-- The NOT operator displays a record if the condition is NOT TRUE.
-- Example:
SELECT * FROM Customers WHERE Country='Germany' AND Age>30;

-- SQL ORDER BY Clause
-- The ORDER BY clause is used to sort the result set.
-- Example:
SELECT * FROM Customers ORDER BY Country;

-- SQL INSERT INTO Statement
-- The INSERT INTO statement is used to insert new records into a table.
-- Example:
INSERT INTO Customers (CustomerName, ContactName, Country) VALUES ('Cardinal', 'Tom B. Erichsen', 'Norway');

-- SQL UPDATE Statement
-- The UPDATE statement is used to modify existing records.
-- Example:
UPDATE Customers SET ContactName='Alfred Schmidt', City='Frankfurt' WHERE CustomerID=1;

-- SQL DELETE Statement
-- The DELETE statement is used to delete existing records.
-- Example:
DELETE FROM Customers WHERE CustomerID=1;

-- SQL Operators
-- SQL operators are used to perform operations on data in a database.

-- SQL Arithmetic Operators
-- +  Add
-- -  Subtract
-- *  Multiply
-- /  Divide
-- %  Modulo
-- Example:
SELECT Price, Price*0.1 AS Tax FROM Products;

-- SQL Comparison Operators
-- =  Equal
-- >  Greater than
-- <  Less than
-- >= Greater than or equal
-- <= Less than or equal
-- <> Not equal
-- Example:
SELECT * FROM Products WHERE Price > 20;

-- SQL Logical Operators
-- AND  TRUE if both conditions are TRUE
-- OR   TRUE if either condition is TRUE
-- NOT  TRUE if the condition is NOT TRUE
-- Example:
SELECT * FROM Products WHERE Price > 20 AND Category='Beverages';

-- SQL BETWEEN Operator
-- The BETWEEN operator selects values within a range.
-- Example:
SELECT * FROM Products WHERE Price BETWEEN 10 AND 20;

-- SQL IN Operator
-- The IN operator allows you to specify multiple values in a WHERE clause.
-- Example:
SELECT * FROM Products WHERE Category IN ('Beverages', 'Condiments');

-- SQL LIKE Operator
-- The LIKE operator is used to search for a specified pattern in a column.
-- Example:
SELECT * FROM Customers WHERE CustomerName LIKE 'a%';

-- SQL IS NULL Operator
-- The IS NULL operator is used to test for empty values.
-- Example:
SELECT * FROM Customers WHERE Address IS NULL;

-- SQL EXISTS Operator
-- The EXISTS operator is used to test for the existence of any record in a subquery.
-- Example:
SELECT * FROM Customers WHERE EXISTS (SELECT * FROM Orders WHERE Orders.CustomerID=Customers.CustomerID);

-- SQL ALL and ANY Operators
-- The ALL operator is used to compare a value to all values in another result set.
-- The ANY operator is used to compare a value to any value in another result set.
-- Example:
SELECT * FROM Products WHERE Price > ALL (SELECT Price FROM Products WHERE Category='Beverages');

-- SQL UNION Operator
-- The UNION operator is used to combine the result sets of two or more SELECT statements.
-- Example:
SELECT City FROM Customers WHERE Country='Germany'
UNION
SELECT City FROM Suppliers WHERE Country='Germany';

-- SQL INTERSECT Operator
-- The INTERSECT operator returns the common records from two SELECT statements.
-- Example:
SELECT City FROM Customers WHERE Country='Germany'
INTERSECT
SELECT City FROM Suppliers WHERE Country='Germany';

-- SQL EXCEPT Operator
-- The EXCEPT operator returns records from the first SELECT statement that are not in the second SELECT statement.
-- Example:
SELECT City FROM Customers WHERE Country='Germany'
EXCEPT
SELECT City FROM Suppliers WHERE Country='Germany';
