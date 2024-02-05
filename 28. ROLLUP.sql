-- Aggregating transaction amounts by order date with a grand total
-- This query calculates the total amount of transactions for each 'order_date' and also includes a grand total of all transactions at the end.
-- The ROLLUP modifier extends the GROUP BY clause to produce an extra row representing the sum of all grouped rows, effectively giving a super-aggregate value.
SELECT SUM(amount), order_date FROM transactions GROUP BY order_date WITH ROLLUP;

-- Counting transactions by order date with a grand total
-- Similar to the previous query, this one counts the number of transactions for each 'order_date', including a final row with the total count of all transactions.
-- The use of ROLLUP here again provides a super-aggregate total count.
SELECT COUNT(transaction_id), order_date FROM transactions GROUP BY order_date WITH ROLLUP;

-- Displaying all records from the transactions table
-- This command retrieves and displays all rows and columns from the transactions table, providing a complete view of the data without any aggregation or filtering.
SELECT * FROM transactions;

-- Counting transactions by order date with a grand total (repeated)
-- This query is repeated from earlier, counting the number of transactions for each order date, with ROLLUP adding a total count at the end.
SELECT COUNT(transaction_id), order_date FROM transactions GROUP BY order_date WITH ROLLUP;

-- Counting transactions per customer with a total count
-- This query counts the number of transactions for each customer, including an additional row at the end that shows the total number of transactions across all customers.
-- By using ROLLUP with GROUP BY customer_id, it offers a summary count along with individual counts per customer.
SELECT COUNT(transaction_id) AS "# of orders", customer_id FROM transactions GROUP BY customer_id WITH ROLLUP;

-- Summing hourly pay by employee with a total sum
-- This query calculates the total hourly pay for each employee and also provides a grand total of hourly pay for all employees.
-- GROUP BY employee_id WITH ROLLUP generates a summary row showing the overall sum, in addition to individual employee totals.
SELECT SUM(hourly_pay) AS "hourly pay", employee_id FROM employees GROUP BY employee_id WITH ROLLUP;

-- Displaying all records from the employees table
-- This command shows all data from the employees table, allowing for a detailed view of each employee's record, including their IDs, names, hourly pay, etc.
SELECT * FROM employees;
