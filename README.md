# 📊 SQL Queries and Analysis
This project demonstrates the use of SQL joins, aggregate functions, and common table expressions using a simple movie rental database. Below you'll find screenshots of each query, along with the results and a brief explanation of what each query does and what insights we can extract.

## Query 1 – INNER JOIN: Rentals with Customer and Movie Info
In the first query, I use INNER JOINs to combine the rentals, customers, and movies tables. This allows me to display a complete record of who rented what and when. Since it’s an inner join, it only includes rows where there’s a match in all three tables—meaning the rental must be associated with a valid customer and movie. For example, the output shows that Alice rented Inception on January 1st, 2024.

![Screenshot 2025-05-24 at 17 36 18](https://github.com/user-attachments/assets/e30dbe8d-33af-47d1-ad79-38367c6faf9b)
![Screenshot 2025-05-24 at 17 37 20](https://github.com/user-attachments/assets/01ff82a8-7465-4fed-bb92-93ab8f08b87f)

## Query 2 – LEFT JOIN: All Customers, Including Those Without Rentals
In this query, I perform a LEFT JOIN between customers and rentals. This shows all customers, regardless of whether they’ve rented anything. If a customer hasn’t made any rentals, the rental fields will show NULL. Interestingly, the result shows that there are two different rows with the name Alice, but each with the same customer_id. Thus, the output of the query displays Alice's two different rentals, when rented Inception on 1st of May and The Matrix on 3rd of May. 

![Screenshot 2025-05-24 at 17 39 12](https://github.com/user-attachments/assets/67ffa528-6fc4-416a-8f75-8f7cc37c28f1)
![Screenshot 2025-05-24 at 17 40 09](https://github.com/user-attachments/assets/ff97f9e9-0c67-496f-b43c-20977bd5ad68)

## Query 3 – Simulated FULL OUTER JOIN
SQLite doesn’t support FULL OUTER JOIN directly, so I simulate it using a combination of LEFT JOIN and UNION. I run a LEFT JOIN from customers to rentals, and then another from rentals to customers, and combine the results. This ensures that I include all entries from both tables, even if there’s no matching row in the other table. In this case, the results are similar to the left join above, because every rental has a customer, but the approach is still useful when dealing with incomplete data.

![Screenshot 2025-05-24 at 17 56 36](https://github.com/user-attachments/assets/d111d847-0e42-4f5f-90e5-e8066fe769c6)
![Screenshot 2025-05-24 at 17 57 17](https://github.com/user-attachments/assets/5b9b0bb6-6e75-42f7-9dd4-ae1506e260fa)

## Query 4 – GROUP BY: Count of Rentals per Customer
Next, I count how many rentals each customer has made by grouping the results using GROUP BY. I join customers with rentals and then count the number of rentals for each customer name. One important note is that grouping by name, rather than customer_id, merges customers who share the same name. In this case, Alice is treated as one, even though there could have been two. This shows the importance of grouping by unique IDs in real-world datasets, and not name.

![Screenshot 2025-05-24 at 18 02 19](https://github.com/user-attachments/assets/3018a113-a77a-4e87-9074-02bd669fac34)
![Screenshot 2025-05-24 at 18 03 56](https://github.com/user-attachments/assets/e64cac51-f93c-4ba4-a613-5f74378cf93b)

## Query 5 – CTE: Rentals Lasting More Than Two Days
In the final query, I introduce a Common Table Expression (CTE) called late_rentals. It calculates the number of days each movie was rented by subtracting the rental_date from the return_date. I then filter this to show only rentals that lasted more than two days. The result shows a single record—rental #2 by Bob—indicating that he returned the movie after more than two days. CTEs are useful for breaking down complex logic and making queries more readable.

![Screenshot 2025-05-24 at 18 04 48](https://github.com/user-attachments/assets/3c2ba5d5-20ac-4b14-886b-c216ba78c02b)
![Screenshot 2025-05-24 at 18 05 27](https://github.com/user-attachments/assets/6f72c129-1432-4a81-830b-9fbf75efdd95)
