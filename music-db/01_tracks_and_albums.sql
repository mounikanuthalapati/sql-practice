-- 1. List all track names along with their album titles
SELECT DISTINCT track.Name, Album.Title
FROM track
INNER JOIN album ON track.AlbumId = album.AlbumId;

-- 2. Find all albums released by a specific artist (e.g., 'Lolly')
SELECT Album.Title AS [Album Title], Artist.Name AS [Artist Name]
FROM album
INNER JOIN artist ON album.ArtistId = artist.ArtistId
WHERE Artist.Name = 'Lolly';

-- 3. Show the number of tracks in each album
SELECT album.Title, COUNT(track.Name) AS TrackCount
FROM track
INNER JOIN album ON track.AlbumId = album.AlbumId
GROUP BY album.Title
ORDER BY TrackCount;
