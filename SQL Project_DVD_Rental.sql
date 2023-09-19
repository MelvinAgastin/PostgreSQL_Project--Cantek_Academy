--- 1. Top 10 most prolific actors based on the number of films they've starred in, providing the actor's ID, full name, and a concatenated list of film titles?
Select * From actor 
Select * From film
Select * From film_actor

With x as
      (Select a.actor_id, 
       Case 
	   When (a.first_name, a.last_name) is null Then null 
	   Else concat(a.first_name,' ',a.last_name) 
       End as actor_name,
	   fa.film_id,
	   f.title    
       From actor a
       Join film_actor fa on fa.actor_id = a.actor_id
       Join film f on f.film_id = fa.film_id
       Group by a.actor_id, fa.film_id, f.title
       Order by a.actor_id)
Select x.actor_id, x.actor_name, Count(x.title) as no_of_films, array_to_string(array_agg(x.title),' | ') as films
From x
Group by x.actor_id, x.actor_name
Order by no_of_films Desc
Limit 10;

--- 2. Film Popularity Analysis: the top 10 most rented films
Select * From film
Select * From rental

Select f.title, Count(r.rental_id) as rental_count, sum(f.rental_rate) as total_rental_rate
from film f
Join inventory i on f.film_id = i.film_id
Join rental r on i.inventory_id = r.inventory_id
Group by f.title
Order by rental_count Desc
Limit 10;
    
--- 3. Customer Segmentation by Rental Frequency:
Select * From payment
Select * From customer

Select rfs.customer_id, rfs.rental_frequency, concat(c.first_name,' ',c.last_name) as customer_name,
      Case 
      When rfs.rental_frequency <= 10 Then 'Low frequency'
      When rfs.rental_frequency <= 30 Then 'Medium frequency'   
      Else 'High frequency'
	  End as Customer_Segment	  
From 
     (Select customer_id, Count(customer_id) as rental_frequency
      From payment
      Group by customer_id
      Order by rental_frequency Desc) as rfs
Join customer c on rfs.customer_id = c.customer_id  
Group by c.customer_id, rfs.customer_id, rfs.rental_frequency
Order by rfs.rental_frequency Desc;

--- 4. Ranking Customers based on their Total Rental Amount:

Select customer_id, total_rental_amount, 
       Rank() Over (Order by total_rental_amount Desc) as customer_rank
From 
    (Select customer_id, sum(amount) as total_rental_amount
     From payment
     Group by customer_id) as customer_totals;

--- 5.Top 10 Film Genre based on the Total Revenue:
Select * From category
Select * From film
Select * From film_category
Select * From payment

Select c.name as film_category, count(f.film_id) as film_count, SUM(p.amount) AS total_revenue
From category c
Join film_category fc on fc.category_id = c.category_id
Join film f on fc.film_id = f.film_id
Join inventory i ON f.film_id = i.film_id
Join rental r ON i.inventory_id = r.inventory_id
Join payment p ON r.rental_id = p.rental_id
Group by film_category
Order by total_revenue Desc
Limit 10;

--- 6. Average Rental Duration by Film Category.
Select * from rental
Select * From category
Select * From film
Select * From film_category

Select fc.category_id, c.name as category_name, 
       Round(Avg(Extract(Day From (r.return_date - r.rental_date))),1) as avg_rental_duration
From film_category fc
Join category c on fc.category_id = c.category_id
Join film f on fc.film_id = f.film_id
Join inventory i ON f.film_id = i.film_id
Join rental r ON i.inventory_id = r.inventory_id
Group by fc.category_id, category_name
Order by avg_rental_duration Desc;

--- 7. Top 15 countries revenue to the DVD store.
Select * from country;
Select * from payment;
Select * from city;
Select * from address;
Select * from customer;

Select (co.country) as country_name, sum(p.amount) as total_revenue, 
       dense_rank() over(Order by sum(p.amount) desc) as rank
From country co
Join city ci on ci.country_id = co.country_id
Join address a on a.city_id = ci.city_id
Join customer c on c.address_id = a.address_id
Join payment p on p.customer_id = c.customer_id
Group by country_name
Order by total_revenue desc;

--- 8.Top 10 Movies, categorized by the Number of Rentals?
Select * From category
Select * from rental

Select c.name as movie_category, count(r.rental_id) as No_of_Rentals
From film_category fc
Join category c on c.category_id = fc.category_id
Join film f on f.film_id = fc.film_id
Join inventory i on i.film_id = f.film_id
Join rental r on r.inventory_id = i.inventory_id
Group by movie_category
Order by No_of_Rentals desc;