## CONSIDERA SOLAMENTE EJERCICIOS YA QUE EL CONTENIDO DEL CAPITULO CONSIDERA SOLO COSAS QUE YA SE ##

##------------------------------------------------------------------
## EJERCICIOS CAPITULO
##------------------------------------------------------------------

USE sakila;

#1

SELECT
	actor_id,
    first_name,
    last_name
FROM actor
order by
	last_name,
    first_name

#2
SELECT
	actor_id,
    first_name,
    last_name
FROM actor
Where
	last_name = 'WILLIAMS'
    or last_name = 'DAVIS'
    
#3

SELECT
    customer_id
FROM rental 
WHERE
	DATE(rental_date) = '2005-07-05'

#4
SELECT
	c.email,
    r.return_date
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE
	DATE(r.rental_date) = '2005-06-14'
ORDER BY
	r.return_date DESC,
    c.email

