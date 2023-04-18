select * from country
limit 5;


--COUNT THE NUMBER OF CUSTOMERS IN CUSTOMER TABLE 
select count(*) from customer;

--COUNT THE NUMBER OF Stores
select count(*) from store;

--MAX AND MIN PAYMENT DATA
select min(payment_date) Min_Payment, max(payment_date) Max_Payment
from payment;

--JOINS TO EXTRACT INFORMATION
select p.payment_id, p.rental_id, p.amount, r.inventory_id, i.film_id, f.title  from payment as p
JOIN rental as r 
ON p.rental_id = r.rental_id
JOIN inventory as i
ON  r.inventory_id =  i.inventory_id
JOIN film as f 
ON i.film_id = f.film_id;
--ORDER BY p.payment_id DESC
--WHERE p.payment_id = 17505



--JOINS TO EXTRACT REVENUE OF EACH FILM
select f.title, SUM(p.amount) as total  from payment as p
JOIN rental as r 
ON p.rental_id = r.rental_id
JOIN inventory as i
ON  r.inventory_id =  i.inventory_id
JOIN film as f 
ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY total DESC;


--JOIN TO FIND REVENUE BY CITY
select SUM(p.amount) as Total_revenue, city from payment as p
JOIN customer as s
ON p.customer_id = s.customer_id
JOIN address as a
ON s.address_id = a.address_id
JOIN city as c
ON a.city_id = c.city_id
GROUP BY city
ORDER BY total_revenue DESC
