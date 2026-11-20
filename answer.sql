-- Week 1 Database Assignment
-- Topic: Library Management System

-- Create and select the database.
CREATE DATABASE IF NOT EXISTS library_management;
USE library_management;

-- Store information about authors.
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- Store books available in the library.
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    publication_year INT,
    copies_available INT NOT NULL DEFAULT 0,
    author_id INT NOT NULL,
    CONSTRAINT fk_books_author
        FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Store library members.
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20)
);

-- Record each book loan.
CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    CONSTRAINT fk_loans_member
        FOREIGN KEY (member_id) REFERENCES members(member_id),
    CONSTRAINT fk_loans_book
        FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Insert sample authors.
INSERT INTO authors (first_name, last_name) VALUES
    ('George', 'Orwell'),
    ('J. K.', 'Rowling'),
    ('Chinua', 'Achebe');

-- Insert sample books.
INSERT INTO books (title, isbn, publication_year, copies_available, author_id) VALUES
    ('Nineteen Eighty-Four', '9780451524935', 1949, 3, 1),
    ('Harry Potter and the Philosopher''s Stone', '9780747532699', 1997, 5, 2),
    ('Things Fall Apart', '9780385474542', 1958, 2, 3);

-- Insert sample members.
INSERT INTO members (first_name, last_name, email, phone) VALUES
    ('Amina', 'Hassan', 'amina.hassan@example.com', '555-0101'),
    ('Daniel', 'Kim', 'daniel.kim@example.com', '555-0102');

-- Insert sample loans.
INSERT INTO loans (member_id, book_id, loan_date, due_date, return_date) VALUES
    (1, 1, '2026-11-10', '2026-11-24', NULL),
    (2, 3, '2026-11-12', '2026-11-26', NULL);
