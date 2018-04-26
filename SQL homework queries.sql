USE sakila;

SELECT first_name, last_name FROM actor;
SELECT first_name, last_name, concat(first_name," ", last_name) AS Actor_Name
FROM actor;
USE saklia;

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'Joe%';

USE saklia;

SELECT actor_id, first_name, last_name
FROM actor
WHERE upper(first_name) like  'Joe%';

USE sakila;

SELECT last_name, first_name, actor_id
FROM actor
WHERE last_name LIKE '%GEN%';

SELECT last_name, first_name
FROM actor
WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;

SELECT country_id, country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

SELECT last_name, COUNT(*) as A
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) >=2;

UPDATE actor
SET first_name = 'Harpo'
WHERE first_name = 'GROUCHO' AND last_name like 'WILLIAMS';


SELECT last_name, COUNT(last_name) 

FROM actor
GROUP BY last_name;


UPDATE actor
SET first_name = 'Harpo'
WHERE first_name = 'GROUCHO' AND last_name like 'WILLIAMS';
select * 
from actor
where last_name like 'WILLIAMS';

SELECT first_name, last_name, address
FROM staff,address
where staff.address_id = address.address_id;



SELECT title, COUNT(actor_id)
FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
GROUP BY title;

SELECT title, COUNT(inventory_id)
FROM film f
INNER JOIN inventory i 
ON f.film_id = i.film_id
WHERE title = "Hunchback Impossible";

SELECT last_name, first_name, SUM(amount)
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY last_name ASC;

USE Sakila;
SELECT title FROM film
WHERE language_id in
	(SELECT language_id 
	FROM language
	WHERE name = "English" )
	AND (title LIKE "K%") OR (title LIKE "Q%");
    
    use sakila;
select fl.actor_id, ac.first_name, ac.last_name
from actor ac
join film_actor  fl on ac.actor_id = fl.actor_id
join film fm on fl.film_id = fm.film_id

where fm.title like 'Alone Trip' ;

USE Sakila;

SELECT country, last_name, first_name, email
FROM country c
LEFT JOIN customer cu
ON c.country_id = cu.customer_id
WHERE country = 'Canada';

SELECT i.film_id, f.title, COUNT(r.inventory_id)
FROM inventory i
INNER JOIN rental r
ON i.inventory_id = r.inventory_id
INNER JOIN film_text f 
ON i.film_id = f.film_id
GROUP BY r.inventory_id
ORDER BY COUNT(r.inventory_id) DESC;

SELECT store.store_id, SUM(amount)
FROM store
INNER JOIN staff
ON store.store_id = staff.store_id
INNER JOIN payment p 
ON p.staff_id = staff.staff_id
GROUP BY store.store_id
ORDER BY SUM(amount);

SELECT s.store_id, city, country
FROM store s
INNER JOIN customer cu ON s.store_id = cu.store_id
INNER JOIN staff st ON s.store_id = st.store_id
INNER JOIN address a ON cu.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country coun
ON ci.country_id = coun.country_id
WHERE country like 'CANADA%' AND  'AUSTRAILA%';


select sum(payment.amount)as 'sales', category.name
from payment join rental on (rental.rental_id= payment.rental_id)
join inventory on (inventory.inventory_id = rental.inventory_id)
join film_category on (film_category.film_id = inventory.film_id)
join category on (category.category_id = film_category.category_id)

group by category.name
order by sum(payment.amount)desc
limit 5;









