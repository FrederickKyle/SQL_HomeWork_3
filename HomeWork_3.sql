-- #1 List all customers who live in Texas (use JOIN)
select first_name, last_name, address_id 
from customer 
inner join city
on customer.address_id = city.city_id
where city = 'texas';


-- #2 Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name, customer_id
from customer 
where customer_id in (
	select customer_id  
	from payment 
	group by customer_id 
	having sum(amount) > 6.99
	order by sum(amount) desc 
);

-- #3 Show all customers names who have made payments over $175(use
-- subqueries)
select first_name, last_name
from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount) desc 
);


-- #4 List all customers that live in Nepal (use the city table)
select city
from city
inner join customer 
on city.city = customer.first_name 
where city = 'Nepal';


--#5 Which staff member had the most transactions?
select staff_id, first_name, last_name 
from staff 
where staff_id in (
	select staff_id 
	from rental 
	group by staff_id 
	having count(staff_id) > 0
);


-- #6 How many movies of each rating are there?
select * from movies;

select title, rating 
from film 
where title = 'Taken'
and title = 'The Purge'
and title = 'Nemo'
group by rating, title;


-- #7 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
select customer_id, first_name, last_name
from customer 
where customer_id in(
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 6.99
);


-- #8 How many free rentals did our store give away?
select rental_id 
from rental
where rental_id in(
	select rental_id 
	from payment 
	group by rental_id 
	having sum(amount) = 0
);






























