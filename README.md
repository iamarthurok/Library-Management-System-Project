# Library Management System

This Library Management System is a database project that manages book lending and tracking within a library. The system keeps track of book copies, borrowers, loans, and branches. This README outlines the structure of the database and provides instructions on how to set up and use the SQL files provided.

## Project Structure

The database consists of the following tables:

- `LIBRARY_BRANCH`: Contains information about the library branches.
- `BORROWER`: Stores details about the borrowers.
- `PUBLISHER`: Holds information about book publishers.
- `BOOKS`: Records details of the books available in the library.
- `BOOK_AUTHORS`: Connects books to their authors.
- `BOOK_COPIES`: Tracks the number of copies of each book in each branch.
- `BOOK_LOANS`: Manages the lending of books to borrowers.

In addition to the tables, there are also stored procedures to simplify common queries:

- `GetCopiesOfTheLostTribeAtSharpstown`: Retrieves the number of copies of "The Lost Tribe" at the "Sharpstown" branch.
- `GetCopiesOfTheLostTribeAtEachBranch`: Retrieves the number of copies of "The Lost Tribe" across all branches.
- `GetBorrowersWithNoBooks`: Lists all borrowers who currently do not have any books checked out.

Contributing

Contributions to this project are welcome. Please fork the repository and submit a pull request with your proposed changes.
