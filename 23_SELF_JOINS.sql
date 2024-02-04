-- SELF JOIN
-- join another copy of a table to itself
-- used to compare rows of the same table
-- helps to display a heirarchy of data

SELECT * FROM customers;

ALTER TABLE customers
ADD referral_id INT;

UPDATE customers SET referral_id = 1 WHERE customer_id = 2;
UPDATE customers SET referral_id = 2 WHERE customer_id in (3,4,5);

SELECT * FROM customers AS a INNER JOIN customers AS b ON a.referral_id = b.customer_id;
SELECT a.customer_id,a.first_name,a.last_name,CONCAT(b.first_name," " ,b.last_name) AS "referred_by" FROM customers AS a INNER JOIN customers AS b ON a.referral_id = b.customer_id;
SELECT a.customer_id, a.first_name, a.last_name, CONCAT(b.first_name," ",b.last_name) AS "referred_by" FROM customers AS a LEFT JOIN customers AS b ON a.referral_id = b.customer_id;


ALTER TABLE employees ADD supervisor_id INT;
UPDATE employees SET supervisor_id = 5 WHERE employee_id IN (2,3,4,6);
UPDATE employees SET supervisor_id = 5 WHERE employee_id =7;
SELECT * FROM employees;

UPDATE employees SET supervisor_id = 1 WHERE employee_id = 5;

SELECT * FROM employees AS a INNER JOIN employees AS b ON a.supervisor_id = b.employee_id;

SELECT a.first_name,a.last_name, CONCAT(b.first_name," ",b.last_name) AS "reports to" FROM employees AS a INNER JOIN employees AS b ON a.supervisor_id = b.employee_id;

-- if you want show all rows from left table
SELECT a.first_name,a.last_name, CONCAT(b.first_name," ",b.last_name) AS "reports to" FROM employees AS a LEFT JOIN employees AS b ON a.supervisor_id = b.employee_id;

