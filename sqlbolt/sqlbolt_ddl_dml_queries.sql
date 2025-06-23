-- ====================================================================================
-- Platform: SQLBolt
-- Topic: Data Manipulation & Definition (DML & DDL)
-- Description: Practice problems for mastering INSERT, UPDATE, DELETE, CREATE, ALTER
-- Date: 2025-05-01
-- ====================================================================================

-- 🔹 Notes:
-- - INSERT is used to add new records to a table.
-- - UPDATE modifies existing records based on a condition.
-- - DELETE removes records from a table.
-- - CREATE is used to create new tables or databases.
-- - ALTER is used to modify an existing table structure (e.g., add columns).
-- - DROP deletes entire tables (DDL operation, irreversible).
-- ====================================================================================

-- 🔹 Problem 1: Insert a new movie
-- Description: Add a new record to the movies table.
INSERT INTO movies (title, director, year, length_minutes)
VALUES ('Toy Story 4', 'John Lasseter', 2000, 90);

-- ----------------------------------------------------------------------------

-- 🔹 Problem 2: Insert box office data
-- Description: Add corresponding box office stats for a movie.
INSERT INTO boxoffice (movie_id, rating, domestic_sales, international_sales)
VALUES (15, 8.7, 340000000, 270000000);

-- ----------------------------------------------------------------------------

-- 🔹 Problem 3: Update a director
-- Description: Change the director name for "A Bug's Life".
UPDATE movies
SET director = 'John Lasseter'
WHERE title = 'A Bug\'s Life';

-- ----------------------------------------------------------------------------

-- 🔹 Problem 4: Correct movie release year
-- Description: Update the release year of "Toy Story 2" to 1999.
UPDATE movies
SET year = 1999
WHERE title = 'Toy Story 2';

-- ----------------------------------------------------------------------------

-- 🔹 Problem 5: Fix incorrect movie title and director
-- Description: Rename and assign correct director to "Toy Story 8".
UPDATE movies
SET title = 'Toy Story 3', director = 'Lee Unkrich'
WHERE title = 'Toy Story 8';

-- ----------------------------------------------------------------------------

-- 🔹 Problem 6: Delete old movies
-- Description: Remove all movies released before 2005.
DELETE FROM movies
WHERE year < 2005;

-- ----------------------------------------------------------------------------

-- 🔹 Problem 7: Delete by director
-- Description: Remove all movies directed by Andrew Stanton.
DELETE FROM movies
WHERE director = 'Andrew Stanton';

-- ----------------------------------------------------------------------------

-- 🔹 Problem 8: Create a movies table
-- Description: Define a new movies table with basic columns.
CREATE TABLE movies (
    id INTEGER PRIMARY KEY,
    title TEXT,
    director TEXT,
    year INTEGER,
    length_minutes INTEGER
);

-- ----------------------------------------------------------------------------

-- 🔹 Problem 9: Create a boxoffice table
-- Description: Define a boxoffice table with reference to movie ID.
CREATE TABLE boxoffice (
    movie_id INTEGER,
    rating FLOAT,
    domestic_sales INTEGER,
    international_sales INTEGER
);

-- ----------------------------------------------------------------------------

-- 🔹 Problem 10: Add aspect ratio column
-- Description: Add a new column to store aspect ratio in movies table.
ALTER TABLE movies
ADD COLUMN aspect_ratio FLOAT;

-- ----------------------------------------------------------------------------

-- 🔹 Problem 11: Add default language column
-- Description: Add language column with default value "English".
ALTER TABLE movies
ADD COLUMN language TEXT DEFAULT 'English';

-- ----------------------------------------------------------------------------

-- 🔹 Problem 12: Drop the movies table
-- Description: Completely remove the movies table from the database.
DROP TABLE movies;

-- ----------------------------------------------------------------------------

-- 🔹 Problem 13: Drop the boxoffice table
-- Description: Completely remove the boxoffice table from the database.
DROP TABLE boxoffice;

-- ====================================================================================
-- End of SQLBolt-style exercises on INSERT, UPDATE, DELETE, CREATE, ALTER, DROP
-- ====================================================================================
