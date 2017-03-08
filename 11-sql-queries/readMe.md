<!-- Instructions

Open up the database file in the DB Browser for SQLite application to see it
Copy and paste the queries below into your queries.sql file and comment them out. Then you can write a query for each requrement and refer back to them later as a resource
When you have written a query, paste it into DB Browser and test it by clicking the tab labeled "Execute SQL"
For each of the following exercises, provide the appropriate query. Everything from class and the Sqlite documentation for SQL keywords and functions is fair game. Note that

1.  Query all of the entries in the Genre table
	SELECT genre.label AS Genre
	FROM Genre

2.  Using the INSERT statement, add one of your favorite artists to the Artist table.
	INSERT INTO Artist
	VALUES (null, 'Pink Floyd', 1967)

3.  Using the INSERT statement, add one, or more, albums by your artist to the Album table.
	INSERT INTO Album
	VALUES (null, 'Dark Side of the Moon', 1973, 45000, 'Capitol',
	(SELECT artistid FROM Artist WHERE artistname = 'Pink Floyd'), 
	(SELECT genreid FROM Genre WHERE label = 'Rock'))


4.  Using the INSERT statement, add some songs that are on that album to the Song table.
	INSERT INTO Song
	VALUES (null, 'Breathe', 4000, 1973, 
	(SELECT genreid FROM Genre WHERE label = 'Rock'),
	(SELECT artistid FROM Artist WHERE artistname = 'Pink Floyd'), 
	(SELECT albumid FROM Album WHERE title = 'Dark Side of the Moon'))

	INSERT INTO Song
	VALUES (null, 'Any Colour You Like', 3700, 1973, 
	(SELECT genreid FROM Genre WHERE label = 'Rock'),
	(SELECT artistid FROM Artist WHERE artistname = 'Pink Floyd'), 
	(SELECT albumid FROM Album WHERE title = 'Dark Side of the Moon'))


5.  Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added. Here is some more info on joins that might help.

		Reminder: Direction of join matters. Try the following statements and see the difference in results.
		SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
		SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

	SELECT artist.artistname, song.title, album.title as 'Album'
	FROM Song, Album
	LEFT JOIN Artist
	ON artist.artistid = album.artistid AND song.artistid = artist.artistid
	WHERE artist.artistname = 'Pink Floyd'


Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

	SELECT album.title, COUNT(song.title) AS '# of songs'
	FROM Album, Song
	ON album.albumid = song.albumid
	GROUP BY album.title


Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

	SELECT artist.artistname, COUNT(song.title) AS '# of songs'
	FROM Artist, Song
	ON artist.artistid = song.artistid
	GROUP BY artist.artistid

Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

	SELECT genre.label, COUNT(song.title) AS '# of songs'
	FROM Genre, Song
	ON genre.genreid = song.genreid
	GROUP BY genre.label


Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
	SELECT title, MAX(albumlength)
	FROM Album

Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
	SELECT title, MAX(songlength)
	FROM Song

Modify the previous query to also display the title of the album.
	SELECT song.title, MAX(song.songlength), album.title
	FROM Song, Album
 -->
