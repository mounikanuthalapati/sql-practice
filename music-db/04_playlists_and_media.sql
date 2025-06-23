-- 10. Which playlists contain more than 30 tracks?
SELECT Playlist.Name, COUNT(track.Name) AS TrackCount
FROM playlist
JOIN playlisttrack ON playlist.PlaylistId = playlisttrack.PlaylistId
JOIN track ON track.TrackId = playlisttrack.TrackId
GROUP BY Playlist.Name
HAVING TrackCount > 30
ORDER BY TrackCount;

-- 11. Show the number of tracks per media type
SELECT MediaType.Name, COUNT(track.TrackId) AS TrackCount
FROM track
INNER JOIN MediaType ON track.MediaTypeId = MediaType.MediaTypeId
GROUP BY MediaType.Name
ORDER BY TrackCount;

-- 12. List all tracks in the playlist “Classical”
SELECT Track.Name, Playlist.Name
FROM track
INNER JOIN playlisttrack ON track.TrackId = playlisttrack.TrackId
JOIN playlist ON playlist.PlaylistId = playlisttrack.PlaylistId
WHERE playlist.Name = 'Classical'
ORDER BY Track.Name;
