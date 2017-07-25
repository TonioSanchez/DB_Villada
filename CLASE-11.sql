-- 1)

SELECT country,(SELECT COUNT(city)
				FROM city 
				WHERE city.country_id = country.country_id) AS cities
FROM country
ORDER BY 1;

-- 2)

SELECT country,COUNT(*) num_of_cities
FROM country
	INNER JOIN city USING (country_id)
	GROUP BY country
	HAVING COUNT(*) > 10 
	ORDER BY num_of_cities DESC;
	
	
-- 3)

SELECT first_name, last_name, address, count(*), sum(amount)
FROM customer
	 inner join payment using(customer_id)
	 inner join address using(address_id)
GROUP by first_name, last_name, address;
	 
-- 4)

SELECT title, film_id
FROM film
WHERE film_id NOT IN(SELECT DISTINCT film_id
						FROM inventory);
						
-- 5)						

SELECT title, inventory_id
FROM film
	INNER JOIN inventory USING(film_id)
	LEFT JOIN rental USING(inventory_id)
WHERE rental.rental_id IS NULL;	

