CREATE TABLE customers(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

SELECT * FROM customers;

INSERT INTO customers(first_name,last_name)
VALUES
("Fred","Fish"),
("Larry","Lobster"),
("Bubble","Bass");

DROP TABLE transactions;

CREATE TABLE transactions(
	transactions_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

SELECT * FROM transactions;

-- drop foreign key
ALTER TABLE transactions DROP FOREIGN KEY transactions_ibfk_1;

ALTER TABLE transactions ADD CONSTRAINT fk_customer_id FOREIGN KEY(customer_id) REFERENCES customers(customer_id); -- you don't need to give a name to foreaign key
16
DELETE FROM transactions;
SELECT * FROM transactions;

ALTER TABLE transactions AUTO_INCREMENT =1000;
INSERT INTO transactions(amount,customer_id) VALUES(4.99,3),(2.33,2),(3.11,1),(1.11,3);

DELETE FROM customers WHERE customer_id = 3;