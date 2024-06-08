## CAPITULO 6

## QUERY COMPUESTA, QUE ENCUENTRE EL NOMBRE Y APELLIDO DE TODOS LOS ACTORES Y CLIENTES QUE COMIENCEN CON LA LETRA load

USE sakila;

## 6.2
Select
	first_name,
    last_name
from 
(Select
	first_name,
    last_name
from actor
union
Select
	first_name,
    last_name
from customer) AS A
Where
	A.last_name like 'L%'

## 6.3 
Select
	first_name,
    last_name
from 
(Select
	first_name,
    last_name
from actor
union
Select
	first_name,
    last_name
from customer) AS A
Where
	A.last_name like 'L%'
order by
	last_name asc


    