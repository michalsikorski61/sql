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
