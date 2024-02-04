SELECT * FROM customers ORDER BY last_name DESC LIMIT 1,1; -- limit 1 after the first
SELECT * FROM customers ORDER BY last_name DESC LIMIT 3,1; -- limit 1 after third, in other words, show one row,start from third
SELECT * FROM customers ORDER BY last_name DESC;
-- you can pagination with offset
-- page 1 
SELECT * FROM customers ORDER BY last_name LIMIT 10;
-- page 2 
SELECT * FROM customers ORDER BY last_name LIMIT 10,10; -- START from 10 row, and show 10 rows
