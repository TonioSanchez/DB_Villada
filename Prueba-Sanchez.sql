SELECT address_id, address, address2, city, 
FROM address
INNER JOIN city
USING (city_id)
INNER JOIN country
USING (country_id)
WHERE country = "United States"
ORDER BY address_id DESC;

