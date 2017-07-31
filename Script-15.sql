CREATE VIEW list_of_customers AS
SELECT customer_id, CONCAT(first_name,"",last_name)AS full_name, address, phone, postal_code, city, country,
IF (active = 1,"Activo","Inactivo")AS status, store_id
FROM customer
INNER JOIN address
USING (address_id)
INNER JOIN city 
USING (city_id)
INNER JOIN country
USING (country_id);

SELECT * FROM list_of_customers;


ALTER VIEW film_details AS
	SELECT film_id, title, description,GROUP_CONCAT(first_name," ",last_name)AS actors
	FROM film
	INNER JOIN film_actor
	USING (film_id)
	INNER JOIN actor 
	USING (actor_id)
	GROUP BY film_id;
	
SELECT * FROM film_details;	



