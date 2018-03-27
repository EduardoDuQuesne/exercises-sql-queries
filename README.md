# Nashville Software School: SQL Exercises

## Exercise 1: queries.sql
### Instructions

1. Open up the database file in the *DB Browser for SQLite* application to see it
1. Copy and paste the queries below into your `queries.sql` file and comment them out. Then you can write a query for each requrement and refer back to them later as a resource
1. When you have written a query, paste it into DB Browser and test it by clicking the tab labeled "Execute SQL"

For each of the following exercises, provide the appropriate query. Everything from class and the [Sqlite](http://www.sqlite.org/) documentation for SQL [keywords](https://www.sqlite.org/lang.html) and [functions](https://www.sqlite.org/lang_corefunc.html) is fair game.

1. Query all of the entries in the `Genre` table
1. Using the `INSERT` statement, add one of your favorite artists to the `Artist` table.
1. Using the `INSERT` statement, add one, or more, albums by your artist to the `Album` table.
1. Using the `INSERT` statement, add some songs that are on that album to the `Song` table.
1. Write a `SELECT` query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the [`LEFT JOIN`](https://www.tutorialspoint.com/sql/sql-using-joins.htm) keyword sequence to connect the tables, and the `WHERE` keyword to filter the results to the album and artist you added. Here is some more info on [joins](http://www.dofactory.com/sql/join) that might help.
    > **Reminder:** Direction of join matters. Try the following statements and see the difference in results.

    ```
    SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
    SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;
    ```
1. Write a `SELECT` statement to display how many songs exist for each album. You'll need to use the `COUNT()` function and the `GROUP BY` keyword sequence.
1. Write a `SELECT` statement to display how many songs exist for each artist. You'll need to use the `COUNT()` function and the `GROUP BY` keyword sequence.
1. Write a `SELECT` statement to display how many songs exist for each genre. You'll need to use the `COUNT()` function and the `GROUP BY` keyword sequence.
1. Using `MAX()` function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
1. Using `MAX()` function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
1. Modify the previous query to also display the title of the album.

## Exercise 2: Chinook ERD

![Chinook ERD](https://github.com/EduardoDuQuesne/exercises-sql-queries/blob/master/chinook_erd/Chinook%20ERD.png)

## Exercise 3: sql-chinook.sql

### Requirements
Use the [Chinook Database](https://chinookdatabase.codeplex.com/) and the [DB Browser for SQLite](http://sqlitebrowser.org/) we downloaded in the ERD exercise.

For each of the following exercises, provide the appropriate query.

1. Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
2. Provide a query only showing the Customers from Brazil.
3. Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
4. Provide a query showing only the Employees who are Sales Agents.
5. Provide a query showing a unique list of billing countries from the Invoice table.
6. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
7. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
8. How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?
9. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
10. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: [GROUP BY](http://www.sqlite.org/lang_select.html#resultset)
11. Provide a query that includes the track name with each invoice line item.
12. Provide a query that includes the purchased track name AND artist name with each invoice line item.
13. Provide a query that shows the # of invoices per country. HINT: [GROUP BY](http://www.sqlite.org/lang_select.html#resultset)
14. Provide a query that shows the total number of tracks in each playlist. The Playlist name should be included on the resultant table.
15. Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include the Album name, Media type and Genre.
16. Provide a query that shows all Invoices but includes the # of invoice line items.
17. Provide a query that shows total sales made by each sales agent.
18. Which sales agent made the most in sales in 2009?
19. Which sales agent made the most in sales in 2010?
20. Which sales agent made the most in sales over all?
21. Provide a query that shows the # of customers assigned to each sales agent.
22. Provide a query that shows the total sales per country. Which country's customers spent the most?
23. Provide a query that shows the most purchased track of 2013.
24. Provide a query that shows the top 5 most purchased tracks over all.
25. Provide a query that shows the top 3 best selling artists.
26. Provide a query that shows the most purchased Media Type.
27. Provide a query that shows the number tracks purchased in all invoices that contain more than one genre.
