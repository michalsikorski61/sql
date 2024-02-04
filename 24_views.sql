-- This statement retrieves all columns from the 'employees' table.
-- It's a simple query that displays every row present in the 'employees' table.
SELECT * FROM employees;

-- This statement creates a new view named 'employee_attendance'.
-- A view is essentially a virtual table created based on the result-set of an SQL statement.
-- Here, the view is created to contain only the 'first_name' and 'last_name' columns from the 'employees' table.
-- You can use this view to quickly access employee attendance data without querying the full 'employees' table each time.
CREATE VIEW employee_attendance AS 
SELECT first_name, last_name 
FROM employees;

-- This statement selects all columns from the 'employee_attendance' view, ordering the results by 'last_name' in ascending order.
-- Since 'employee_attendance' is a view, not a physical table, this operation doesn't affect the underlying data but provides a sorted presentation of the view's data.
SELECT * FROM employee_attendance 
ORDER BY last_name ASC;

-- This statement deletes the 'employee_attendance' view.
-- It's important to note that dropping a view does not affect the underlying tables or data; it merely removes the view definition from the database.
DROP VIEW employee_attendance;


-- This statement alters the 'customers' table by adding a new column named 'email' of type VARCHAR(50).
-- VARCHAR(50) means that the 'email' column can store strings up to 50 characters long.
ALTER TABLE customers 
ADD COLUMN email VARCHAR(50);

-- This statement retrieves all columns from the 'customers' table.
-- Useful for verifying the structure and content of the table after the alteration.
SELECT * FROM customers;

-- These UPDATE statements set the 'email' column for specific customers identified by their 'customer_id'.
-- Each statement updates a single row, setting the 'email' column to a new value based on the condition provided.
UPDATE customers SET email = 'ffish@gmail.com' WHERE customer_id = 1;
UPDATE customers SET email = 'llobster@gmail.com' WHERE customer_id = 2;
UPDATE customers SET email = 'bbass@gmail.com' WHERE customer_id = 3;
UPDATE customers SET email = 'ppuff@gmail.com' WHERE customer_id = 4;
UPDATE customers SET email = 'splankton@gmail.com' WHERE customer_id = 5;

-- This statement creates a view named 'customer_emails' that includes the 'email' column from the 'customers' table.
-- Views can simplify access to specific data subsets, making them handy for frequently used queries.
CREATE VIEW customer_emails AS 
SELECT email 
FROM customers;

-- This statement selects all columns from the 'customer_emails' view.
-- Since the view is based on the 'customers' table's 'email' column, this will display all email addresses.
SELECT * FROM customer_emails;

-- This INSERT INTO statement adds a new row to the 'customers' table.
-- The values provided correspond to the columns in the 'customers' table, including a new email address for the new customer.
-- NULL is used for the missing value, assuming the table's structure allows it.
INSERT INTO customers VALUES(6, 'Pearl', 'Krabs', NULL, 'pkrabs@gmail.com');

-- This statement again selects all columns from the 'customer_emails' view.
-- It shows the updated list of emails, including the one just added for 'Pearl Krabs'.
SELECT * FROM customer_emails;
