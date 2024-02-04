DROP TABLE transactions;
CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY,
    amount DECIMAL(5,2)
);

SELECT * FROM transactions;

-- if already exists
ALTER TABLE transactions ADD CONSTRAINT PRIMARY KEY(transaction_id);

INSERT INTO transactions VALUES(1003,34.88);
SELECT * FROM transactions;

SELECT amount FROM transactions WHERE transaction_id = 1003;

