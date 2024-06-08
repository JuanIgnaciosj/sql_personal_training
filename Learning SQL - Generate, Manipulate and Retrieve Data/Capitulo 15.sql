-- Para todo los ejericios se debe considerar la siguiente tabla -- 

use sakila;

-- Creacion de la tabla --
Create Table Sales_Fact(
	year_no int,
    month_no int,
    total_sales int
);

-- Insertar valores -- 

INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2019,1,19228);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2019,2,18554);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2019,3,17325);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2019,4,13221);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2019,5,9964);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2019,6,12658);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2019,7,14233);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2019,8,17342);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2019,9,16853);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2019,10,17121);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2019,11,19095);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2019,12,21436);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2020,1,20347);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2020,2,17434);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2020,3,16225);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2020,4,13853);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2020,5,14589);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2020,6,13248);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2020,7,8728);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2020,8,9378);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2020,9,11467);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2020,10,13842);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2020,11,15742);
INSERT INTO Sales_Fact (year_no,month_no,total_sales) Values (2020,12,18636);

-- Preguntas Capitulo -- 

-- PREGUNTA 1 --

-- Crear una consulta que retorne cada columna de la tabla Sales Fact, y añada una columna para generar un ranking basado
-- en el total de venta Desde el mayor al menor  1 - 24

Select
	year_no,
    month_no,
    rank() over(partition by year_no,month_no order by total_sales desc) ranking
from sakila.Sales_Fact
group by
	year_no,
    month_no
Order by
	total_sales desc








-- Se elimina la tabla 
Drop table Sales_Fact;
