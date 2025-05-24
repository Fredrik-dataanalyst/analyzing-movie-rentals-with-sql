-- queries.sql
-- SQL queries to demonstrate INNER JOIN, LEFT JOIN, FULL OUTER JOIN, GROUP BY, and CTEs

-- 1. INNER JOIN: List each rental with customer name and movie title
SELECT c.name, m.title, r.rental_date
FROM rentals r
INNER JOIN customers c ON r.customer_id = c.customer_id
INNER JOIN movies m ON r.movie_id = m.movie_id;

-- 2. LEFT JOIN: Show all customers and their rentals (if any)
SELECT
  c.customer_id,
  c.name AS customer_name,
  r.rental_id,
  r.rental_date
FROM customers c
LEFT JOIN rentals r ON c.customer_id = r.customer_id;

-- 3. FULL OUTER JOIN simulation using UNION of two LEFT JOINs
SELECT c.name, r.rental_id
FROM customers c
LEFT JOIN rentals r ON c.customer_id = r.customer_id
UNION
SELECT c.name, r.rental_id
FROM rentals r
LEFT JOIN customers c ON r.customer_id = c.customer_id;

-- 4. GROUP BY: Count the number of rentals per customer
SELECT c.name, COUNT(r.rental_id) AS total_rentals
FROM customers c
LEFT JOIN rentals r ON c.customer_id = r.customer_id
GROUP BY c.name;

-- 5. CTE: Find rentals that lasted more than 2 days
WITH late_rentals AS (
  SELECT
    r.*,
    julianday(return_date) - julianday(rental_date) AS days_rented
  FROM rentals r
  WHERE return_date IS NOT NULL
)
SELECT rental_id, customer_id, days_rented
FROM late_rentals
WHERE days_rented > 2;
