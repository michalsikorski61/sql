-- Displaying all records from the transactions table
-- This command retrieves and displays all rows and columns from the transactions table without any filtering or sorting.
SELECT * FROM transactions;

-- Adding a new column to the transactions table
-- This command adds a new column named 'order_date' of type DATE to the transactions table.
-- It's used to store the date on which each transaction was made.
ALTER TABLE transactions ADD order_date DATE;

-- Updating all records with a default order date
-- This command sets the 'order_date' for all records in the transactions table to '2023-01-01'.
-- It's a bulk operation to initialize the newly added column with a default value.
UPDATE transactions SET order_date = "2023-01-01";

-- Inserting a new record into the transactions table
-- This command adds a new row to the transactions table with specified values for each column.
-- Here, 'null' for 'order_date' indicates that this value will be updated in a subsequent operation.
INSERT INTO transactions VALUES(1005, 1.32, 3, null);

-- Updating specific transactions with new order dates
-- These commands update the 'order_date' for transactions with IDs 1006 and 1005 to '2023-01-03',
-- and for transactions with IDs 1003 and 1002 to '2023-01-02'.
-- It demonstrates conditional updating based on transaction IDs.
UPDATE transactions SET order_date = "2023-01-03" WHERE transaction_id IN (1006, 1005);
UPDATE transactions SET order_date = "2023-01-02" WHERE transaction_id IN (1003, 1002);

-- Aggregating transaction amounts by order date
-- This query calculates the total amount of transactions for each 'order_date'.
-- The GROUP BY clause groups records with the same 'order_date' together, allowing the SUM() function to calculate the total amount for each date.
SELECT SUM(amount), order_date FROM transactions GROUP BY order_date;

-- Counting transactions by order date
-- This query counts the number of transactions for each 'order_date'.
-- Similar to the previous query, it groups records by 'order_date', but uses the COUNT() function to count the number of transactions on each date.
SELECT COUNT(amount), order_date FROM transactions GROUP BY order_date;

-- Summing transaction amounts by customer ID
-- This query calculates the total amount of transactions for each customer.
-- It groups the transactions by 'customer_id', using the SUM() function to aggregate the amount spent by each customer.
SELECT SUM(amount), customer_id FROM transactions GROUP BY customer_id;

-- Finding the maximum transaction amount by customer ID
-- This query identifies the maximum transaction amount for each customer.
-- By grouping the transactions by 'customer_id', the MAX() function finds the highest transaction amount per customer.
SELECT MAX(amount), customer_id FROM transactions GROUP BY customer_id;

-- Counting transactions per customer, filtering by count and non-null customer IDs
-- This query counts the number of transactions for each customer, but only includes customers who have made more than one transaction and have a non-null 'customer_id'.
-- The HAVING clause is used to filter groups created by the GROUP BY clause based on the conditions specified.
SELECT COUNT(amount), customer_id FROM transactions GROUP BY customer_id HAVING COUNT(amount) > 1 AND customer_id IS NOT NULL;
