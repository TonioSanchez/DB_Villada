
SELECT f1.title, f2.title, f1.length, f1.film_id
FROM film f1, film f2
WHERE f1.length = f2.length AND f1.film_id < f2.film_id
ORDER BY 1 DESC;

-- 1)
SELECT f.title, f.special_features, f.rating
FROM film f
WHERE rating = 'PG-13';

-- 2)
SELECT DISTINCT f.`length` 
FROM film f
ORDER BY 1 DESC;

-- 3)
SELECT title, rental_rate, replacement_cost
FROM film
WHERE replacement_cost BETWEEN 20.00 AND 24.00;

-- 4)
SELECT title, name, rating, special_features
FROM film, category, film_category
WHERE film.film_id = film_category.film_id
AND film_category.category_id = category.category_id
AND special_features LIKE '%Behind the Scenes%';

-- 5)
SELECT title, last_name, first_name
FROM actor, film
WHERE title LIKE '%ZOOLANDER FICTION%'
ORDER BY last_name;

-- 6)
SELECT address , city, country
FROM address, city, country, store
WHERE store.store_id = 1 AND store.address_id = address.address_id AND address.city_id = city.city_id AND
city.country_id = country.country_id
ORDER BY country ASC;

-- 7)
