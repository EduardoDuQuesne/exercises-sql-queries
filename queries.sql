-- 1. Query all of the entries in the `Genre` table
SELECT * 
FROM Genre

-- 2. Using the `INSERT` statement, add one of your favorite artists to the `Artist` table.
INSERT INTO Artist VALUES (null, "Can", 1965)

-- 3. Using the `INSERT` statement, add one, or more, albums by your artist to the `Album` table.
INSERT INTO "Album" ("Title", "ReleaseDate", "AlbumLength", "Label", "ArtistId", "GenreId")
SELECT "Tago Mago", 1971, 7327, "United Artists", ar.ArtistId, g.GenreId
FROM Artist ar, Genre g 
WHERE ar.ArtistName = "Can"
AND g.Label = "Rock"

-- 4.Using the `INSERT` statement, add some songs that are on that album to the `Song` table.
INSERT INTO "Song" ("Title", "SongLength", "ReleaseDate", "GenreId", "ArtistId", "AlbumId")
SELECT "Paperhouse", 728, 1971, g.GenreId, ar.ArtistId, al.AlbumId
FROM Artist ar, Genre g, Album al 
WHERE ar.ArtistName = "Can"
AND g.Label = "Rock"
AND al.Title = "Tago Mago"

-- 5.Write a `SELECT` query that provides the song titles, album title, and artist name for all of the data you just entered in. 
SELECT Artist.ArtistName AS " Artist Name", Song.Title AS "Song Title", Album.Title AS "Album Title"
FROM Song
JOIN Album
ON Song.ArtistId = Album.ArtistId
JOIN Artist
ON Artist.ArtistId = Song.ArtistId
WHERE Artist.ArtistName = "Can"

-- 6.Write a `SELECT` statement to display how many songs exist for each album. You'll need to use the `COUNT()` function and the `GROUP BY` keyword sequence.
SELECT COUNT(Song.AlbumId), Album.Title
FROM Song
JOIN Album
ON Album.AlbumId = Song.AlbumId
GROUP BY Album.Title

-- 7.Write a `SELECT` statement to display how many songs exist for each artist. You'll need to use the `COUNT()` function and the `GROUP BY` keyword sequence.
SELECT COUNT(Song.Title), Artist.ArtistName
FROM Song
JOIN Artist
ON Artist.ArtistId = Song.ArtistId
GROUP BY Artist.ArtistName

-- 8.Write a `SELECT` statement to display how many songs exist for each genre. You'll need to use the `COUNT()` function and the `GROUP BY` keyword sequence.
SELECT COUNT(Song.Title), Genre.Label
FROM Song
JOIN Genre
ON Genre.GenreId = Song.GenreId
GROUP BY Genre.Label

-- 9.Using `MAX()` function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT MAX(al.AlbumLength) AS "Album Length", ar.ArtistName AS "Artist", al.Title
FROM Album al
JOIN Artist ar
ON ar.ArtistId = al.ArtistId

-- 10.Using `MAX()` function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT MAX(s.SongLength) AS "Song Length", s.Title, ar.ArtistName
FROM Song s
JOIN Artist ar
ON ar.ArtistId = s.ArtistId


-- 11.Modify the previous query to also display the title of the album.
SELECT MAX(s.SongLength) AS "Song Length", s.Title AS "Song Title", ar.ArtistName, al.Title AS "Album Title"
FROM Song s
JOIN Artist ar
ON ar.ArtistId = s.ArtistId
JOIN Album al
ON al.AlbumId = s.AlbumId
