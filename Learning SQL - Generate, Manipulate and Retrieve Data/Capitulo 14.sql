-- CAPITULO 14
use sakila;

-- 14.1 

Select
    A.title,
	C.name,
    E.first_name,
    E.last_name
from film A
INNER JOIN film_category B on A.film_id = B.film_id
INNER JOIN category C on C.category_id = B.category_id
INNER JOIN film_actor D on D.film_id = A.film_id
INNER JOIN actor E on E.actor_id = D.actor_id
WHERE
	E.last_name = 'FAWCETT'

-- De lo anterior sale la vista (no se creo)

-- 14.2

Select
	distinct
    A.country, 
    (SELECT
        sum(amount) tot_payments
    from country F
    left join city B on F.country_id = B.country_id
    left join address C on C.city_id = B.city_id
    left join customer D on D.address_id = C.address_id
    left join payment E on E.customer_id = D.customer_id
    where
		F.country_id = A.country_id
    group by
		F.country
    ) tot_payments
from country A;




