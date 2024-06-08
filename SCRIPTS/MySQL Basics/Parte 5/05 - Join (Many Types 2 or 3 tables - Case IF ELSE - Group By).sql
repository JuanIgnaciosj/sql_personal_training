#Eliminación/Creacion/Uso de la BD
drop database if exists curso_sql;
create database if not exists curso_sql;
use curso_sql;

#Mostrar Tablas
show tables;

#Borrar Tabla productos
drop table productos;

#Creación de tabla productos
create table if not exists productos(
id int unsigned not null auto_increment,
nombre varchar(50) not null,
descripcion text,
proveedorid int unsigned not null,
precio decimal(5,2),
cantidad smallint unsigned default 0,
primary key(id),
unique index (nombre),
foreign key(proveedorid) references proveedor(id)
);

#Describir tabla productos
describe productos;

#Selecciona todos los valores de la tabla
select * from productos;

#Eliminar tabla proveedor
drop table if exists proveedor;

#Crear tabla proveedor
create table if not exists proveedor(
id int unsigned not null auto_increment,
nombre varchar(50),
primary key(id),
unique index (nombre)
);

#Seleccionar todas las entradas de la tabla
select * from proveedor;

#Añadir Valores a la tabla: Proveedor
insert into proveedor (nombre) values('Lenovo');
insert into proveedor (nombre) values('Logitech');
insert into proveedor (nombre) values('Microsoft'); 
insert into proveedor (nombre) values('HP');

#Añadir Valores dentro de la tabla producto
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Lenovo 310', 'La mejor laptop', 1, 100, 50);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Mouse', 'mouse inalambrico', 2, 15.96, 5);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Office 360', 'Paquete de Ofice', 3, 150.69, 30);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('HP Y700', 'La mejor laptop del mercado', 4, 10, 15);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Alfombra Lenovo', 'Alfombras asombrosas', 1, 300, 40);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('laptop HP 1000', 'No funciona muy bien',4 , 500, 3);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Volante Gamer', 'El mejor volante para jugar', 2, 800, 5);
insert into productos(nombre, descripcion, proveedorid, precio, cantidad) 
values('Disco duro', 'Obten mas capacidad', 3, 70, 80);

#Selecciona todas las entradas de las tablas productos Y Proveedor
select * from productos;
select * from proveedor;

#JOIN

#Para consultar cada una de las estructuras de los JOIN utilizar 
#la FastSheet disponible sobre cada uno de los tipos de JOIN en el respositorio

#Estructura del Join basico
#Muestra todos los parametros de ambas tablas
select * from productos
join proveedor
on productos.proveedorid=proveedor.id;

#Estructura del Join para saber el nombre del proveedor
select p.nombre, p.descripcion, p.precio, pro.nombre from productos as p
join proveedor as pro
on p.proveedorid=pro.id;

###---------------------------------------------------

#Left Join | Permite buscar una lista de los productos por proveedor incluso los que no tienen productos || 

select * from proveedor
left join productos
on proveedor.id=productos.proveedorid;

####-----------------------------
#Right join | Permite buscar una lista de los productos por proveedor incluso los que no tienen productos

select * from proveedor
right join productos
on proveedor.id=productos.proveedorid;

####-----------------------------

#Inner Join
#Genera la interseccion de ambos conjuntos

select p.nombre, p.descripcion, p.precio, pro.nombre from proveedor as pro
inner join productos as p
on pro.id=p.proveedorid;

#Straight join

select p.nombre, p.descripcion, p.precio, pro.nombre from proveedor as pro
straight_join productos as p
on pro.id=p.proveedorid;

####-----------------------------

#GROUP BY
#Permite agrupar bajo diferentes parámetros/condiciones

# Cantidad de productos por proveedor
select pro.nombre, count(p.proveedorid) as 'Cantidad de Productos'
from proveedor as pro
join productos as p
on pro.id=p.proveedorid 
group by pro.nombre;


#Calcula el producto con el precio más alto para cada uno de los proveedores
select pro.nombre,p.nombre, max(p.precio) as 'Precio mas alto'
from productos as p
join proveedor as pro
on p.proveedorid=pro.id
group by pro.nombre;


#Calcula el id del proveedor para cada uno de los productos.
select p.nombre, descripcion, precio, proveedorid 
from productos as p
join proveedor as pro
on p.proveedorid=pro.id;

##---------------------------------------------##

#TRABAJANDO CON 3 TABLAS

 drop table if exists libro;
 use curso_sql;
 
 #Crear BD de libros
 create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  primary key (codigo)
 );

#Crea BD de socios
 create table socios(
  documento char(8) not null,
  nombre varchar(30),
  domicilio varchar(30),
  primary key (documento)
 );

#Crea BD para préstamos
 create table prestamos(
  documento char(8) not null,
  codigolibro int unsigned,
  fechaprestamo date not null,
  fechadevolucion date,
  primary key (codigolibro,fechaprestamo)
 );

#Selecciona todos los registros de las tablas socios/prestamos
select * from socios;
select * from prestamos;

#Inserta valores en las tablas/socios/libros/prestamos

 insert into socios values('22333444','Juan Perez','Colon 345');
 insert into socios values('23333444','Luis Lopez','Caseros 940');
 insert into socios values('25333444','Ana Herrero','Sucre 120');

 insert into libros values(1,'Manual de 2º grado','Molina Manuel');
 insert into libros values(25,'Aprenda PHP','Oscar Mendez');
 insert into libros values(42,'Martin Fierro','Jose Hernandez');

 insert into prestamos values('22333444',1,'2016-08-10','2016-08-12');
 insert into prestamos values('22333444',1,'2016-08-15',null);
 insert into prestamos values('25333444',25,'2016-08-10','2016-08-13');
 insert into prestamos values('25333444',42,'2016-08-10',null);
 insert into prestamos values('25333444',25,'2016-08-15',null);
 insert into prestamos values('30333444',42,'2016-08-02','2016-08-05');
 insert into prestamos values('25333444',2,'2016-08-02','2016-08-05');
 
 #Retorna todos los valores dentro de la tabla de prestamos
 select * from prestamos;
 
 #NOMBRE TITULO FECHA PRESTAMO
 # PARA AQUELLOS LIBROS QUE HAYAN SIDO PRESTADOS
 select nombre, titulo, fechaprestamo
 from prestamos as p
 join socios as s
 on s.documento=p.documento
 join libros as l
 on codigolibro=codigo;
 
 #MISMA CONSULTA ANTERIOR
 #CONSIDERA INCLUSO AQUELLOS SOCIOS QUE NO HAN PEDIDO 
 #ALGUN LIBRO DE LA NOMINA

 select nombre, titulo, fechaprestamo
 from prestamos as p
 left join socios as s
 on p.documento=s.documento
 left join libros as l
 on l.codigo=p.codigolibro;
 
#NOMBRE TITULO FECHA PRESTAMO
#DE TODOS AQUELLOS PRESTAMOS QUE INCLUSO NO TENGAN SOCIOS
#CONSIDERANDO LOS LIBROS DE LA NOMINA

select nombre, titulo, fechaprestamo
from prestamos as p
left join socios as s
on p.documento=s.documento
join libros as l
on codigolibro=codigo;
 
 #CONTROL IF CASE
 #Se quiere saber si hay productos de cada proveedor
 
#Entrega el nombre y la cantidad si el proveedor vende almenos un producto
 select pro.nombre,
 if (count(p.proveedorid)>0, 'SI', 'NO') as hay
 from proveedor as pro
 left join productos as p
 on pro.id=proveedorid
 group by pro.nombre;
 
 #Repite la misma query anterior con la diferencia de hacer uso del when
 select pro.nombre,
 case count(p.proveedorid) when 0 then 'NO'
 else 'SI' end as 'Hay'
 from proveedor as pro
 left join productos as p
 on pro.id=proveedorid
 group by pro.nombre;