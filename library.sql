-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- ======================
-- Table Creation
-- ======================

-- Authors Table
CREATE TABLE IF NOT EXISTS Authors (
    AuthorID INTEGER PRIMARY KEY,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    Country TEXT
);

-- Books Table
CREATE TABLE IF NOT EXISTS Books (
    BookID INTEGER PRIMARY KEY,
    Title TEXT NOT NULL,
    AuthorID INTEGER,
    Genre TEXT,
    PublishedYear INTEGER,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Members Table
CREATE TABLE IF NOT EXISTS Members (
    MemberID INTEGER PRIMARY KEY,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    Email TEXT UNIQUE,
    Phone TEXT
);

-- Loans Table
CREATE TABLE IF NOT EXISTS Loans (
    LoanID INTEGER PRIMARY KEY,
    BookID INTEGER NOT NULL,
    MemberID INTEGER NOT NULL,
    LoanDate TEXT NOT NULL,
    ReturnDate TEXT,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- ======================
-- Sample Data
-- ======================

-- Authors
INSERT INTO Authors (FirstName, LastName, Country) VALUES ('George', 'Orwell', 'UK');
INSERT INTO Authors (FirstName, LastName, Country) VALUES ('J.K.', 'Rowling', 'UK');
INSERT INTO Authors (FirstName, LastName, Country) VALUES ('Jane', 'Austen', 'UK');

-- Books
INSERT INTO Books (Title, AuthorID, Genre, PublishedYear) VALUES ('1984', 1, 'Dystopian', 1949);
INSERT INTO Books (Title, AuthorID, Genre, PublishedYear) VALUES ('Harry Potter and the Philosopher''s Stone', 2, 'Fantasy', 1997);
INSERT INTO Books (Title, AuthorID, Genre, PublishedYear) VALUES ('Pride and Prejudice', 3, 'Romance', 1813);

-- Members
INSERT INTO Members (FirstName, LastName, Email, Phone) VALUES ('Alice', 'Johnson', 'alice@mail.com', '123456789');
INSERT INTO Members (FirstName, LastName, Email, Phone) VALUES ('Bob', 'Smith', 'bob@mail.com', '987654321');

-- Loans
INSERT INTO Loans (BookID, MemberID, LoanDate) VALUES (1, 1, '2025-09-24');
INSERT INTO Loans (BookID, MemberID, LoanDate) VALUES (2, 2, '2025-09-24');

-- ======================
-- Test Queries
-- ======================

-- List all books
SELECT * FROM Books;

-- List all members
SELECT * FROM Members;

-- Show which member borrowed which book
SELECT Members.FirstName || ' ' || Members.LastName AS MemberName,
       Books.Title AS BookTitle,
       Loans.LoanDate,
       Loans.ReturnDate
FROM Loans
JOIN Members ON Loans.MemberID = Members.MemberID
JOIN Books ON Loans.BookID = Books.BookID;

-- Count total loans per member
SELECT Members.FirstName || ' ' || Members.LastName AS MemberName,
       COUNT(Loans.LoanID) AS TotalLoans
FROM Members
LEFT JOIN Loans ON Members.MemberID = Loans.MemberID
GROUP BY Members.MemberID;

-- Count total books per author
SELECT Authors.FirstName || ' ' || Authors.LastName AS AuthorName,
       COUNT(Books.BookID) AS TotalBooks
FROM Authors
LEFT JOIN Books ON Authors.AuthorID = Books.AuthorID
GROUP BY Authors.AuthorID;
