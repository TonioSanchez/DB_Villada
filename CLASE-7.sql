												
SELECT actor_id, first_name, last_name
	from actor
	where actor_id in (SELECT actor.actor_id
						FROM film_actor, actor, film
						WHERE actor.actor_id = film_actor.film_id
						AND film.film_id = film_actor.film_id
						AND title = 'CATCH AMISTAD');

SELECT title, length
	FROM film f1
	WHERE `length` > ALL (SELECT `length` 
							FROM film f2
							WHERE f2.film_id <> f1.film_id);

SELECT title, length
	FROM film f1
	WHERE NOT `length` <= ANY (SELECT `length` 
							FROM film f2
							WHERE f2.film_id <> f1.film_id);			
							
							
SELECT customer_id, first_name, last_name
	(SELECT MAX(amount)
		FROM payment
		WHERE payment.customer_id = customer.customer_id)AS amount
	FROM customer
	ORDER BY amount DESC,
			customer_id DESC;
			
			
			
