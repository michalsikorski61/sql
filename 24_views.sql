-- Views
-- Virtual table based on the result-set of an sql statement
-- The fields in a view are fields from one or more real tables in the database
-- they're not real tables, but can be interacted with as if they were

SELECT * FROM employees;

CREATE VIEW employee_attendance AS SELECT first_name,last_name FROM employees;

SELECT * FROM employee_attendance ORDER BY last_name ASC;

DROP VIEW employee_attendance;


ALTER TABLE customers ADD COLUMN email VARCHAR(50);
SELECT * FROM customers;

UPDATE customers SET email = "ffish@gmail.com" WHERE customer_id = 1;
UPDATE customers SET email = "llobster@gmail.com" WHERE customer_id = 2;
UPDATE customers SET email = "bbass@gmail.com" WHERE customer_id = 3;
UPDATE customers SET email = "ppuff@gmail.com" WHERE customer_id = 4;
UPDATE customers SET email = "splankton@gmail.com" WHERE customer_id = 5;

CREATE VIEW customer_emails AS SELECT email FROM customers;

SELECT * FROM customer_emails;

INSERT INTO customers VALUES(6,"Pearl","Krabs",null,"pkrabs@gmail.com");

SELECT * FROM customer_emails;

