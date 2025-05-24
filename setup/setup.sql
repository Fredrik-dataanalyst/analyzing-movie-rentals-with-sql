-- setup.sql
-- Creates the database schema and inserts test data

-- Table for customers
CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  name TEXT
);

-- Table for movies
CREATE TABLE movies (
  movie_id INTEGER PRIMARY KEY,
  title TEXT
);

-- Table for rentals
CREATE TABLE rentals (
  rental_id INTEGER PRIMARY KEY,
  customer_id INTEGER,
  movie_id INTEGER,
  rental_date TEXT,
  return_date TEXT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- Insert customers
INSERT INTO customers (customer_id, name) VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Alice');

-- Insert movies
INSERT INTO movies (movie_id, title) VALUES
  (1, 'Inception'),
  (2, 'Interstellar');

-- Insert rentals
INSERT INTO rentals (rental_id, customer_id, movie_id, rental_date, return_date) VALUES
  (1, 1, 1, '2024-01-01', '2024-01-03'),
  (2, 2, 2, '2024-01-02', '2024-01-04'),
  (3, 1, 2, '2024-01-05', NULL);

