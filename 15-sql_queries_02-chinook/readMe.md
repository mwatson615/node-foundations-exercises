<!-- Requirements

Use the Chinook Database and the DB Browser for SQLite we downloaded in the ERD exercise.

For each of the following exercises, provide the appropriate query.

Keep your successful queries in a chinook-queries.sql file.

Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.

SELECT firstName, lastName, CustomerId, Country
FROM Customer

Provide a query only showing the Customers from Brazil.

SELECT firstName, lastName, CustomerId, Country
FROM Customer
WHERE Country = 'Brazil'

Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

SELECT Customer.firstName, Customer.lastName, 
Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.BillingCountry
FROM Customer, Invoice
ON Customer.Country = Invoice.BillingCountry
WHERE Customer.Country = 'Brazil'

Provide a query showing only the Employees who are Sales Agents.

SELECT Employee.*
FROM Employee
WHERE Title = 'Sales Support Agent' 

Provide a query showing a unique list of billing countries from the Invoice table.

SELECT DISTINCT BillingCountry
FROM Invoice

Provide a query showing the invoices of customers who are from Brazil.

SELECT Invoice.*
FROM Invoice
WHERE BillingCountry = 'Brazil'

Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

SELECT Invoice.*, Employee.FirstName, Employee.LastName
FROM Invoice, Employee, Customer
WHERE Invoice.CustomerId = Customer.CustomerId
AND Customer.SupportRepId = Employee.EmployeeId -->

<!-- Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

SELECT Invoice.Total, Customer.FirstName AS 'Customer First Name', 
Customer.LastName AS 'Customer Last Name', Customer.Country, 
Employee.FirstName AS 'Agent First Name', 
Employee.LastName AS 'Agent Last Name'
FROM Invoice, Employee, Customer
WHERE Invoice.CustomerId = Customer.CustomerId 
AND Customer.SupportRepId = Employee.EmployeeId -->

How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?

SELECT COUNT(InvoiceId) AS 'Invoice Totals', 
Total(Total) AS '2009 Totals', Total(Total) AS '2011 Totals' 
FROM Invoice
WHERE InvoiceDate LIKE '2009%' 
ORDER BY InvoiceDate

<!-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.

SELECT COUNT(InvoiceLineId)
FROM InvoiceLine
WHERE InvoiceId = '37' -->

<!-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY

SELECT COUNT(InvoiceLineId) AS 'Line Items', 
InvoiceId AS 'Invoice Id'
FROM InvoiceLine
GROUP BY InvoiceId -->

<!-- Provide a query that includes the track name with each invoice line item

SELECT InvoiceLine.InvoiceLineId AS 'Invoice Line ID',
Track.Name AS 'Track'
FROM InvoiceLine
JOIN Track
WHERE InvoiceLine.TrackId = Track.TrackId
ORDER BY InvoiceLine.InvoiceLineId -->

<!-- Provide a query that includes the purchased track name AND artist name with each invoice line item.

SELECT DISTINCT InvoiceLine.InvoiceLineId AS 'Invoice Line ID',
Track.Name AS 'Track',
Artist.Name AS 'Artist'
FROM InvoiceLine, Track, Artist, Album
ON InvoiceLine.TrackId = Track.TrackId
WHERE Artist.ArtistId = Album.ArtistId
AND Album.AlbumId = Track.AlbumId
ORDER BY Artist.name -->

<!-- Provide a query that shows the # of invoices per country. HINT: GROUP BY

SELECT COUNT(invoiceId), BillingCountry AS 'Country'
FROM Invoice
GROUP BY BillingCountry -->

<!-- Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resultant table.

SELECT Playlist.Name AS 'Playlist', COUNT(PlaylistTrack.TrackId)
FROM Playlist
JOIN PlaylistTrack
ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
GROUP BY Playlist.Name -->

<!-- Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include the Album name, Media type and Genre.

SELECT Track.Name AS 'Track', Album.Title AS 'Album',
MediaType.Name AS 'Type', Genre.Name AS 'Genre'
FROM Track, Album, Genre, MediaType
WHERE Track.AlbumId = Album.AlbumId 
AND Track.MediaTypeId = MediaType.MediaTypeId
AND Track.GenreId = Genre.GenreId
GROUP BY Track.Name -->

<!-- Provide a query that shows all Invoices but includes the # of invoice line items.

SELECT Invoice.*, COUNT(InvoiceLine.InvoiceLineId) 
AS 'Invoice Line Items'
FROM Invoice, InvoiceLine
WHERE Invoice.InvoiceId = InvoiceLine.InvoiceId
GROUP BY Invoice.InvoiceId -->

<!-- Provide a query that shows total sales made by each sales agent.

SELECT Employee.FirstName, Employee.LastName, 
COUNT(Invoice.Total) AS 'Total Sales'
FROM Employee, Invoice, Customer
WHERE Invoice.CustomerId = Customer.CustomerId
AND Customer.SupportRepId = Employee.EmployeeId
AND Employee.Title = 'Sales Support Agent'
GROUP BY Employee.FirstName -->

<!-- Which sales agent made the most in sales in 2009?

SELECT COUNT(Invoice.Total) AS 'Total Sales in 2009',
Employee.FirstName, Employee.LastName
FROM Employee, Invoice, Customer
WHERE Invoice.CustomerId = Customer.CustomerId
AND Customer.SupportRepId = Employee.EmployeeId
AND Employee.Title = 'Sales Support Agent'
AND Invoice.InvoiceDate LIKE '2009%'
GROUP BY Employee.FirstName
ORDER BY COUNT(Invoice.Total) DESC
LIMIT 1

Which sales agent made the most in sales in 2010?

SELECT COUNT(Invoice.Total) AS 'Total Sales in 2010',
Employee.FirstName, Employee.LastName
FROM Employee, Invoice, Customer
WHERE Invoice.CustomerId = Customer.CustomerId
AND Customer.SupportRepId = Employee.EmployeeId
AND Employee.Title = 'Sales Support Agent'
AND Invoice.InvoiceDate LIKE '2010%'
GROUP BY Employee.FirstName
ORDER BY COUNT(Invoice.Total) DESC
LIMIT 1

<!- Which sales agent made the most in sales over all?

SELECT Employee.FirstName, Employee.LastName,
COUNT(Invoice.Total) AS 'Total Sales'
FROM Employee, Invoice, Customer
WHERE Invoice.CustomerId = Customer.CustomerId
AND Customer.SupportRepId = Employee.EmployeeId
AND Employee.Title = 'Sales Support Agent'
GROUP BY Employee.FirstName
LIMIT 1 -->

<!-- Provide a query that shows the # of customers assigned to each sales agent.

SELECT Employee.FirstName, Employee.LastName,
COUNT(Customer.CustomerId) AS '# of Customers'
FROM Employee, Customer
WHERE Customer.SupportRepId = Employee.EmployeeId
AND Employee.Title = 'Sales Support Agent'
GROUP BY Employee.FirstName -->

<!-- Provide a query that shows the total sales per country.

SELECT Invoice.BillingCountry AS 'Country', 
SUM(Invoice.Total) AS 'Total'
FROM Invoice
GROUP BY BillingCountry -->

<!-- Which country's customers spent the most?

SELECT SUM(Total) AS 'Total',
BillingCountry AS 'Country'
FROM Invoice
GROUP BY BillingCountry
ORDER BY Total DESC
LIMIT 1 -->

<!-- Provide a query that shows the most purchased track of 2013.

SELECT COUNT(InvoiceLine.TrackId) AS 'Units Sold in 2013',
Track.Name AS 'Track'
FROM Track, InvoiceLine, Invoice
WHERE Track.TrackId = InvoiceLine.TrackId
AND Invoice.InvoiceId = InvoiceLine.InvoiceId
AND Invoice.InvoiceDate LIKE '2013%'
GROUP BY Track.Name
ORDER BY COUNT(InvoiceLine.TrackId) DESC
LIMIT 1 -->

<!-- Provide a query that shows the top 5 most purchased tracks over all.

SELECT COUNT(InvoiceLine.TrackId) AS 'Units Sold',
Track.Name AS 'Track'
FROM Track, InvoiceLine, Invoice
WHERE Track.TrackId = InvoiceLine.TrackId
AND Invoice.InvoiceId = InvoiceLine.InvoiceId
GROUP BY Track.Name
ORDER BY COUNT(InvoiceLine.TrackId) DESC
LIMIT 5 -->

<!-- Provide a query that shows the top 3 best selling artists.

SELECT COUNT(InvoiceLine.TrackId) AS 'Units Sold in 2013',
Artist.Name AS 'Artist'
FROM Track, InvoiceLine, Invoice, Artist, Album
WHERE Track.TrackId = InvoiceLine.TrackId
AND Invoice.InvoiceId = InvoiceLine.InvoiceId
AND Track.AlbumId = Album.AlbumId
AND Album.ArtistId = Artist.ArtistId
GROUP BY Artist.Name
ORDER BY COUNT(InvoiceLine.TrackId) DESC
LIMIT 3 -->

<!-- Provide a query that shows the most purchased Media Type.

SELECT COUNT(Track.MediaTypeId) AS 'Units Sold',
MediaType.Name AS 'Media Type'
FROM Track, InvoiceLine, MediaType
WHERE Track.MediaTypeId = MediaType.MediaTypeId
AND InvoiceLine.TrackId = Track.TrackId
GROUP BY MediaType.Name
ORDER BY COUNT(Track.MediaTypeId) DESC
LIMIT 1 -->
