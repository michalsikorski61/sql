INSERT INTO transactions (amount,customer_id)
VALUES(1.00,NULL);
SELECT * FROM transactions;

INSERT INTO customers (first_name,last_name)
VALUES ("Poppy","Puff");
SELECT * FROM customers;

SELECT * 
FROM transactions INNER JOIN customers -- left inner join right
ON transactions.customer_id = customers.customer_id;  -- select all rows in this tables, that have matching customer_id 

SELECT transaction_id,amount,first_name,last_name
FROM transactions INNER JOIN customers 
ON transactions.customer_id = customers.customer_id;

ALTER TABLE transactions RENAME COLUMN transactions_id TO transaction_id;

-- left join
-- everything from the table on the left, however if matching id there is, join row from the right table
SELECT * 
FROM transactions LEFT JOIN customers
ON transactions.customer_id = customers.customer_id;

-- right join
SELECT *
FROM transactions RIGHT JOIN customers
ON transactions.customer_id = customers.customer_id;