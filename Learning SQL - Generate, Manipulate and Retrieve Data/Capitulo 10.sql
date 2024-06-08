use sakila;

-- EJERCICIO 10.1 CREACION DE TABLAS NECESARIAS 

CREATE TABLE customers_test(
	Customer_id int,
    Name varchar(50)
);

INSERT INTO customers_test Values(1,'Jonh Smith');
INSERT INTO customers_test Values(2,'Kathy Jones');
INSERT INTO customers_test Values(3,'Greg Oliver');


CREATE TABLE ACCOUNTS (
	Account_id int,
    Customer_id int,
    Account_Name varchar(50),
    Balance int
);

INSERT INTO ACCOUNTS Values(101,1,'Cheking',1044);
INSERT INTO ACCOUNTS Values(102,3,'Savings',522);
INSERT INTO ACCOUNTS Values(103,1,'Line of Credit',9995);



-- 10.1

SELECT
	DISTINCT
	A.Name,
    sum(B.Balance)
FROM customers_test A
LEFT OUTER JOIN ACCOUNTS B ON A.Customer_id = B.Customer_id
GROUP BY
	Name;
    
    
-- 10.2

SELECT
	DISTINCT
	B.Name,
    sum(A.Balance)
FROM ACCOUNTS A 
RIGHT OUTER JOIN customers_test  B ON A.Customer_id = B.Customer_id
GROUP BY
	B.Name;

-- 10.3

SELECT
	ones.num + tens.num
FROM
(
SELECT 0 num UNION ALL
SELECT 1 num UNION ALL
SELECT 2 num UNION ALL
SELECT 3 num UNION ALL
SELECT 4 num UNION ALL
SELECT 5 num UNION ALL
SELECT 6 num UNION ALL
SELECT 7 num UNION ALL
SELECT 8 num UNION ALL
SELECT 9 num 
) ones
CROSS JOIN
(
SELECT 0 num UNION ALL
SELECT 10 num UNION ALL
SELECT 20 num UNION ALL
SELECT 30 num UNION ALL
SELECT 40 num UNION ALL
SELECT 50 num UNION ALL
SELECT 60 num UNION ALL
SELECT 70 num UNION ALL
SELECT 80 num UNION ALL
SELECT 90 num 
) tens
Limit 1000
    




