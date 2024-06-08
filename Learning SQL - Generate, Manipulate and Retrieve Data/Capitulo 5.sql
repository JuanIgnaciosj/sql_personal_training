## Chapter 5 del libro

USE sakila;


## Llenar los espacios blancos obtenidos de la siguiente query
Select
	c.first_name,
    c.last_name,
    a.address,
    ct.city
From customer c
INNER JOIN address a ON a.address_id = c.address_id
INNER JOIN city ct on a.city_id = ct.city_id
WHERE
	a.district = 'California'
    
##Crea una query que devuelva todas las peliculas que tienen un actor que se llame 'JOHN'
Select
	f.title
FROM film f
LEFT JOIN film_actor fa on fa.film_id = f.film_id
LEFT JOIN actor ac on ac.actor_id = fa.actor_id
WHERE
	ac.first_name = 'JOHN';
    
##Crea una query que encuentre todas las direcciones que estan en la misma ciudad

Select
	Distinct
	ad.address
	##ad.*,
    ##ad1.*
FROM address ad
INNER JOIN address ad1 on ad.city_id= ad1.city_id
