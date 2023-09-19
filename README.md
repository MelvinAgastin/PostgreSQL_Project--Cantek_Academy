# PostgreSQL_Project - Cantek_Academy
An educational project offering hands-on experience in SQL querying and data management, simulating a DVD rental business.
## 📀 DVD Rental Database Project 📀

- **Overview:**
  
  This project is a comprehensive analysis of a DVD rental store database using SQL, aimed at gaining insights into customer behaviour, inventory management, and financial transactions. The database contains tables like 'actors', 'films', 'categories', 'customers', 'rentals', 'payments', etc.
  
- **Objective:** 

   1. Utilize PostgreSQL and implement SQL querying techniques to effectively explore and manipulate the dataset.
   
   2. Apply advanced querying techniques to derive meaningful insights.

- **Table Description:**
  
   * actor – stores actors data including first name and last name
   * film – stores film data such as title, release year, length, rating, etc_
   * film_actor – stores the relationships between films and actors.
   * category – stores film’s categories data.
   * film_category - stores the relationships between films and categories.
   * store – contains the store data including manager staff and address.
   * inventory – stores inventory data.
   * rental – stores rental data.
   * payment – stores customer’s payments.
   * staff – stores staff data.
   * customer – stores customer data.
   * address – stores address data for staff and customers
   * city – stores city names.
   * country – stores country names.

- **Queries Addressed:**

  In this section, we explore key queries that focus on identifying the most prolific actors, segmenting customers based on rental behavior, determining the most rented films, and analyzing customer preferences by film categories within the DVD rental database.
   * Q1 - Top 10 most prolific actors based on the number of films they've starred in, providing the actor's ID, full name, and a concatenated list of film titles?
   * Q2 - Film Popularity Analysis: the top 10 most rented films.
   * Q3 - Customer Segmentation by Rental Frequency.
   * Q4 - Ranking Customers based on their Total Rental Amount.
   * Q5 - Top 6 Film Genre based on the Total Revenue.
   * Q6 - Average Rental Duration by Film Category.
   * Q7 - Top 15 countries revenue to the DVD store.
   * Q8 - Top 10 Movies, categorized by the Number of Rentals.

- **Tool:**
   * PostgreSQL (Version: 16.RC1)
 
- **Dataset:**
   * Download the database from this [Link](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/)
