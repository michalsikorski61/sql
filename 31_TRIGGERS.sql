-- Trigger = when an event happens, do something
	-- ex. (INSERT,UPDATE,DELETE)
	-- checks data, handles errors, auditing tables

-- Displaying all current records from the employees table.
-- This operation is often performed to review the existing data structure and content before making changes.
SELECT * FROM employees;

-- Adding a new column named 'salary' to the 'employees' table.
-- This column is defined to store decimal values, suitable for representing salary amounts with two decimal places for cents.
-- The 'AFTER hourly_pay' clause specifies that the new 'salary' column should be positioned immediately after the 'hourly_pay' column in the table structure.
ALTER TABLE employees ADD COLUMN salary DECIMAL(10,2) AFTER hourly_pay;

-- Reviewing the updated table structure and data.
-- This second SELECT statement allows us to verify that the 'salary' column has been successfully added to the 'employees' table.
SELECT * FROM employees;



-- Updating the new 'salary' column with calculated values.
-- This operation multiplies the 'hourly_pay' rate by 2080, assuming a full-time work schedule, to estimate annual salary.
-- It applies the calculation to all rows, filling the 'salary' column with these computed values.
UPDATE employees SET salary = hourly_pay * 2080;

-- Displaying the updated table data to verify the correct calculation and population of the 'salary' column.
SELECT * FROM employees;

-- Creating a trigger named 'before_hourly_pay_update'.
-- This trigger is set to activate before any UPDATE operation on the 'employees' table that modifies the 'hourly_pay' column.
-- For each row affected by the update, the trigger automatically recalculates the 'salary' based on the new 'hourly_pay' value, using the same 2080 multiplier.
CREATE TRIGGER before_hourly_pay_update BEFORE UPDATE ON employees FOR EACH ROW SET NEW.salary = (NEW.hourly_pay * 2080);

-- Displaying the list of current triggers defined in the database.
-- This SHOW TRIGGERS command allows us to confirm the creation of the trigger and review its properties.
SHOW TRIGGERS;

-- Performing a test update on the 'employees' table to trigger the automatic 'salary' recalculation.
-- Here, the 'hourly_pay' for the employee with 'employee_id' = 1 is updated to 50.
-- The trigger should detect this update and automatically adjust the 'salary' column for this employee accordingly.
UPDATE employees SET hourly_pay = 50 WHERE employee_id = 1;

-- Displaying the employees table data again to verify the trigger's effect.
-- This final SELECT statement allows us to see the automatic adjustment made to the 'salary' column as a result of the 'hourly_pay' update.
SELECT * FROM employees;


-- repeat
-- Creating a new database named MyDb.
-- This operation initializes a new database which will contain our tables and data.
CREATE DATABASE MyDb;

-- Switching to the MyDb database for subsequent operations.
-- All the following commands will be executed in the context of MyDb.
USE MyDb;

-- Creating a table named employees to store employee data.
-- The table includes various columns for employee details such as IDs, names, pay rates, job titles, hire dates, and supervisor IDs.
CREATE TABLE employees(
    employee_id INT AUTO_INCREMENT PRIMARY KEY, -- A unique identifier for each employee, automatically incremented.
    first_name VARCHAR(50) NOT NULL, -- Employee's first name, cannot be NULL.
    last_name VARCHAR(50) NOT NULL, -- Employee's last name, cannot be NULL.
    hourly_pay DECIMAL(10,2), -- Hourly pay rate with two decimal places for cents.
    salary DECIMAL(10,2), -- Annual salary, also with two decimal places.
    job VARCHAR(20), -- The job title or role of the employee.
    hire_date DATE, -- The date the employee was hired.
    supervisor_id INT -- ID of the employee's supervisor, if any.
);

-- Displaying the current records in the employees table.
-- Initially, this table is empty as we have not inserted any data yet.
SELECT * FROM employees;

-- Inserting data into the employees table.
-- This operation adds records for various employees, specifying details such as names, pay rates, and job titles.
-- Note that either the hourly_pay or salary is provided, not both, indicating differing compensation structures.
INSERT INTO employees (first_name, last_name, hourly_pay, salary, job, hire_date, supervisor_id) VALUES
('John', 'Doe', NULL, 50000.00, 'Manager', '2022-01-10', NULL),
('Jane', 'Smith', 25.50, NULL, 'Developer', '2022-03-15', 1),
('Emily', 'Jones', NULL, 42000.00, 'Designer', '2022-04-01', 1),
('Michael', 'Brown', 30.00, NULL, 'Developer', '2022-05-20', 1),
('Sarah', 'Davis', NULL, 38000.00, 'Support', '2022-06-10', 1),
('James', 'Wilson', 22.00, NULL, 'Intern', '2022-07-15', 2),
('Jennifer', 'Moore', NULL, 45000.00, 'Sales', '2022-08-01', 1),
('Robert', 'Taylor', 28.75, NULL, 'Developer', '2022-09-05', 1),
('Maria', 'Anderson', NULL, 47000.00, 'Marketing', '2022-10-10', 1),
('David', 'Thomas', 27.50, NULL, 'Developer', '2022-11-15', 1);


-- Setting salary to 0 for employees where hourly_pay is not provided.
-- This might be a placeholder operation to ensure all records have a salary value, even if it's just zero.
UPDATE employees SET salary = 0 WHERE hourly_pay IS NULL;

-- Creating a trigger named before_hourly_pay_update.
-- This trigger automatically updates the salary field whenever the hourly_pay field is updated,
-- calculating the annual salary based on a standard 2080 work hours per year.
CREATE TRIGGER before_hourly_pay_update
BEFORE UPDATE ON employees
FOR EACH ROW
SET NEW.salary = (NEW.hourly_pay * 2080);

-- Displaying the list of triggers in the current database.
-- This allows us to verify the successful creation of our trigger.
SHOW TRIGGERS;

-- Reviewing the updated records in the employees table.
-- Useful for checking the state of the table data before and after trigger operations.
SELECT * FROM employees;

-- Triggering the before_hourly_pay_update trigger by updating the hourly_pay.
-- This operation updates the hourly_pay for the employee with ID 1, which should automatically update their salary.
UPDATE employees SET hourly_pay = 50 WHERE employee_id = 1;

-- The trigger's action recalculates and updates the salary based on the new hourly_pay value,
-- demonstrating an automated response to data changes within the table.

-- Updating the hourly_pay for employees with no currently set hourly_pay.
-- This query first identifies employees whose hourly_pay is NULL and sets their hourly_pay to 10.
-- It uses a subquery to select the appropriate employee_ids for this conditional update.
UPDATE employees SET hourly_pay = 10 WHERE employee_id IN (SELECT employee_id FROM employees WHERE hourly_pay IS NULL);

-- Increasing the hourly_pay for all employees by 1.
-- This operation applies a blanket update, enhancing the hourly_pay of every employee in the table, reflecting a general pay raise.
UPDATE employees SET hourly_pay = hourly_pay + 1;

-- Deleting an employee record based on employee_id.
-- This statement removes the employee with an employee_id of 10 from the employees table.
-- It's a straightforward deletion operation that affects only the specified record.
DELETE FROM employees WHERE employee_id = 10;

-- Displaying the current state of the employees table after deletion.
-- This allows verification of the deletion operation's effect on the table data.
SELECT * FROM employees;

-- Creating a trigger named before_hourly_pay_insert.
-- This trigger is designed to automatically calculate and set the salary for a new employee upon insertion,
-- based on the provided hourly_pay value. The calculation assumes a full-time workload of 2080 hours per year.
CREATE TRIGGER before_hourly_pay_insert
BEFORE INSERT ON employees
FOR EACH ROW
SET NEW.salary = (NEW.hourly_pay * 2080);

-- Inserting a new record into the employees table.
-- This insert statement includes a specific employee_id (10), demonstrating manual ID specification.
-- The hourly_pay is provided, while the salary field is left as null, to be automatically calculated by the trigger.
INSERT INTO employees VALUES(10, 'Sheldon', 'Plankton', 10, NULL, 'janitor', '2023-01-07', 5);

-- Displaying the updated employees table to verify the effects of the trigger.
-- The expected result is that Sheldon Plankton's salary has been calculated and set by the before_hourly_pay_insert trigger.
SELECT * FROM employees;

-- Creating the expenses table to track various types of expenses.
CREATE TABLE expenses(
    expense_id INT PRIMARY KEY, -- Unique identifier for each expense entry.
    expense_name VARCHAR(50), -- Name or description of the expense.
    expense_total DECIMAL(10,2) -- Total amount allocated to this expense, with two decimal places for cents.
);
-- Displaying the initial state of the expenses table, which will be empty just after creation.
SELECT * FROM expenses;

-- Inserting initial expense entries with a starting total of 0.
-- These entries represent different categories of expenses the company tracks.
INSERT INTO expenses VALUES
(1, "salaries", 0),
(2, "supplies", 0),
(3, "taxes", 0);
-- Displaying the expenses table after initial entries have been added.
SELECT * FROM expenses;

-- Updating the 'salaries' expense total based on the sum of salaries from the employees table.
-- This assumes the employees table contains a 'salary' column with current salary data for all employees.
UPDATE expenses SET expense_total = (SELECT SUM(salary) FROM employees) WHERE expense_name = "salaries";
-- Displaying the updated state of the expenses table to verify the 'salaries' total has been updated.
SELECT * FROM expenses;

-- Creating a trigger to adjust the 'salaries' expense total downwards after an employee is deleted.
-- The trigger subtracts the salary of the deleted employee from the total 'salaries' expense.
CREATE TRIGGER after_salary_delete
AFTER DELETE ON employees
FOR EACH ROW
UPDATE expenses SET expense_total = expense_total - OLD.salary WHERE expense_name = "salaries";
-- Displaying the expenses table to check it before and after deleting an employee record.
SELECT * FROM expenses;

-- Deleting an employee with the last name "Plankton" to trigger the 'after_salary_delete' trigger.
DELETE FROM employees WHERE last_name = "Plankton";
-- Displaying the expenses table again to show the adjusted 'salaries' expense after the deletion.
SELECT * FROM expenses;

-- Creating a trigger to increase the 'salaries' expense total when a new employee is inserted.
-- This trigger adds the new employee's salary to the total 'salaries' expense.
CREATE TRIGGER after_salary_insert 
AFTER INSERT ON employees
FOR EACH ROW
UPDATE expenses SET expense_total = expense_total + NEW.salary WHERE expense_name = "salaries";

-- Displaying the expenses table to verify its state before inserting a new employee.
SELECT * FROM expenses;
-- Inserting a new employee record triggers 'after_salary_insert', adjusting the 'salaries' expense.
INSERT INTO employees VALUES(10, "Sheldon", "Plankton", 10, NULL, "janitor", "2023-01-01", 5);
-- Showing the updated 'salaries' expense total after the new employee insertion.
SELECT * FROM expenses;

-- Creating a trigger to update the 'salaries' expense total when an employee's salary is updated.
-- It adjusts the 'salaries' total by the difference between the new and old salary values.
CREATE TRIGGER after_salary_update 
AFTER UPDATE ON employees
FOR EACH ROW
UPDATE expenses SET expense_total = expense_total + (NEW.salary - OLD.salary) WHERE expense_name = "salaries";
-- Displaying the expenses table to check the state before any employee salary updates.
SELECT * FROM expenses;

-- Updating an employee's hourly_pay triggers 'after_salary_update', which should adjust the 'salaries' total.
-- Note: This assumes an additional operation or trigger exists to recalculate the 'salary' based on 'hourly_pay'.
UPDATE employees SET hourly_pay = 100 WHERE employee_id = 1;
-- Showing the 'salaries' expense total after the salary update to reflect the change.
SELECT * FROM expenses;

