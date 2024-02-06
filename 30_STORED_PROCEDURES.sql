-- Store procedure = is prepared SQL code that you can save, great if there's a query that you write often
--		reduces network traffic
-- 		increases performance
--		secure,admin can grant permission to use
--		increases memory usage of every eonnections
-- Changing the delimiter from the default semicolon (;) to $$.
-- This is necessary to define stored procedures or functions in many SQL environments
-- because it allows the entire procedure definition to be passed to the server as a single statement.
-- The delimiter is temporarily changed so that semicolons can be used within the stored procedure without ending the statement.
DELIMITER $$

-- Creating a new stored procedure named get_customers.
-- This procedure, when called, will execute the SQL query contained within it,
-- which selects and returns all records from the customers table.
CREATE PROCEDURE get_customers()
BEGIN
    SELECT * FROM customers; -- The SQL statement to be executed when the procedure is called.
END $$
-- Resetting the delimiter back to the default semicolon (;).
-- This signals the end of the stored procedure definition and allows normal SQL statement execution to resume.
DELIMITER ;

-- Calling the stored procedure get_customers.
-- This executes the stored procedure, which runs the SELECT statement defined within it,
-- returning all records from the customers table.
CALL get_customers();

-- Dropping the stored procedure get_customers.
-- This command removes the stored procedure from the database.
-- It's used here to clean up and ensure the environment is left without unnecessary procedures,
-- especially useful in scripts meant for demonstration or testing.
DROP PROCEDURE get_customers;

-- ...


-- Changing the delimiter to enable the definition of stored procedures without interference from the standard semicolon delimiter.
DELIMITER $$

-- Creating a stored procedure named 'find_customer' that accepts an integer parameter 'id'.
-- This procedure is designed to select and return all fields from the 'customers' table where the 'customer_id' matches the provided 'id'.
CREATE PROCEDURE find_customer(IN id INT)
BEGIN
    SELECT * FROM customers WHERE customer_id = id; -- The SQL query executed when the procedure is called, filtered by 'customer_id'.
END $$
-- Resetting the delimiter back to the semicolon to end the stored procedure definition and return to normal SQL command parsing.
DELIMITER ;

-- Executing the stored procedure with a specific customer ID.
-- This call searches for and returns information about the customer with an ID of 2.
CALL find_customer(2);

-- Removing the 'find_customer' procedure from the database.
-- This is done to clean up the database by removing the procedure after its use.
DROP PROCEDURE find_customer;

-- Changing the delimiter again for the creation of another stored procedure.
DELIMITER $$

-- Creating a new stored procedure named 'find_customers' with two VARCHAR parameters for the first and last names.
-- This procedure searches the 'customers' table for records where both 'first_name' and 'last_name' match the provided parameters.
CREATE PROCEDURE find_customers(IN f_name VARCHAR(50), IN l_name VARCHAR(50))
BEGIN
    SELECT * FROM customers WHERE first_name = f_name AND last_name = l_name; -- Executes a query filtering customers by their full names.
END $$
-- Resetting the delimiter to the default semicolon to resume standard SQL syntax for subsequent commands.
DELIMITER ;

-- Calling the 'find_customers' stored procedure with specific first and last name arguments.
-- This example searches for customers named Vickie Cameron and returns their records.
CALL find_customers("Vickie", "Cameron");

-- Displaying all records from the customers table.
-- This query is likely used here for verification or demonstration purposes, showing the existing data in the customers table.
SELECT * FROM customers;
