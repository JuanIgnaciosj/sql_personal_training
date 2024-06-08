## CAPITULO 8

## 1
SELECT
	COUNT(*)
FROM sakila.payment;

## 2
SELECT
	customer_id,
    COUNT(payment_id)
FROM sakila.payment
group by
	customer_id;
    
## 3
SELECT
	customer_id,
    COUNT(payment_id)
FROM sakila.payment
group by
	customer_id
having COUNT(payment_id) > 5;