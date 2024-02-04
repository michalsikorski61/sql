SELECT COUNT(amount) AS "today's transactions" FROM transactions; -- num of records in amount column
SELECT MAX(amount) AS "Maximum amount" FROM transactions;
SELECT MIN(amount) AS "Minimum amount" FROM transactions;
SELECT AVG(amount) AS "Average amount" FROM transactions;
SELECT SUM(amount) AS "Summarize amount" FROM transactions;

SELECT * FROM employees;
SELECT CONCAT(first_name," ",last_name) AS full_name FROM employees;