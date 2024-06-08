#Todo este codigo es la parte de mis anotaciones para futuras implementaciones.
#Todas las QUERYS indicadas en este archivo fueron ejecutadas por medio de la 
#herramienta MySQL Workbench


#Eliminacion / Creacion /Fijar utilización de la BBDD
drop database if exists curso_sql;
create database if not exists curso_sql;
use curso_sql;

#ALTER TABLE: Permite modificar varios aspectos de la tabla

#Borrar tabla productos
drop table productos;

#Crear Tabla productos
create table productos(
id int unsigned not null,
nombre varchar(50)
);

#Describir estructura de la tabbla
describe productos;

#Agregando un campo ADD
alter table productos add precio int;
alter table productos add cantidad smallint unsigned not null;

#Eliminando un campo (DROP)
alter table productos drop precio;
alter table productos drop precio, drop cantidad;

#Modificar campos de las tablas (MODIFY)

alter table productos modify nombre varchar(100) not null;
alter table productos modify precio decimal(4,2) not null;

#Cambiar el nombre de un campo (CHANGE)
alter table productos change cantidad stock int;
alter table productos change nombre titulop varchar(50) not null;

#Agregando y eliminando PK (ADD-DROP)
alter table productos add primary key(id);
alter table productos add primary key(nombre);
alter table productos modify id int unsigned auto_increment not null;

#Modificación del PK de la tabla productos
alter table productos drop primary key;
alter table productos modify id int unsigned;


#Agregar Indices ADD-DROP INDEX
alter table productos add index i_preciocantida (precio,cantida);
alter table productos drop index i_precicantidad;

#Renombrar una tabla RENAME-TO
alter table producto rename cliente; 
rename table cliente to productos;

rename table productos to auxiliar,
clientes to productos,
auxiliar to clientes;

#Mostrar Tablas
show tables;
