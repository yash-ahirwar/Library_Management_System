-- Library Management Project;

-- tables: books, students, issue_records;

-- Concept used : SELECT, JOIN, WHERE, GROUP BY; 

## first, I'll create a dataset and tables;

CREATE DATABASE library_management;
USE library_management;

CREATE TABLE books(
book_id INT PRIMARY KEY,
title VARCHAR(100),
author VARCHAR(100),
available_copies INT
);

CREATE TABLE student(
student_id INT PRIMARY KEY,
name VARCHAR(100),
department VARCHAR(50)
);

CREATE TABLE issue_records(
issue_id INT PRIMARY KEY,
student_id INT,
book_id INT,
issue_date DATE,
return_date DATE,
FOREIGN KEY (student_id)
REFERENCES student(student_id),
FOREIGN KEY (book_id)
REFERENCES books(book_id)
);

## now, I'll insert data in these tables;

INSERT INTO books VALUES
(1, 'The Housemaid', 'Freida McFadden', 5),
(2, 'Verity', 'Colleen Hoover', 5),
(3, 'That Night', 'Nidhi Upadhyay', 4);

INSERT INTO student VALUES
(101, 'Carmen', 'CS'),
(102, 'Muskan', 'IT'),
(103, 'Anushka', 'CS');

INSERT INTO issue_records VALUES
(01, 101, 1, '2026-04-01', NULL),
(02, 102, 2, '2026-04-02', '2026-04-05'),
(03, 103, 3, '2026-04-03', NULL),
(04, 101, 2, '2026-04-04', '2026-04-09'),
(05, 103, 1, '2026-04-05', NULL),
(06, 101, 1, '2026-04-08', '2026-04-12'),
(07, 102, 2, '2026-04-10', NULL),
(08, 103, 2, '2026-04-13', '2026-04-17'),
(09, 101, 2, '2026-04-15', NULL),
(10, 102, 3, '2026-04-18', NULL);

## we can see all tables from here;
SELECT * FROM student;
SELECT * FROM books;
SELECT * FROM issue_records;

## to see issued books, i'll have to join multiple tables with the help of JOIN command;
## i'll also use alias names for tables;

SELECT s.name, b.title, i.issue_date
FROM issue_records i
JOIN student s ON i.student_id = s.student_id
JOIN books b ON i.book_id = b.book_id;

## to check the non_returned books;

SELECT *
FROM issue_records
WHERE return_date is NULL;

## to check the most issued books;

SELECT b.title, COUNT(*) AS issue_count
FROM issue_records i
JOIN books b ON i.book_id = b.book_id
GROUP BY b.title
ORDER BY issue_count DESC;

## to check which student has issued the most number of books;

SELECT s.name, COUNT(*) AS total_books
FROM issue_records i
JOIN student s ON i.student_id = s.student_id
GROUP BY s.name
ORDER BY total_books DESC;

## to check the available books to issue;

SELECT title, available_copies
FROM books
WHERE available_copies > 0;







