-- ====================================================================================
-- Platform: W3Schools
-- Topic: Full SQL Essentials Practice
-- Description: Covers all foundational SQL topics with explanations and sample queries
-- Date: 2025-05-01
-- ====================================================================================

-- 🔹 SQL Database
-- - Used to store and manage data using relational tables.
-- - You can create, delete, and switch between databases.

CREATE DATABASE w3_movies;

USE w3_movies;

-- ----------------------------------------------------------------------------

-- 🔹 SQL Create DB
-- - CREATE DATABASE is used to make a new SQL database.

CREATE DATABASE store_inventory;

-- ----------------------------------------------------------------------------

-- 🔹 SQL Drop DB
-- - DROP DATABASE deletes the entire database (including all tables).
-- - Be careful: this operation is irreversible.

DROP DATABASE old_inventory;

-- ----------------------------------------------------------------------------

-- 🔹 SQL Backup DB
-- - SQL itself doesn’t include direct backup commands.
-- - Backups are usually done using external tools (like `mysqldump` for MySQL).
-- Example command (not SQL):
-- mysqldump -u root -p w3_movies > backup.sql

-- ----------------------------------------------------------------------------

-- 🔹 SQL Create Table
-- - CREATE TABLE defines a new table structure.

CREATE TABLE actors (
    actor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    birth_year INT,
    country VARCHAR(50)
);

-- ----------------------------------------------------------------------------

-- 🔹 SQL Drop Table
-- - DROP TABLE permanently deletes a table.

DROP TABLE actors;

-- ----------------------------------------------------------------------------

-- 🔹 SQL Alter Table
-- - Used to modify a table (e.g., add or drop columns).

ALTER TABLE movies
ADD COLUMN budget BIGINT;

ALTER TABLE movies
DROP COLUMN genre;

-- ----------------------------------------------------------------------------

-- 🔹 SQL Constraints
-- - Rules applied to columns (e.g., NOT NULL, UNIQUE, etc.)

-- Example with multiple constraints:
CREATE TABLE directors (
    director_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- ----------------------------------------------------------------------------

-- 🔹 SQL Not Null
-- - Prevents NULL values in a column.

CREATE TABLE languages (
    language_id INT,
    name VARCHAR(50) NOT NULL
);

-- ----------------------------------------------------------------------------

-- 🔹 SQL Unique
-- - Ensures that all values in a column (or combination) are different.

CREATE TABLE users (
    user_id INT,
    email VARCHAR(100) UNIQUE
);

-- ----------------------------------------------------------------------------

-- 🔹 SQL Primary Key
-- - Uniquely identifies each record; automatically NOT NULL and UNIQUE.

CREATE TABLE genres (
    genre_id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- ----------------------------------------------------------------------------

-- 🔹 SQL Foreign Key
-- - Links one table to another.

CREATE TABLE movie_genres (
    movie_id INT,
    genre_id INT,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

-- ----------------------------------------------------------------------------

-- 🔹 SQL Check
-- - Ensures values meet a condition.

CREATE TABLE tickets (
    price DECIMAL(5, 2) CHECK (price > 0)
);

-- ----------------------------------------------------------------------------

-- 🔹 SQL Default
-- - Assigns a default value when none is specified.

CREATE TABLE customers (
    id INT,
    country VARCHAR(50) DEFAULT 'USA'
);

-- ----------------------------------------------------------------------------

-- 🔹 SQL Index
-- - Improves query performance on large tables.

CREATE INDEX idx_title ON movies(title);

-- ----------------------------------------------------------------------------

-- 🔹 SQL Auto Increment
-- - Automatically generates a unique value for new rows.

CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT
);

-- ----------------------------------------------------------------------------

-- 🔹 SQL Dates
-- - Date and time are handled using DATE, DATETIME, etc.

CREATE TABLE events (
    id INT,
    event_date DATE
);

-- Example: Select events from a specific year
SELECT * FROM events
WHERE YEAR(event_date) = 2025;

-- ----------------------------------------------------------------------------

-- 🔹 SQL Views
-- - A virtual table based on SELECT query.

CREATE VIEW high_rated_movies AS
SELECT title, rating
FROM movies
WHERE rating > 8.0;

-- ----------------------------------------------------------------------------

-- 🔹 SQL Injection
-- - A security risk where malicious SQL is inserted via input fields.
-- - Use parameterized queries to avoid this.

-- BAD EXAMPLE (prone to injection):
-- SELECT * FROM users WHERE username = 'user' OR '1'='1';

-- GOOD EXAMPLE (in Python):
-- cursor.execute("SELECT * FROM users WHERE username = %s", (user_input,))

-- ----------------------------------------------------------------------------

-- 🔹 SQL Hosting
-- - SQL can be hosted via:
--   - Local server (MySQL, PostgreSQL)
--   - Shared hosting (phpMyAdmin)
--   - Cloud platforms (AWS RDS, Azure SQL)

-- ----------------------------------------------------------------------------

-- 🔹 SQL Data Types
-- - Common types: INT, VARCHAR, DATE, TEXT, FLOAT, BOOLEAN, etc.
-- - Choose appropriate types for efficiency and accuracy.

CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(100),
    hire_date DATE,
    is_active BOOLEAN
);

-- ====================================================================================
-- End of W3Schools SQL Practice Set
-- ====================================================================================
