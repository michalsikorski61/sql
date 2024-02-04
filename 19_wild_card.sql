-- wild card characters % _ 

SELECT * FROM employees WHERE last_name LIKE "%c%";

SELECT * FROM employees WHERE first_name LIKE "s%";
SELECT * FROM employees WHERE first_name LIKE "sp%";
SELECT * FROM employees;

-- ONE CHAR
SELECT * FROM employees WHERE first_name LIKE "_h%";


SELECT * FROM employees WHERE job LIKE "_ook";
SELECT * FROM employees WHERE hire_date LIKE "____-__-02";

SELECT * FROM employees WHERE job LIKE"_a%";

