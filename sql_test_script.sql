CREATE TABLE Students (
    StudentID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) UNIQUE NOT NULL,
    Course VARCHAR2(50) NOT NULL
);

CREATE TABLE Books (
    BookID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Title VARCHAR2(200) NOT NULL,
    Author VARCHAR2(100) NOT NULL,
    Genre VARCHAR2(50) NOT NULL
);

CREATE TABLE Librarians (
    LibrarianID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Contact VARCHAR2(50) NOT NULL
);

CREATE TABLE BorrowedBooks (
    BorrowID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    StudentID NUMBER REFERENCES Students(StudentID) ON DELETE CASCADE,
    BookID NUMBER REFERENCES Books(BookID) ON DELETE CASCADE,
    LibrarianID NUMBER REFERENCES Librarians(LibrarianID),
    BorrowDate DATE DEFAULT SYSDATE,
    ReturnDate DATE
);

SELECT table_name FROM user_tables;

INSERT INTO Students (Name, Email, Course) VALUES ('Cesar Libenz', 'cesar.lib@gmail.com.com', 'Computer Science');

INSERT INTO Students (Name, Email, Course) VALUES ('Kiza Moses', 'kiza.moses@gmail.com', 'Information Systems');

INSERT INTO Students (Name, Email, Course) VALUES ('Alice Umutoni', 'alice.muton@gmail.com', 'Data Science');



INSERT INTO Books (Title, Author, Genre, PublishedYear) VALUES ('Newton', 'F. Ferdinanf', 'Fiction', 1935);

INSERT INTO Books (Title, Author, Genre, PublishedYear) VALUES ('Walking Dead', 'Jacob Foster', 'Classic', 1960);

INSERT INTO Books (Title, Author, Genre, PublishedYear) VALUES ('1988', 'Oliver Khan', 'Poem', 1939);

DESC BOOKS;
ALTER TABLE Books ADD PublishedYear NUMBER;
INSERT INTO Books (Title, Author, Genre, PublishedYear) VALUES ('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925);

INSERT INTO Books (Title, Author, Genre, PublishedYear) VALUES ('To Kill a Mockingbird', 'Harper Lee', 'Classic', 1960);

INSERT INTO Books (Title, Author, Genre, PublishedYear) VALUES ('1984', 'George Orwell', 'Dystopian', 1949);


ALTER TABLE Librarians ADD HireDate DATE;

DESC Librarians;
INSERT INTO Librarians (Name, Contact, HireDate) 
VALUES ('Charlie Smith', 'charlie.smith@library.com', TO_DATE('2021-02-20', 'YYYY-MM-DD'));


INSERT INTO BorrowedBooks (StudentID, BookID, BorrowDate, ReturnDate) VALUES (1, 2, TO_DATE('2025-02-20', 'YYYY-MM-DD'), TO_DATE('2025-03-05', 'YYYY-MM-DD'));

INSERT INTO BorrowedBooks (StudentID, BookID, BorrowDate, ReturnDate) VALUES (2, 1, TO_DATE('2025-02-22', 'YYYY-MM-DD'), TO_DATE('2025-03-07', 'YYYY-MM-DD'));

INSERT INTO BorrowedBooks (StudentID, BookID, BorrowDate, ReturnDate) VALUES (3, 3, TO_DATE('2025-02-25', 'YYYY-MM-DD'), TO_DATE('2025-03-10', 'YYYY-MM-DD'));

SELECT * FROM Students;
SELECT * FROM Books;
SELECT * FROM BorrowedBooks;
SELECT * FROM BorrowedBooks;



SELECT s.Name AS Student, b.Title AS Book, l.Name AS Librarian, bb.BorrowDate, bb.ReturnDate 
FROM BorrowedBooks bb
JOIN Students s ON bb.StudentID = s.StudentID
JOIN Books b ON bb.BookID = b.BookID
JOIN Librarians l ON bb.LibrarianID = l.LibrarianID;


SELECT * FROM BorrowedBooks 
WHERE BorrowDate >= SYSDATE - 7;

SELECT b.Title, COUNT(bb.BorrowID) AS BorrowCount 
FROM BorrowedBooks bb
JOIN Books b ON bb.BookID = b.BookID
GROUP BY b.Title
ORDER BY BorrowCount DESC
FETCH FIRST 5 ROWS ONLY;


SELECT s.Name, COUNT(bb.BorrowID) AS TotalBorrowed
FROM BorrowedBooks bb
JOIN Students s ON bb.StudentID = s.StudentID
GROUP BY s.Name
HAVING COUNT(bb.BorrowID) > 3;


















