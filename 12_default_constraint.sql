SELECT * FROM products;

INSERT INTO products(product_id,product_name) VALUES
(106,"straw"),
(107,"napkin"),
(108,"fork"),
(109,"spoon");

DELETE FROM products WHERE product_id >= 106;

CREATE TABLE products(
	product_id INT,
    product_name VARCHAR(25),
    price DECIMAL(4,2) DEFAULT 0.00
);

-- IF TABLE EXISTS
ALTER TABLE products ALTER price SET DEFAULT 0.00;


CREATE TABLE transactions(
	transaction_id INT NOT NULL UNIQUE,
    amount DECIMAL(5,2),
    transaction_datetime DATETIME DEFAULT NOW()
);

SELECT * FROM transactions;
INSERT INTO transactions(transaction_id,amount) VALUES(1,4.32),(2,2.22);

INSERT INTO transactions(transaction_id,amount) VALUES(3,1.22);