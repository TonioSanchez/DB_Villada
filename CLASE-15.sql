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




CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`)
);




insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 

(1002,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President'),

(1056,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com','1',1002,'VP Sales'),

(1076,'Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com','1',1002,'VP Marketing');


DELIMITER $$
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
    INSERT INTO employees_audit (action, employeeNumber, lastname, changedat)
                         VALUES ('update', OLD.employeeNumber, OLD.lastname, NOW())DELIMITER $$
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
    INSERT INTO employees_audit (action, employeeNumber, lastname, changedat)
                         VALUES ('update', OLD.employeeNumber, OLD.lastname, NOW())
END$$
DELIMITER ;
END$$
DELIMITER ;