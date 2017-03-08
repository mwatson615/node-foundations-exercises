1.  SELECT genre.label AS Genre
	FROM Genre

2.	INSERT INTO Artist
	VALUES (null, 'Pink Floyd', 1967)

3.	INSERT INTO Album
	VALUES (null, 'Dark Side of the Moon', 1973, 45000, 'Capitol',
	(SELECT artistid FROM Artist WHERE artistname = 'Pink Floyd'),
	(SELECT genreid FROM Genre WHERE label = 'Rock'))

4.	INSERT INTO Song
	VALUES (null, 'Breathe', 4000, 1973,
	(SELECT genreid FROM Genre WHERE label = 'Rock'),
	(SELECT artistid FROM Artist WHERE artistname = 'Pink Floyd'),
	(SELECT albumid FROM Album WHERE title = 'Dark Side of the Moon'))

	INSERT INTO Song
	VALUES (null, 'Money', 3500, 1973,
	(SELECT genreid FROM Genre WHERE label = 'Rock'),
	(SELECT artistid FROM Artist WHERE artistname = 'Pink Floyd'),
	(SELECT albumid FROM Album WHERE title = 'Dark Side of the Moon'))

	INSERT INTO Song
	VALUES (null, 'Any Colour You Like', 3700, 1973,
	(SELECT genreid FROM Genre WHERE label = 'Rock'),
	(SELECT artistid FROM Artist WHERE artistname = 'Pink Floyd'),
	(SELECT albumid FROM Album WHERE title = 'Dark Side of the Moon'))

5.	SELECT artist.artistname, song.title, album.title as 'Album'
	FROM Song, Album
	LEFT JOIN Artist
	ON artist.artistid = album.artistid AND song.artistid = artist.artistid
	WHERE artist.artistname = 'Pink Floyd'

6.	SELECT album.title, COUNT(song.title) AS '# of songs'
	FROM Album, Song
	ON album.albumid = song.albumid
	GROUP BY album.title

7.	SELECT artist.artistname, COUNT(song.title) AS '# of songs'
	FROM Artist, Song
	ON artist.artistid = song.artistid
	GROUP BY artist.artistid

8.	SELECT genre.label, COUNT(song.title) AS '# of songs'
	FROM Genre, Song
	ON genre.genreid = song.genreid
	GROUP BY genre.label

9.	SELECT title, MAX(albumlength)
	FROM Album

10.	SELECT title, MAX(songlength)
	FROM Song

11.	SELECT song.title, MAX(song.songlength), album.title
	FROM Song, Album
