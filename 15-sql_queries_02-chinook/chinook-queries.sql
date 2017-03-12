1.  SELECT firstName, lastName, CustomerId, Country
	FROM Customer

2.  SELECT firstName, lastName, CustomerId, Country
	FROM Customer
	WHERE Country = 'Brazil'

3.	SELECT Customer.firstName, Customer.lastName, 
	Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.BillingCountry
	FROM Customer, Invoice
	ON Customer.Country = Invoice.BillingCountry
	WHERE Customer.Country = 'Brazil'

4.	SELECT Employee.*
	FROM Employee
	WHERE Title = 'Sales Support Agent' 

5.	SELECT DISTINCT BillingCountry
	FROM Invoice

6. SELECT Invoice.*
	FROM Invoice
	WHERE BillingCountry = 'Brazil'

7.	SELECT Invoice.*, Employee.FirstName, Employee.LastName
	FROM Invoice, Employee, Customer
	WHERE Invoice.CustomerId = Customer.CustomerId 
	AND Customer.SupportRepId = Employee.EmployeeId

8.	SELECT Invoice.Total, Customer.FirstName AS 'Customer First Name', 
	Customer.LastName AS 'Customer Last Name', Customer.Country, 
	Employee.FirstName AS 'Agent First Name', 
	Employee.LastName AS 'Agent Last Name'
	FROM Invoice, Employee, Customer
	WHERE Invoice.CustomerId = Customer.CustomerId 
	AND Customer.SupportRepId = Employee.EmployeeId

9.

10.	SELECT COUNT(InvoiceLineId)
	FROM InvoiceLine
	WHERE InvoiceId = '37'

11.	SELECT COUNT(InvoiceLineId) AS 'Line Items', 
	InvoiceId AS 'Invoice Id'
	FROM InvoiceLine
	GROUP BY InvoiceId

12.	SELECT InvoiceLine.InvoiceLineId AS 'Invoice Line ID',
	Track.Name AS 'Track'
	FROM InvoiceLine
	JOIN Track
	WHERE InvoiceLine.TrackId = Track.TrackId
	ORDER BY InvoiceLine.InvoiceLineId

13.	SELECT DISTINCT InvoiceLine.InvoiceLineId AS 'Invoice Line ID',
	Track.Name AS 'Track',
	Artist.Name AS 'Artist'
	FROM InvoiceLine, Track, Artist, Album
	ON InvoiceLine.TrackId = Track.TrackId
	WHERE Artist.ArtistId = Album.ArtistId
	AND Album.AlbumId = Track.AlbumId
	ORDER BY Artist.name

14.	SELECT COUNT(invoiceId), BillingCountry AS 'Country'
	FROM Invoice
	GROUP BY BillingCountry

15.	SELECT Playlist.Name AS 'Playlist', COUNT(PlaylistTrack.TrackId)
	FROM Playlist
	JOIN PlaylistTrack
	ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
	GROUP BY Playlist.Name

16.	SELECT Track.Name AS 'Track', Album.Title AS 'Album',
	MediaType.Name AS 'Type', Genre.Name AS 'Genre'
	FROM Track, Album, Genre, MediaType
	WHERE Track.AlbumId = Album.AlbumId 
	AND Track.MediaTypeId = MediaType.MediaTypeId
	AND Track.GenreId = Genre.GenreId
	GROUP BY Track.Name

17.	SELECT Invoice.*, COUNT(InvoiceLine.InvoiceLineId) 
	AS 'Invoice Line Items'
	FROM Invoice, InvoiceLine
	WHERE Invoice.InvoiceId = InvoiceLine.InvoiceId
	GROUP BY Invoice.InvoiceId

18.	SELECT Employee.FirstName, Employee.LastName, 
	COUNT(Invoice.Total) AS 'Total Sales'
	FROM Employee, Invoice, Customer
	WHERE Invoice.CustomerId = Customer.CustomerId
	AND Customer.SupportRepId = Employee.EmployeeId
	AND Employee.Title = 'Sales Support Agent'
	GROUP BY Employee.FirstName

19.	SELECT COUNT(Invoice.Total) AS 'Total Sales in 2009',
	Employee.FirstName, Employee.LastName
	FROM Employee, Invoice, Customer
	WHERE Invoice.CustomerId = Customer.CustomerId
	AND Customer.SupportRepId = Employee.EmployeeId
	AND Employee.Title = 'Sales Support Agent'
	AND Invoice.InvoiceDate LIKE '2009%'
	GROUP BY Employee.FirstName
	ORDER BY COUNT(Invoice.Total) DESC
	LIMIT 1

20.	SELECT COUNT(Invoice.Total) AS 'Total Sales in 2010',
	Employee.FirstName, Employee.LastName
	FROM Employee, Invoice, Customer
	WHERE Invoice.CustomerId = Customer.CustomerId
	AND Customer.SupportRepId = Employee.EmployeeId
	AND Employee.Title = 'Sales Support Agent'
	AND Invoice.InvoiceDate LIKE '2010%'
	GROUP BY Employee.FirstName
	ORDER BY COUNT(Invoice.Total) DESC
	LIMIT 1

21.	SELECT Employee.FirstName, Employee.LastName, 
	COUNT(Invoice.Total) AS 'Total Sales'
	FROM Employee, Invoice, Customer
	WHERE Invoice.CustomerId = Customer.CustomerId
	AND Customer.SupportRepId = Employee.EmployeeId
	AND Employee.Title = 'Sales Support Agent'
	GROUP BY Employee.FirstName
	LIMIT 1

22.	SELECT Employee.FirstName, Employee.LastName,
	COUNT(Customer.CustomerId) AS '# of Customers'
	FROM Employee, Customer
	WHERE Customer.SupportRepId = Employee.EmployeeId
	AND Employee.Title = 'Sales Support Agent'
	GROUP BY Employee.FirstName

23.	SELECT Invoice.BillingCountry AS 'Country', 
	SUM(Invoice.Total) AS 'Total'
	FROM Invoice
	GROUP BY BillingCountry

24.	SELECT SUM(Total) AS 'Total',
	BillingCountry AS 'Country'
	FROM Invoice
	GROUP BY BillingCountry
	ORDER BY Total DESC
	LIMIT 1

25.	SELECT COUNT(InvoiceLine.TrackId) AS 'Units Sold in 2013',
	Track.Name AS 'Track'
	FROM Track, InvoiceLine, Invoice
	WHERE Track.TrackId = InvoiceLine.TrackId
	AND Invoice.InvoiceId = InvoiceLine.InvoiceId
	AND Invoice.InvoiceDate LIKE '2013%'
	GROUP BY Track.Name
	ORDER BY COUNT(InvoiceLine.TrackId) DESC
	LIMIT 1

26.	SELECT COUNT(InvoiceLine.TrackId) AS 'Units Sold',
	Track.Name AS 'Track'
	FROM Track, InvoiceLine, Invoice
	WHERE Track.TrackId = InvoiceLine.TrackId
	AND Invoice.InvoiceId = InvoiceLine.InvoiceId
	GROUP BY Track.Name
	ORDER BY COUNT(InvoiceLine.TrackId) DESC
	LIMIT 5

27.	SELECT COUNT(InvoiceLine.TrackId) AS 'Units Sold in 2013',
	Artist.Name AS 'Artist'
	FROM Track, InvoiceLine, Invoice, Artist, Album
	WHERE Track.TrackId = InvoiceLine.TrackId
	AND Invoice.InvoiceId = InvoiceLine.InvoiceId
	AND Track.AlbumId = Album.AlbumId
	AND Album.ArtistId = Artist.ArtistId
	GROUP BY Artist.Name
	ORDER BY COUNT(InvoiceLine.TrackId) DESC
	LIMIT 3

28.	SELECT COUNT(Track.MediaTypeId) AS 'Units Sold',
	MediaType.Name AS 'Media Type'
	FROM Track, InvoiceLine, MediaType
	WHERE Track.MediaTypeId = MediaType.MediaTypeId
	AND InvoiceLine.TrackId = Track.TrackId
	GROUP BY MediaType.Name
	ORDER BY COUNT(Track.MediaTypeId) DESC
	LIMIT 1
