drop database if exists curso_sql;

create database if not exists curso_sql;

use curso_sql;

#Indice

#Primary
#index
#unique

#show index;

#indice Primary
create table if not exists libro(
id int unsigned auto_increment not null,
titulo varchar(100),
autor varchar(50),
descripcion text,
editorial varchar(15),
primary key(id)
);

use curso_sql;
select * from libros;
show index from libro;
drop table libros;

#tipo index comun
create table if not exists libros(
id int unsigned auto_increment not null,
titulo varchar(100),
autor varchar(50) not null,
descripcion text,
editorial varchar(15) not null,
primary key(id),
index i_autoreditorial (autor,editorial) #Tambien se pueden especificar en lineas separadas.
);
 
show index from libros;
drop table if exists libros;

#tipo unique (unico)
create table if not exists libros(
id int unsigned auto_increment not null,
titulo varchar(100),
autor varchar(50) not null,
descripcion text,
editorial varchar(15) not null,
primary key(id),  
unique uq_titulo(titulo) # En este caso si ingreso un valor que contenga el mismo título no se podría agregar.
);

use curso_sql;
show index from libros;

drop table if exists libros;

insert into libros(titulo, autor, editorial) values('Java en 10 minutos', 'Alejandro', 'La Maravilla');
insert into libros(titulo, autor, editorial) values('Java en 10 minutos', 'Alejandro', 'La Maravilla');
insert into libros(titulo, autor, editorial) values('Java', 'Alejandro', 'La Maravilla'); #Si el titulo fuese igual no podria ingresarlo correctamente

delete from libros where titulo = 'Java en 10 minutos';

select * from libros;

create index i_editorial on libros (editorial);
create unique index uq_titulo on libros (titulo);

#Eliminar un indice
drop index i_autor on libros;
drop index uq_titulo on libros;

create index i_editorial on libros (editorial);
create unique index uq_titulo on libros (titulo);

select * from libros;

create table if not exists productos(
id int unsigned not null,
nombre varchar(50),
precio int unsigned,
primary key(id)
);

describe productos;
use curso_sql;
drop table if exists productos;

#Para agregar un campo
alter table productos add precio int;
alter table productos add cantidad smallint unsigned not null;

#Eliminar campo de una tabla.
alter table productos drop precio, drop cantidad;

describe productos;

#Modificar una tabla 

alter table productos modify nombre varchar(100) not null;
alter table productos modify precio decimal(5,2) not null;

#Cambiar el nombre de un campo
alter table productos change cantidad stock int;
alter table productos change nombre titulo varchar(50) not null;

describe productos;
drop table if exists productos;

#Como añadir un primary key
alter table productos add primary key(id);
alter table productos modify id int unsigned auto_increment not null;

#Para eliminar la primary key
alter table productos drop primary key;
alter table productos modify id int unsigned;

#Agregar eliminar indices de una tabla ADD-DROP- INDEX

alter table productos add index i_precio (precio);
alter table productos drop index i_precio;

show tables;

#Para cambiar el nombre a una tabla

alter table productos rename cliente;
rename table cliente to productos;
