-- Creation of a new database
-- This command creates a new database named mydb. It's the initial step in organizing our data.
CREATE DATABASE mydb;

-- Selection of the newly created database
-- After creating the database, this command switches the context to the mydb database, so all subsequent operations are performed within this database.
USE mydb;

-- Creation of a table
-- This command creates a new table named 'emploees' (intended to be 'employees'), which includes columns for employee details such as ID, name, pay, job, hire date, and supervisor.
CREATE TABLE emploees(
    employee_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique ID for each employee, auto-increments for new entries
    first_name VARCHAR(25), -- Employee's first name, up to 25 characters
    last_name VARCHAR(25), -- Employee's last name, up to 25 characters
    hourly_pay DECIMAL(2,2), -- Hourly pay, mistakenly limited to 99 cents, will be corrected later
    job VARCHAR(10), -- Job title, limited to 10 characters, will be expanded later
    hire_date DATE, -- Date of hire, in YYYY-MM-DD format
    supervisor_id INT -- ID of the employee's supervisor
);

-- Correcting the table name
-- This command corrects the typo in the table name from 'emploees' to the correct 'employees'.
ALTER TABLE emploees RENAME TO employees;

-- Modifying the structure of the hourly_pay column
-- This command corrects the decimal places for hourly_pay, allowing values up to 9999.99 instead of being incorrectly limited before.
ALTER TABLE employees MODIFY COLUMN hourly_pay DECIMAL(4,2);

-- Expanding the job title column
-- This command alters the 'job' column to allow for longer job titles, expanding the limit from 10 to 14 characters.
ALTER TABLE employees MODIFY COLUMN job VARCHAR(14);

-- Inserting data into the employees table
-- These commands insert records into the employees table for various fictional characters, setting up their employee details.
INSERT INTO employees VALUES
(null, "Squidward", "Tentacles", 15.00, "cashier", "2023-01-03", 5),
(null, "Spongebob", "Squarepants", 12.50, "cook", "2023-01-04", 5),
(null, "Patrick", "Star", 12.50, "cook", "2023-01-05", 5),
(null, "Sandy", "Cheeks", 17.25, "asst. manager", "2023-01-06", 1),
(null, "Sheldon", "Plankton", 10.00, "janitor", "2023-01-07", 5);

-- Retrieving all records from the employees table
-- This command selects and displays all columns for all records in the employees table.
SELECT * FROM employees;

-- Calculating the average hourly pay alongside individual employee details
-- This query selects first name, last name, and hourly pay for each employee, and also calculates the average hourly pay across all employees, displaying this average alongside each employee's details.
SELECT first_name, last_name, hourly_pay,
    (SELECT AVG(hourly_pay) FROM employees) AS avg_pay -- Subquery to calculate the average hourly pay
FROM employees;

-- Filtering employees earning more than the average hourly pay
-- This query selects employees whose hourly pay is above the average across all employees. It demonstrates the use of a subquery to dynamically determine the average hourly pay used in the comparison.
SELECT first_name, last_name, hourly_pay FROM employees WHERE hourly_pay > (
    SELECT AVG(hourly_pay) FROM employees -- Subquery for calculating the average hourly pay to use in the comparison
);

-- Retrieving unique customer IDs from the transactions table
-- This command selects distinct (unique) customer IDs from the transactions table, excluding any null values. It's useful for identifying all customers who have made transactions.
SELECT DISTINCT customer_id FROM transactions WHERE customer_id IS NOT NULL;

-- Selecting customer names based on transactions
-- This query selects the first and last names of customers from the customers table,
-- but only for those customers who have made transactions. This is achieved by using a subquery
-- that fetches distinct customer IDs from the transactions table where the customer_id is not null.
-- The WHERE clause with the IN operator filters the main query's results to include only those customers
-- whose IDs are in the list of IDs returned by the subquery.
SELECT first_name, last_name FROM customers 
WHERE customer_id IN (
    SELECT DISTINCT customer_id FROM transactions WHERE customer_id IS NOT NULL
);
