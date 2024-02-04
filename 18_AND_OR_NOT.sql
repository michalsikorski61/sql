ALTER TABLE employees
ADD COLUMN job VARCHAR(25) AFTER hourly_pay;
SELECT * FROM employees;

UPDATE employees SET job = 'manager' WHERE employee_id=1;
UPDATE employees SET job = 'cashier' WHERE employee_id=2;
UPDATE employees SET job = 'cook' WHERE employee_id=4;
UPDATE employees SET job = 'assist. manager' WHERE employee_id=5;
UPDATE employees SET job = 'janitor' WHERE employee_id > 5;

INSERT INTO employees VALUES(null,"Patrick","Star",12.34,"cook","2023-01-05");
UPDATE employees SET employee_id = 8 WHERE first_name = "Patrick";

SELECT * FROM employees WHERE hire_date <= "2023-01-5" AND job = "cook";


-- OR
SELECT * FROM employees WHERE job = "cook" OR job = "cashier";
-- not
SELECT * FROM employees WHERE NOT job = "manager" AND NOT job LIKE "%assis%";

-- BETWEEN
SELECT * FROM employees WHERE hire_date BETWEEN "2023-01-05" AND "2023-01-08";

-- IN
SELECT * FROM employees WHERE job IN ("cook","cashier","janitor");
