SELECT * FROM employees;

INSERT INTO employees VALUES 
(2,"Squidward","Tentacles",15.00,"2023-01-03"),
(3,"Spongbob","Squarepants",12.50,"2023-01-04"),
(4,"Patrick","Star",12.50,"2023-01-05"),
(5,"Sandy","Cheeks",18.23,"2023-01-06");

-- możesz wymienić kolumny, wtedy tylko wymienione wypełniasz
INSERT INTO employees(employee_id,first_name,last_name) VALUES (6,"Sheldon","Plankton");