-- Capitulo 11
use sakila;
-- 11.1

SELECT 
	name,
    CASE WHEN name IN ('English','Italian','French','German') THEN 'latin1' 
	WHEN name IN ('Japanese','Mandarin') THEN 'utf8'
	 ELSE 'unknown'
	End Character_Set
From language;

-- 11.2

SELECT
	rating,
    count(*)
from film
group by 
 rating;
 
 SELECT
	rating,
    SUM(CASE WHEN rating = 'G' THEN 1 ELSE 0 END) 'G',
	SUM(CASE WHEN rating = 'PG' THEN 1 ELSE 0 END) 'PG',
	SUM(CASE WHEN rating = 'PG-13' THEN 1 ELSE 0 END) 'PG-13',
    SUM(CASE WHEN rating = 'R' THEN 1 ELSE 0 END) 'R',
	SUM(CASE WHEN rating = 'NC-17' THEN 1 ELSE 0 END) 'NC-17'
from film
group by 
 rating;
 
