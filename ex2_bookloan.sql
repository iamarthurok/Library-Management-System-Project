-- creating tables
create table publisher
(
	PublisherName varchar(50) PRIMARY KEY,
	Address varchar(255) NOT NULL,
	Phone varchar(20)
);
create table books
(
	BookID int PRIMARY KEY identity(1,1),
	Title varchar(150) NOT NULL,
	PublisherName varchar(50) NOT NULL
);
create table book_authors
(
	BookID int NOT NULL,
	AuthorName varchar(100) NOT NULL,
	UNIQUE (BookID, AuthorName)
);
create table library_branch
(
	BranchID int PRIMARY KEY identity(1,1),
	BranchName varchar(100) NOT NULL,
	Address varchar(50) NOT NULL
);
create table book_copies
(
	BookID int ,
	BranchID int  NOT NULL,
	Number_Of_Copies SMALLINT NOT NULL CHECK (Number_Of_Copies >=2) DEFAULT 2
	UNIQUE (BookID, BranchID)
);
create table borrower
(
	CardNo varchar(10) PRIMARY KEY,
	Name varchar(100) NOT NULL,
	Address varchar(255) NOT NULL,
	Phone varchar(20)
);
create table book_loans
(
	BookID int NOT NULL,
	BranchID int NOT NULL,
	CardNo varchar(10) NOT NULL,
	DateOut date NOT NULL,
	DateDue date NULL,
	UNIQUE (BookID, BranchID,CardNo, DateOut)
);

-- Adding foreign key to books table referencing publisher table
ALTER TABLE books
ADD CONSTRAINT fk_books_publisher FOREIGN KEY (PublisherName)
REFERENCES publisher(PublisherName);
-- Adding foreign key to book_authors table referencing books table
ALTER TABLE book_authors
ADD CONSTRAINT fk_book_authors_books FOREIGN KEY (BookID)
REFERENCES books(BookID);
-- Adding foreign key to book_copies table referencing books table
ALTER TABLE book_copies
ADD CONSTRAINT fk_book_copies_books FOREIGN KEY (BookID)
REFERENCES books(BookID);
-- Adding foreign key to book_copies table referencing library_branch table
ALTER TABLE book_copies
ADD CONSTRAINT fk_book_copies_library_branch FOREIGN KEY (BranchID)
REFERENCES library_branch(BranchID);
-- Adding foreign key to book_loans table referencing books table
ALTER TABLE book_loans
ADD CONSTRAINT fk_book_loans_books FOREIGN KEY (BookID)
REFERENCES books(BookID);
-- Adding foreign key to book_loans table referencing library_branch table
ALTER TABLE book_loans
ADD CONSTRAINT fk_book_loans_library_branch FOREIGN KEY (BranchID)
REFERENCES library_branch(BranchID);
-- Adding foreign key to book_loans table referencing borrower table
ALTER TABLE book_loans
ADD CONSTRAINT fk_book_loans_borrower FOREIGN KEY (CardNo)
REFERENCES borrower(CardNo);
GO


-- inserting data

-- A inserting to library_branch. One of the BranchName is 'Sharpstown'
INSERT INTO library_branch (BranchName, Address)
VALUES
    ('Main Library', '123 Main St'),
    ('Downtown Branch', '456 Elm St'),
    ('Westside Library', '789 Oak St'),
    ('Northside Branch', '101 Pine St'),
    ('East End Library', '202 Maple St'),
    ('Sharpstown', '555 Sharpstown Blvd');
	
-- B inserting 8 rows to table Borrower
INSERT INTO Borrower (CardNo, Name, Address, Phone)
VALUES
    ('123456', 'John Doe', '123 Main St', '555-1234'),
    ('234567', 'Jane Smith', '456 Elm St', '555-5678'),
    ('345678', 'Alice Johnson', '789 Oak St', '555-9012'),
    ('456789', 'Bob Williams', '101 Pine St', '555-3456'),
    ('567890', 'Emma Brown', '202 Maple St', '555-7890'),
    ('678901', 'Michael Davis', '303 Cherry St', '555-2345'),
    ('789012', 'Olivia Garcia', '404 Cedar St', '555-6789'),
    ('890123', 'William Martinez', '505 Walnut St', '555-1230');

-- C inserting 10 rows to table Publisher
INSERT INTO Publisher (PublisherName, Address, Phone)
VALUES
    ('Penguin Random House', '1745 Broadway, New York, NY 10019', '212-782-9000'),
    ('HarperCollins Publishers', '195 Broadway, New York, NY 10007', '212-207-7000'),
    ('Simon & Schuster', '1230 Avenue of the Americas, New York, NY 10020', '212-698-7000'),
    ('Hachette Book Group', '1290 Avenue of the Americas, New York, NY 10104', '212-364-1100'),
    ('Macmillan Publishers', '120 Broadway, New York, NY 10271', '646-307-5151'),
    ('Scholastic Corporation', '557 Broadway, New York, NY 10012', '212-343-6100'),
    ('Pearson plc', '80 Strand, London WC2R 0RL, United Kingdom', '+44 (0)20 7010 2000'),
    ('Oxford University Press', 'Great Clarendon Street, Oxford OX2 6DP, United Kingdom', '+44 (0)1865 556767'),
    ('Cambridge University Press', 'University Printing House, Shaftesbury Road, Cambridge CB2 8BS, United Kingdom', '+44 (0)1223 358331'),
    ('Harvard University Press', '79 Garden St, Cambridge, MA 02138', '617-495-2600');

-- D inserting to books. One of the Title is 'The Lost Tribe'
INSERT INTO books (Title, PublisherName)
VALUES
    ('The Lost Tribe', 'HarperCollins Publishers'),
    ('To Kill a Mockingbird', 'HarperCollins Publishers'),
    ('The Great Gatsby', 'Simon & Schuster'),
    ('Pride and Prejudice', 'Penguin Random House'),
    ('The Catcher in the Rye', 'Hachette Book Group'),
    ('Brave New World', 'Macmillan Publishers'),
    ('The Hobbit', 'HarperCollins Publishers'),
    ('Lord of the Flies', 'Penguin Random House'),
    ('The Lord of the Rings', 'Penguin Random House'),
    ('Animal Farm', 'Penguin Random House'),
    ('Harry Potter and the Philosopher''s Stone', 'Scholastic Corporation'),
    ('The Da Vinci Code', 'Penguin Random House'),
    ('To the Lighthouse', 'Penguin Random House'),
    ('War and Peace', 'Penguin Random House'),
    ('Moby-Dick', 'HarperCollins Publishers'),
    ('The Adventures of Huckleberry Finn', 'Penguin Random House'),
    ('Frankenstein', 'Hachette Book Group'),
    ('One Hundred Years of Solitude', 'Penguin Random House'),
    ('The Grapes of Wrath', 'Penguin Random House'),
    ('The Odyssey', 'HarperCollins Publishers');

-- E inserting 10 rows to table Book_authors. (eg. John Doe has written more than one book)
INSERT INTO book_authors (BookID, AuthorName)
VALUES
    (1, 'John Doe'),
    (2, 'John Doe'),
    (3, 'F. Scott Fitzgerald'),
    (4, 'Jane Austen'),
    (5, 'J.D. Salinger'),
    (6, 'Aldous Huxley'),
    (7, 'J.R.R. Tolkien'),
    (8, 'William Golding'),
    (9, 'J.R.R. Tolkien'),
    (10, 'George Orwell');

-- F inserting rows to table book_copies
INSERT INTO book_copies (BookID, BranchID, Number_Of_Copies)
VALUES
    -- book 1
    (1, 1, 5),
    (1, 3, 8),
    (1, 5, 2),
    (1, 6, 7),
    -- book 2
    (2, 1, 9),
    (2, 2, 4),
    (2, 4, 3),
    (2, 5, 5),
    -- book 3
    (3, 1, 10),
    (3, 4, 2),
    (3, 5, 9),
    (3, 6, 6),
    -- book 4
    (4, 1, 3),
    (4, 2, 2),
    (4, 3, 7),
    -- book 5
    (5, 4, 4),
    (5, 5, 5),
    (5, 6, 9),
    -- book 6
    (6, 1, 8),
    (6, 5, 2),
    (6, 6, 10),
    -- book 7
    (7, 1, 2),
    (7, 2, 2),
    -- book 8
    (8, 1, 6),
    (8, 5, 4),
    (8, 6, 9),
    -- book 9
    (9, 1, 3),
    (9, 2, 5),
    -- book 10
    (10, 5, 7),
    (10, 6, 3),
    -- book 11
    (11, 5, 9),
    (11, 6, 6),
    -- book 12
    (12, 1, 2),
    -- book 13
    (13, 6, 8),
    -- book 14
    (14, 2, 10),
    -- book 15
    (15, 4, 5),
    -- book 16
    (16, 1, 4),
    (16, 2, 6),
    (16, 3, 7),
    (16, 4, 8),
    (16, 5, 3),
    (16, 6, 9),
    -- book 17
    (17, 1, 5),
    (17, 6, 6),
    -- book 18
    (18, 1, 10),
    (18, 3, 4),
    (18, 5, 7),
    -- book 19
    (19, 1, 2),
    (19, 5, 2),
    (19, 6, 6),
    -- book 20
    (20, 5, 4),
    (20, 6, 7);

-- G inserting rows to table book_loans
-- G inserting rows to table book_loans
INSERT INTO book_loans (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (1, 1, '123456', '2024-02-01', '2024-02-15');
INSERT INTO book_loans (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (2, 2, '234567', '2024-02-02', '2024-02-16');
INSERT INTO book_loans (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (3, 3, '345678', '2024-02-03', '2024-02-17');
INSERT INTO book_loans (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (4, 4, '456789', '2024-02-04', '2024-02-18');
INSERT INTO book_loans (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (5, 5, '567890', '2024-02-05', '2024-02-19');
INSERT INTO book_loans (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (6, 6, '678901', '2024-02-06', '2024-02-20');
INSERT INTO book_loans (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (7, 1, '123456', '2024-02-07', '2024-02-21');
INSERT INTO book_loans (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (8, 2, '234567', '2024-02-08', '2024-02-22');
INSERT INTO book_loans (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (9, 3, '345678', '2024-02-09', '2024-02-23');
INSERT INTO book_loans (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (10, 4, '456789', '2024-02-10', '2024-02-24');


-- QUERIES
/* Using a FULL OUTER JOIN on these three tables, you can check which BookID belongs to which branch,
borrower's card number, publisher, the date the book was borrowed, and the due date. */
SELECT *
FROM (
    (book_loans
    FULL OUTER JOIN borrower ON book_loans.CardNo = borrower.CardNo)
    FULL OUTER JOIN books ON book_loans.BookID = books.BookID
);
-- Using created database, write a query that will return all book titles and authors' names.
SELECT books.Title, book_authors.AuthorName
FROM books
INNER JOIN book_authors ON books.BookID = book_authors.BookID;

-- STORED PROCEDURES
-- A "How many copies of the book titled 'Lost Tribe' are held by the library branch named 'Sharpstown'?"
IF (select COUNT(*) from sys.procedures where name = 'GetBookCopiesCount') <> 0
DROP PROCEDURE GetBookCopiesCount;
GO
CREATE PROCEDURE GetBookCopiesCount
    @BookTitle NVARCHAR(150),
    @BranchName NVARCHAR(100)
AS
BEGIN
    -- Turn off row count to prevent extra result sets
    SET NOCOUNT ON;
    -- Declare variables to store BookID and BranchID
    DECLARE @BookID INT;
    DECLARE @BranchID INT;
    -- Get the BookID based on the book title
    SELECT @BookID = BookID
    FROM books
    WHERE Title = @BookTitle;
    -- Get the BranchID based on the branch name
    SELECT @BranchID = BranchID
    FROM library_branch
    WHERE BranchName = @BranchName;
    -- Count the number of copies
    SELECT SUM(Number_Of_Copies)
    FROM book_copies
    WHERE BookID = @BookID
    AND BranchID = @BranchID;
END;
GO
-- EXEC GetBookCopiesCount 'The Lost Tribe', 'Sharpstown';

-- B "How many copies of the book titled 'Lost Tribe' does each branch of the library have?"
IF (select COUNT(*) from sys.procedures where name = 'GetBookCopiesPerBranch') <> 0
DROP PROCEDURE GetBookCopiesPerBranch;
GO
CREATE PROCEDURE GetBookCopiesPerBranch
    @BookTitle NVARCHAR(150)
AS
BEGIN
    SET NOCOUNT ON;
    -- Create a temporary table to store the results
    CREATE TABLE #BranchCopies (
        BranchName NVARCHAR(100),
        CopiesCount INT
    );
    -- Insert data into the temporary table using a SELECT statement
    INSERT INTO #BranchCopies (BranchName, CopiesCount)
    SELECT lb.BranchName, SUM(bc.Number_Of_Copies) AS AmntOfCopies
    FROM library_branch lb
    LEFT JOIN book_copies bc ON lb.BranchID = bc.BranchID
    LEFT JOIN books b ON bc.BookID = b.BookID
    WHERE b.Title = @BookTitle
    GROUP BY lb.BranchName;
    -- Select data from the temporary table
    SELECT * FROM #BranchCopies;
    -- Drop the temporary table
    DROP TABLE #BranchCopies;
END;
GO
-- EXEC GetBookCopiesPerBranch 'The Lost Tribe';

-- C procedure that retrieves the names of all borrowers who have not borrowed any books.
IF (select COUNT(*) from sys.procedures where name = 'GetBorrowersWithNoBooks') <> 0
DROP PROCEDURE GetBorrowersWithNoBooks;
GO
CREATE PROCEDURE GetBorrowersWithNoBooks
AS
BEGIN
    SET NOCOUNT ON;

    SELECT b.Name
    FROM borrower b
    WHERE NOT EXISTS (
        SELECT 1
        FROM book_loans bl
        WHERE bl.CardNo = b.CardNo
    );
END;
GO
-- EXEC GetBorrowersWithNoBooks;