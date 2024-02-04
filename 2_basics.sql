-- CREATE TABLE employees (
-- 	employee_id INT,
--     first_name varchar(50),
--     last_name VARCHAR(50),
--     hourly_pay DECIMAL(5,2),
--     hire_date DATE
-- );
-- USE mydb;
-- SELECT * FROM employees;
-- RENAME TABLE employees TO workers;
-- RENAME TABLE workers TO employees;
-- DROP TABLE employess;
-- ALTER TABLE employees ADD phone_number VARCHAR(15);
-- SELECT * FROM employees;
-- ALTER TABLE employees RENAME COLUMN phone_number TO email;
-- SELECT * FROM employees;
-- ALTER TABLE employees MODIFY COLUMN email VARCHAR(100);
-- zmiana kolejności kolumn
-- ALTER TABLE employees
-- MODIFY email VARCHAR(100)
-- AFTER last_name;


SELECT * FROM employees;
SELECT email FROM employees;


-- zmiana kolejności
ALTER TABLE employees
MODIFY email VARCHAR(100)
FIRST;

--  DROP A COLUMN
ALTER TABLE employees
DROP COLUMN email;


