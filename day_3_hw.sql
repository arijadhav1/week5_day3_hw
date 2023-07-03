--Question 1
SELECT *
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'Texas';
--There are 5 customers from Texas


--Question 2
SELECT first_name, last_name
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99;
--There are a total of 1405 payments made from Customers


--Question 3
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING sum(amount) > 175
);
--There are 6 customers with payments over $175


--Question 4
SELECT first_name, last_name, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';
-- Kevin Schuler is the only customer from Nepal

--Question 5
select staff.first_name, staff.last_name, payment.staff_id, COUNT(payment.staff_id)
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY payment.staff_id, staff.first_name, staff.last_name
ORDER BY COUNT(payment.staff_id);
-- Jon Stephens, with the staff_id of 2, has more transactions.


--Question 6
SELECT rating, COUNT(rating)
from film
group by rating;
--"PG": 194, "R": 195, "NC-17": 210, "PG-13": 223, "G": 178


--Question 7
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id, amount
	HAVING amount > 6.99 AND count(customer_id) = 1
);
-- 451 Customers Total


--Question 8
SELECT rental.rental_id, payment.amount
FROM rental
INNER JOIN payment
ON rental.rental_id = payment.rental_id
where amount = 0;
-- 24 Rentals Total







