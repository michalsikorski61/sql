CREATE TABLE products(
	product_id INT,
    product_name VARCHAR(25) UNIQUE,
    price DECIMAL(4,2)
);
DROP TABLE products;
-- if you forget unique

CREATE TABLE products(
	product_id INT,
    product_name VARCHAR(25) ,
    price DECIMAL(4,2)
);

ALTER TABLE products ADD CONSTRAINT UNIQUE(product_name);

SELECT * FROM products;

INSERT INTO products VALUES
(100,"Hamburger",3.99),
(101,"fires",3.99),
(102,"soda",1.00),
(103,"ice cream",1.49);