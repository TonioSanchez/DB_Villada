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

insert  into `employees`(`employeeNumber`,`firstName`,`lastName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 
(1002,'Diane','Murphy','x5800','dmurphy@classicmodelcars.com','1',NULL,'President'),
(1056,'Mary','Patterson','x4611','mpatterso@classicmodelcars.com','1',1002,'VP Sales'),
(1076,'Jeff','Firrelli','x9273','jfirrelli@classicmodelcars.com','1',1002,'VP Marketing');

CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

DELIMITER $$
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
    INSERT INTO employees_audit
    SET action = 'update',
     employeeNumber = OLD.employeeNumber,
        lastname = OLD.lastname,
        changedat = NOW(); 
END$$
DELIMITER ;

UPDATE employees
SET lastName = 'Phan'
WHERE
employeeNumber = 1056;

UPDATE employee SET employeeNumber = employeeNumber - 20;

UPDATE employee SET employeeNumber = employeeNumber + 20;