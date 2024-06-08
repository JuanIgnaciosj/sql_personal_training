-- Capitulo 13

use sakila;

-- 13.1


-- ESTE BUNCH DE CODIGO CONSIDERA QUE NO SE PUEDE ELIMINAR UN CLIENTE SIEMPRE Y CUANDO EXISTA EN LA TABLA DE RENTAS. 
ALTER TABLE rental
ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id)
REFERENCES customer (customer_id) ON DELETE RESTRICT ON UPDATE CASCADE;

-- 13.2

-- CREARIA UN MULTI INDEX EN LA TABLA PAYMENT CON LA FECHA DE PAGO Y EL ID DEL CONSUMIDOR 

ALTER TABLE payment
ADD INDEX idx_payment_date (payment_date);


EXPLAIN 
SELECT
	customer_id, payment_date, amount
FROM payment
WHERE payment_date > cast('2019-12-31 23:59:59' as datetime);

EXPLAIN
SELECT
	customer_id, payment_date, amount
FROM payment
WHERE payment_date > cast('2019-12-31 23:59:59' as datetime)
and amount < 5