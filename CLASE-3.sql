SELECT title, rating,`length`
FROM film
WHERE `length` > 100; 



SELECT title, `length`
FROM film
WHERE `length` BETWEEN 100 AND 120
ORDER BY `length`;

SELECT title, name
FROM film, `language`
WHERE film.language_id = `language`.language_id;

SELECT DISTINCT country, city
FROM address, city, country
WHERE address.city_id = city.city_id
AND city.country_id = country.country_id;

SELECT title, name
FROM film, `language`
WHERE film.language_id = `language`.language_id
AND film.`length` > 100 AND `language`.name = `English`; 


SELECT title, special_features, rental_rate, name
FROM film, film_category, category
WHERE film.film_id = film_category.film_id
AND film_category.category_id = category.category_id
ORDER BY rental_rate; 


SELECT * FROM actor
LIMIT 10;

SELECT *
FROM film
WHERE special_features LIKE '%Trailers%';

SELECT title, description, rental_rate * 15 AS "In Pesos"
FROM film
ORDER BY "In Pesos" DESC;

SELECT name FROM category
WHERE name LIKE 'A%' OR name LIKE 'M%'
UNION
SELECT name FROM category
WHERE name LIKE 'A%' OR name LIKE 'S%';
