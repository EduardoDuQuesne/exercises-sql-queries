
-- 1. Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT *
FROM Customer
WHERE country != "USA"

-- 2. Provide a query only showing the Customers from Brazil.
SELECT *
FROM Customer
WHERE country = "Brazil"

-- 3. Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT c.FirstName "First Name", c.LastName "Last Name", i.InvoiceId  "Invoice ID", i.InvoiceDate "Date", i.BillingCountry "Country"
FROM Customer c
JOIN Invoice i
ON c.CustomerId = i.CustomerId
WHERE Country = "Brazil"

-- 4. Provide a query showing only the Employees who are Sales Agents.
SELECT *
FROM Employee e
WHERE e.title = "Sales Support Agent"

-- 5. Provide a query showing a unique list of billing countries from the Invoice table.
SELECT i.BillingCountry
FROM Invoice i
GROUP BY i.BillingCountry

-- 6. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
-- NO EMPLOYEE ID ON INVOICE?

-- 7. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
-- NO EMPLOYEE ID ON INVOICE?

SELECT c.FirstName "First Name", c.LastName "Last Name", i.BillingCountry "Country", i.Total "Total"
FROM Invoice i 
JOIN Customer c
ON c.CustomerId = i.CustomerId

-- 8. How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?
SELECT COUNT(i.InvoiceDate) "SALES", substr(i.InvoiceDate, 1, 4) "YEAR"
FROM Invoice i
WHERE substr(i.InvoiceDate, 1, 4) = "2009"
OR substr(i.InvoiceDate, 1, 4) = "2011"
GROUP BY substr(i.InvoiceDate, 1, 4)

-- 9. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT i.InvoiceId "ID", COUNT(i.InvoiceId) "Number"
FROM InvoiceLine i
WHERE i.InvoiceId = "37"

-- 10 .Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
SELECT i.InvoiceId "ID", COUNT(i.InvoiceId) "Number"
FROM InvoiceLine i
GROUP BY i.InvoiceId

-- 11. Provide a query that includes the track name with each invoice line item.
SELECT t.Name, i.*
FROM Track t
JOIN InvoiceLIne i
ON i.TrackId = t.TrackId

-- 12. Provide a query that includes the purchased track name AND artist name with each invoice line item.
SELECT t.Name, t.Composer, i.*
FROM Track t
JOIN InvoiceLIne i
ON i.TrackId = t.TrackId

-- 13. Provide a query that shows the # of invoices per country. HINT: GROUP BY
SELECT i.BillingCountry "Country", Count(i.InvoiceId) "Count"
FROM Invoice i
GROUP BY i.BillingCountry

-- 14. Provide a query that shows the total number of tracks in each playlist. The Playlist name should be included on the resultant table.
SELECT COUNT(pt.TrackId) "Count", p.Name, p.PlaylistId
FROM PlaylistTrack pt
JOIN Playlist p
ON p.PlaylistId = pt.PlaylistId
GROUP BY pt.PlaylistId

-- 15. Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include the Album name, Media type and Genre.
SELECT t.Name, t.Composer, t.Bytes "Size", t.Milliseconds "Length",  t.UnitPrice "Price",  m.Name, g.Name
FROM Track t
JOIN MediaType m
ON m.MediaTypeId = t.MediaTypeId
JOIN Genre g
ON g.GenreId = t.GenreId

-- 16.Provide a query that shows all Invoices but includes the # of invoice line items.
SELECT i.*, COUNT(il.InvoiceId)
FROM Invoice i
JOIN InvoiceLine il
ON i.InvoiceId = il.InvoiceId
GROUP BY il.InvoiceId

-- 17.Provide a query that shows total sales made by each sales agent.
SELECT e.FirstName "First Name", e.LastName "Last Name", COUNT(i.CustomerId) "Sales", c.SupportRepId
FROM Employee e 
JOIN Customer c
ON c.SupportRepId = e.EmployeeId
JOIN Invoice i
ON i.CustomerId = c.CustomerId
GROUP BY e.EmployeeId

-- 18. Which sales agent made the most in sales in 2009?
SELECT e.FirstName "First Name", e.LastName "Last Name", Count(i.CustomerId) "Sales", c.SupportRepId
FROM Employee e 
JOIN Customer c
ON c.SupportRepId = e.EmployeeId
JOIN Invoice i
ON i.CustomerId = c.CustomerId
WHERE substr(i.InvoiceDate, 1, 4) = "2009"
GROUP BY e.EmployeeId
ORDER BY "Sales" desc
LIMIT 1

-- 19. Which sales agent made the most in sales in 2010?
SELECT e.FirstName "First Name", e.LastName "Last Name", Count(i.CustomerId) "Sales", c.SupportRepId
FROM Employee e 
JOIN Customer c
ON c.SupportRepId = e.EmployeeId
JOIN Invoice i
ON i.CustomerId = c.CustomerId
WHERE substr(i.InvoiceDate, 1, 4) = "2010"
GROUP BY e.EmployeeId
ORDER BY "Sales" desc
LIMIT 1

-- 20. Which sales agent made the most in sales over all?
SELECT e.FirstName "First Name", e.LastName "Last Name", Count(i.CustomerId) "Sales", c.SupportRepId
FROM Employee e 
JOIN Customer c
ON c.SupportRepId = e.EmployeeId
JOIN Invoice i
ON i.CustomerId = c.CustomerId
GROUP BY e.EmployeeId
ORDER BY "Sales" desc
LIMIT 1

-- 21. Provide a query that shows the # of customers assigned to each sales agent.
SELECT COUNT(c.CustomerId), e.FirstName, e.LastName
FROM Customer c
JOIN Employee e
ON e.EmployeeId = c.SupportRepId
WHERE e.Title = "Sales Support Agent"
GROUP BY e.EmployeeId

-- 22. Provide a query that shows the total sales per country. Which country's customers spent the most?
SELECT i.BillingCountry "Country", SUM(i.Total) "Total"
FROM Invoice i
GROUP BY i.BillingCountry
ORDER BY "Total" desc
LIMIT 1

-- 23. Provide a query that shows the most purchased track of 2013.
-- ????
SELECT COUNT(il.TrackId), t.Name
FROM InvoiceLine il
JOIN Track t
ON t.TrackId = il.TrackId
GROUP BY il.TrackId
ORDER BY COUNT(il.TrackId) desc

-- 24. Provide a query that shows the top 5 most purchased tracks over all.



-- 25. Provide a query that shows the top 3 best selling artists.

-- 26. Provide a query that shows the most purchased Media Type.

-- 27. Provide a query that shows the number tracks purchased in all invoices that contain more than one genre.

