USE sakila;

Select
	A.customer_id,
    A.first_name,
    A.last_name,
    C.city,
    sum(D.amount),
    count(*)
    ##D.*,
    ##A.*,
    ##B.*,
    ##C.*
from customer A
INNER JOIN address B on A.address_id = B.address_id
INNER JOIN city C on C.city_id = B.city_id
INNER JOIN payment D on D.customer_id = A.customer_id
group by
	A.customer_id,
    C.city;
    
## CAPITULO 9 

## 9.1 

Select
	f.*,
    fc.*
FROM film as f
INNER JOIN film_category as fc on f.film_id = fc.film_id
INNER JOIN (SELECT category_id FROM category WHERE name = "Action") as cat
on cat.category_id = fc.category_id

## 9.2

SELECT
	f.*,
    fc.*
FROM film as f
INNER JOIN film_category as fc on fc.film_id = f.film_id
WHERE 
(SELECT
		category_id
	FROM category c
	WHERE
		name = 'Action'
        and fc.category_id = c.category_id 
)
 
## 9.3 Revisar bien esta query por que ha sido la que mas me ha costado.

Select
	actor.actor_id,
    actor.N_Peliculas,
    tipo_actor.level
FROM
(SELECT
    fa.actor_id,
    count(ac.actor_id) as N_Peliculas
FROM film_actor as fa
INNER JOIN actor as ac on fa.actor_id = ac.actor_id
group by
    fa.actor_id	
) as actor
INNER JOIN 
(
SELECT 'Hollywood Star' level, 30 min_roles, 99999 max_roles 
UNION ALL 
SELECT 'Prolific Actor' level, 20 min_roles, 29 max_roles 
UNION ALL 
SELECT 'Newcomer Actor' level, 1 min_roles, 19 max_roles
) as tipo_actor
on (actor.N_Peliculas BETWEEN tipo_actor.min_roles and tipo_actor.max_roles)














(SELECT a.max_roles FROM (SELECT 'Hollywood Star' level, 30 min_roles, 99999 max_roles UNION ALL SELECT 'Prolific Actor' level, 20 min_roles, 29 max_roles UNION ALL SELECT 'Newcomer Actor' level, 1 min_roles, 19 max_roles) a 
where
	
    





