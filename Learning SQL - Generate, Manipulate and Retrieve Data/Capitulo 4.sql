use sakila;

Select
	*
from payment
where
	customer_id in (4,5)
    AND (payment_id between 101 AND 120)
    
## PREGUNTA 1 

Select
	*
from payment
where
	customer_id in (4,5)
    AND (payment_id between 101 AND 120)
    AND  (customer_id <> 5 and (amount > 8 or date(payment_date)= '2005-08-23' ))
    
## PREGUNTA 3

Select
	*
from payment
where
	customer_id in (4,5)
    AND (payment_id between 101 AND 120)
    AND  (customer_id = 5 and (amount > 6 or date(payment_date)= '2005-06-19' ))


## PREGUNTA 3

SELECT
	*
FROM payment
WHERE
	AMOUNT IN (1.98,7.98,9.98)
    
    
## PREGUNTA 4

SELECT
	*
FROM customer
WHERE
	last_name like '_A%A%W'
	