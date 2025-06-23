-- 4. List the top 10 most expensive tracks
SELECT Name, UnitPrice
FROM track
ORDER BY UnitPrice DESC
LIMIT 10;

-- 5. Find how many tracks exist for each genre
SELECT Genre.Name, COUNT(track.Name) AS [Track Count]
FROM track
INNER JOIN genre ON track.GenreId = genre.GenreId
GROUP BY genre.Name
ORDER BY [Track Count] DESC;

-- 6. Which genres have more than 100 tracks?
SELECT Genre.Name, COUNT(track.Name) AS TrackCount
FROM track
INNER JOIN genre ON track.GenreId = genre.GenreId
GROUP BY genre.Name
HAVING TrackCount > 100
ORDER BY TrackCount;
