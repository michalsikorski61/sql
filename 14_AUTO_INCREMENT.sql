DROP TABLE transactions;

CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5,2)
);

SELECT * FROM transactions;

INSERT INTO transactions(amount) VALUES(1.99),(2.22);

-- start from diffrent value
ALTER TABLE transactions AUTO_INCREMENT = 1000;

DELETE FROM transactions;
SELECT * FROM transactions;