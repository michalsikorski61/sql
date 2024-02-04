DROP TABLE products;
SELECT * FROM products;
CREATE TABLE products(
	product_id INT,
    product_name VARCHAR(25),
    price DECIMAL(4,2) NOT NULL
);

ALTER TABLE products MODIFY price DECIMAL(4,2) NOT NULL;

SELECT * FROM products;

INSERT INTO products VALUES
(104,"hamburger",3.22),
(105,"fries",1.98),
(102,"soda",1.00),
(103,"ice cream",1.49);


ALTER TABLE products ADD CONSTRAINT UNIQUE(product_id);