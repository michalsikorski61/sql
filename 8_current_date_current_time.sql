CREATE TABLE test(
	my_date DATE,
    my_time TIME,
    my_datetime DATETIME
);

SELECT * FROM test;

INSERT INTO test VALUES(CURRENT_DATE() + 1,CURRENT_TIME(),NOW());

DROP TABLE test;