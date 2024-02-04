SELECT * FROM employees;
CREATE TABLE employees(
	employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5,2),
    hire_date DATE,
    CONSTRAINT chk_hourly_pay CHECK (hourly_pay >= 10.00)
);

-- add check to table already exists

ALTER TABLE employees ADD CONSTRAINT chk_hourly_pay CHECK(hourly_pay >= 10.00);

INSERT INTO employees VALUES(7,"Sheldon","Plankton",1.00,"2023-01-03");

DELETE FROM employees WHERE employee_id = 6;

-- DEL A CHECK
ALTER TABLE employees DROP CHECK chk_hourly_pay;