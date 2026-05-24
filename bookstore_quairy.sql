-- create database
	CREATE DATABASE IF NOT EXISTS bookStore;
	USE bookStore;

-- create table Books
	CREATE TABLE IF NOT EXISTS books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    genre VARCHAR(30),
    published_Year INT,
    price DECIMAL(10 , 2 ),
    stock INT
);
    
-- create table Customers
	CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(20),
    city VARCHAR(50),
    country VARCHAR(50)
);

-- create table Orders
	CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers (customer_id),
    book_id INT REFERENCES books (book_id),
    order_date DATE,
    quantity INT,
    total_amount DECIMAL(10 , 2 )
);

SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;

-- Basic Queries

-- 1) Retrieve all books in the "Fiction" genre
	SELECT * FROM books
	WHERE genre = 'Fiction';

-- 2) Find books published after the year 1950
	SELECT * FROM books
	WHERE published_year > 1950;

-- 3) List all customers from the Canada
	SELECT * FROM customers
	WHERE country = 'canada';

-- 4) Show orders placed in November 2023
	SELECT * FROM orders
    WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available
	SELECT SUM(stock) AS Total_Stock FROM books;

-- 6) Find the details of the most expensive book
	SELECT * FROM books
    ORDER BY price DESC
    LIMIT 1;
    
-- 7) Show all customers who ordered more than 1 quantity of a book
	SELECT * FROM orders
    WHERE quantity > 1;
    
-- 8) Retrieve all orders where the total amount exceeds $50+
	SELECT * FROM orders
    WHERE total_amount > 50;

-- 9) List all genres available in the Books table
	SELECT DISTINCT genre FROM books;

-- 10) Find the book with the lowest stock
	SELECT * FROM books
    ORDER BY stock ASC
    LIMIT 1;

-- 11) Calculate the total revenue generated from all orders
	SELECT SUM(total_amount) AS Total_Revenue FROM orders;

-- Advance Queries

-- 1) Retrieve the total number of books sold for each genre
	SELECT b.genre, SUM(o.quantity) AS Total_Book_Sold
    FROM books b 
    JOIN orders o ON b.book_id = o.book_id
    GROUP BY genre;
    
-- 2) Find the average price of books in the "Fantasy" genre
	SELECT genre, AVG(price) AS Avarege_Price FROM books
    WHERE genre = 'Fantasy';

-- 3) List customers who have placed at least 2 orders
	SELECT o.customer_id, c.name, COUNT(o.Order_id) AS ORDER_COUNT
    FROM orders o
	JOIN customers c ON o.customer_id=c.customer_id
	GROUP BY o.customer_id, c.name
	HAVING COUNT(Order_id) >=2;
    
-- 4) Find the most frequently ordered book
	SELECT o.Book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
	FROM orders o
	JOIN books b ON o.book_id=b.book_id
	GROUP BY o.book_id, b.title
	ORDER BY ORDER_COUNT DESC LIMIT 1;
    
-- 5) Show the top 3 most expensive books of 'Fantasy' Genre 
	SELECT title, author, genre, price FROM books
    WHERE genre = 'Fantasy'
    ORDER BY price DESC
    LIMIT 3 ;
-- 6) Retrieve the total quantity of books sold by each author
	SELECT b.author, SUM(o.quantity) AS Total_book_sold 
    FROM books b 
    JOIN orders o ON b.book_id = o.book_id
    GROUP BY author;
    
-- 7) List the cities where customers who spent over $30 are located
	SELECT DISTINCT c.city, total_amount
	FROM orders o
	JOIN customers c ON o.customer_id=c.customer_id
	WHERE o.total_amount > 30;
    
-- 8) Find the customer who spent the most on orders
	SELECT c.name, SUM(o.total_amount) AS total_Spend FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id
    LIMIT 1;
-- 9) Calculate the stock remaining after fulfilling all order
	SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
	FROM books b
	LEFT JOIN orders o ON b.book_id=o.book_id
	GROUP BY b.book_id ORDER BY b.book_id;