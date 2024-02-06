-- ON DELETE SET NULL = When a FK is deleted, replace FK with NULL (fk - foreign key)
-- ON DELETE CASCADE = When a FK is deleted, delte row

-- Creating the transactions table with specific columns for managing transaction records.
CREATE TABLE transactions(
    transaction_id INT PRIMARY KEY AUTO_INCREMENT, -- A unique identifier for each transaction that auto-increments.
    amount DECIMAL(5,2), -- The monetary value of the transaction, allowing for two decimal places.
    customer_id INT, -- A reference to the customer making the transaction. This will be linked to the employees table initially, then changed to customers.
    order_date DATE -- The date on which the transaction occurred.
);

-- Setting the starting value of AUTO_INCREMENT for transaction_id to 1000.
-- This means the first entry will start from 1000, making the transaction IDs more readable or meeting specific data entry standards.
ALTER TABLE transactions AUTO_INCREMENT=1000;

-- Inserting sample transaction records into the transactions table.
-- NULL is used for transaction_id to trigger auto-incrementing, and for customer_id in cases where the customer is unknown or not provided.
INSERT INTO transactions VALUES
(null, 2.89, 2, "2023-01-01"),
(null, 3.38, 3, "2023-01-02"),
(null, 4.99, 1, "2023-01-02"),
(null, 1.00, null, "2023-01-03"),
(null, 2.49, 4, "2023-01-03"),
(null, 5.48, null, "2023-01-03");

-- Retrieving all current records from the transactions table for review.
SELECT * FROM transactions;

-- Attempting to retrieve all records from the employees table (though it might not exist yet in this script's sequence).
SELECT * FROM employees;


-- Adding a foreign key constraint to link customer_id in transactions to employee_id in employees.
-- This enforces referential integrity between the two tables, ensuring transactions relate to valid employees.
ALTER TABLE transactions
ADD CONSTRAINT constraint1_fk
FOREIGN KEY (customer_id)
REFERENCES employees(employee_id);

-- Selecting transactions where the customer_id does not match any employee_id in the employees table.
-- This can identify orphaned transactions or data inconsistencies.
SELECT * FROM transactions WHERE customer_id NOT IN (SELECT employee_id FROM employees);

-- Inserting sample employee records into the employees table.
-- This step is necessary for the foreign key constraint to be meaningful, ensuring that transactions can be linked to actual employees.
INSERT INTO employees VALUES
(1, "Jan", "Łasica", 20.00, "cook", "2023-01-02", 5),
(3, "Jan", "Łasica", 20.00, "cook", "2023-01-02", 5),
(2, "Tom", "Maślicki", 20.00, "cook", "2023-01-02", 5),
(4, "Agent", "Flinstone", 20.00, "cook", "2023-01-02", 5);

-- Temporarily disabling foreign key checks to allow operations that might violate foreign key constraints.
-- This is a powerful tool but should be used with caution to avoid corrupting the data integrity.
SET foreign_key_checks = 0;

-- Deleting an employee record. Since foreign key checks are disabled, this deletion will not be blocked by the foreign key constraint.
-- Be cautious as this can leave orphaned references in the transactions table.
DELETE FROM employees WHERE employee_id = 4;

-- Creating the customers table, intended to replace the initial misuse of the employees table for customer data.
-- This table is structured to hold customer-specific information, including a referral system and email addresses.
CREATE TABLE customers(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    referral_id INT,
    email VARCHAR(50)
);

-- Inserting sample customer data into the customers table.
-- This data includes a mix of fields, some of which are left NULL to represent optional information.
INSERT INTO customers (first_name, last_name, referral_id, email) VALUES
('Bryce', 'Robinson', 26, 'xtran@yahoo.com'),
('Michelle', 'Lowe', NULL, 'tpatel@jones-lester.info');
-- Continues with similar insert operations.

-- Displaying all current records from the customers table for review.
SELECT * FROM customers;


-- Creating a new transactions table (named transactions1 here) with a proper foreign key reference to the customers table.
-- This table includes an ON DELETE SET NULL action, which sets the customer_id to NULL if the referenced customer record is deleted.
CREATE TABLE transactions1(
    transaction_id INT PRIMARY KEY,
    amount DECIMAL(5,2),
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    ON DELETE SET NULL
);

-- Removing the initial foreign key constraint linking transactions to employees, preparing for a corrected relationship.
ALTER TABLE transactions DROP FOREIGN KEY constraint1_fk;

-- Adding a new foreign key constraint to correctly link transactions to the customers table.
-- Includes an ON DELETE SET NULL action to handle deletions of referenced customer records gracefully.
ALTER TABLE transactions ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL;

-- Deleting a customer record to demonstrate the ON DELETE SET NULL action.
-- Any transactions linked to this customer will have their customer_id set to NULL.
DELETE FROM customers WHERE customer_id = 4;
SELECT * FROM transactions;

-- Re-inserting a previously deleted customer record for demonstration purposes.
-- In a real scenario, this action might be part of correcting or updating data.
INSERT INTO customers (first_name, last_name, referral_id, email) VALUES
('Jared', 'Thompson', NULL, 'drew61@mcgrath.com');

-- Switching the foreign key constraint action from SET NULL to CASCADE for deletions.
-- This means that deleting a customer will now also delete all related transactions, a stronger action that ensures no orphaned transactions remain.
ALTER TABLE transactions DROP FOREIGN KEY fk_customer_id;

ALTER TABLE transactions ADD CONSTRAINT fk_transact_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

-- Displaying transactions to review the current state and impacts of foreign key actions.
SELECT * FROM transactions;

-- Updating transactions to reassign them to a different customer, demonstrating data manipulation within the foreign key constraints.
UPDATE transactions SET customer_id = 11 WHERE transaction_id IN (1006,1004);
UPDATE transactions SET customer_id = 10 WHERE transaction_id = 1005;

-- Deleting a customer and observing the CASCADE effect, where related transactions are also deleted.
DELETE FROM customers WHERE customer_id = 10;
SELECT * FROM transactions;

-- Inserting a new customer record into the customers table.
-- This operation adds a single new customer named Jared Thompson into the database, with no referral_id provided and specifying an email address.
INSERT INTO customers (first_name, last_name, referral_id, email) VALUES
('Jared', 'Thompson', NULL, 'drew61@mcgrath.com');

-- Preparing to modify the foreign key relationship on the transactions table.
-- The first operation removes an existing foreign key constraint named 'fk_customer_id'.
-- This is necessary to change the foreign key action or to redefine the relationship.
ALTER TABLE transactions DROP FOREIGN KEY fk_customer_id;

-- Adding a new foreign key constraint to the transactions table.
-- This constraint links the customer_id column in transactions to the customer_id in the customers table.
-- The 'ON DELETE CASCADE' action is specified, meaning that deleting a customer will automatically delete all related transactions.
-- This enforces referential integrity by ensuring no transactions are left without a corresponding customer.
ALTER TABLE transactions ADD CONSTRAINT fk_transact_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

-- Retrieving all records from the transactions table to view current data.
-- This could be for verification of the current state before making further changes, especially useful after modifying table constraints.
SELECT * FROM transactions;

-- Updating specific transactions to change their associated customer_id.
-- This modifies the customer_id for transactions with IDs 1006 and 1004 to 11, and for transaction ID 1005 to 10.
-- Such updates might be necessary to correct data or reflect changes in customer information or transaction assignment.
UPDATE transactions SET customer_id = 11 WHERE transaction_id IN (1006,1004);
UPDATE transactions SET customer_id = 10 WHERE transaction_id = 1005;

-- Deleting a customer record from the customers table.
-- With 'ON DELETE CASCADE' in effect, this operation will also automatically delete any transactions associated with the customer_id being deleted.
-- In this case, deleting the customer with customer_id = 10 will remove all transactions linked to this customer, ensuring database integrity.
DELETE FROM customers WHERE customer_id = 10;

