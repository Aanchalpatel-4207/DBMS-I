use Bsc_Hons_503

--Part – A:
--1. List all books with their authors.

		SELECT 
			Book.BookID,
			Book.Title,
			Author.AuthorName
			FROM Book
			JOIN Author
			ON Book.AuthorID=Author.AuthorID
--2. List all books with their publishers.
		SELECT 
			Book.BookID,
			Book.Title,
			Publisher.PublisherID
			FROM Book
			JOIN Publisher
			ON Book.PublisherID=Publisher.PublisherID
--3. List all books with their authors and publishers.
	SELECT 
		Book.Title,
		Author.AuthorName,
		Publisher.PublisherName
		FROM Book
		JOIN Author
		ON  Book.AuthorID=Author.AuthorID
		JOIN Publisher
		ON Book.PublisherID=Publisher.PublisherID

--4. List all books published after 2010 with their authors and publisher and price.
		SELECT
			Book.Title,
			Book.BookID,
			Author.AuthorName,
			Publisher.PublisherName,
			Book.PublicationYear,
			Book.Price
			from Book
			join Author
			on Book.AuthorID=Author.AuthorID
			join Publisher
			on Book.PublisherID=Publisher.PublisherID
			where Book.PublicationYear>2010
			
--5. List all authors and the number of books they have written.
	select
		Author.AuthorName,
		COUNT(Book.BookID) AS COUNT_BOOK
		FROM Author 
		JOIN Book
		ON Book.AuthorID=Author.AuthorID
		GROUP BY Author.AuthorName
--6. List all publishers and the total price of books they have published.
		SELECT 
			Publisher.PublisherName,
			SUM(Book.Price) AS TOTAL_PRICE
			FROM Publisher
			JOIN Book
			ON Publisher.PublisherID=BOOK.PublisherID
			GROUP BY Publisher.PublisherName
--7. List authors who have not written any books.
	SELECT 
		Author.AuthorName,
		Book.Title
		FROM Author 
		LEFT OUTER JOIN Book
		ON Author.AuthorID=Book.AuthorID
		WHERE Book.AuthorID IS NULL
--8. Display total number of Books and Average Price of every Author.
	SELECT 
		Author.AuthorName,
		COUNT(Book.BookID) AS total_number_of_Books ,
		AVG(Book.Price) AS Average_Price
		FROM Book
		JOIN Author
		ON Book.AuthorID=Author.AuthorID
		GROUP BY AUTHOR.AuthorName
--9. lists each publisher along with the total number of books they have published, sorted from highest to
--lowest.
	SELECT 
		Publisher.PublisherName,
		COUNT(Book.BookID) AS TOTAL_NO_OF_BOOKS
		FROM Book
		JOIN Publisher
		ON Book.PublisherID=Publisher.PublisherID
		GROUP BY Publisher.PublisherName
		ORDER BY Publisher.PublisherName DESC
--10. Display number of books published each year

		SELECT 
			Book.PublicationYear,
			COUNT(Book.BookID) AS COUNT_BOOK_ID
			FROM Book
			GROUP BY Book.PublicationYear


--Part – B:
--1. List the publishers whose total book prices exceed 500, ordered by the total price.
	SELECT 
		Publisher.PublisherName,
		SUM(Book.Price) AS TOTAL_PRICE 
		FROM Book
		JOIN Publisher
		ON Publisher.PublisherID=Book.PublisherID
		GROUP BY Publisher.PublisherName
		 HAVING SUM(Book.Price)>500
		 ORDER BY SUM(Book.Price)
--2. List most expensive book for each author, sort it with the highest price.
	SELECT 
		Author.AuthorName,
		MAX(Book.Price) AS MOST_EXPENSIVE_BOOK
		FROM Author
		JOIN Book
		ON Author.AuthorID=Book.AuthorID
		GROUP BY Author.AuthorName
		ORDER BY MAX(Book.Price) DESC

--Part – C: Create table as per following schema with proper validation and try to insert data which violate your
--validation.
--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience)
--Dept_info(Did, Dname)
--City_info(Cid, Cname, Did))
--District(Did, Dname, Sid)
--State(Sid, Sname, Cid)
--Country(Cid, Cname)
--2. Insert 5 records in each table.
--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all
--employees.

	