#Todo este codigo es la parte de mis anotaciones para futuras implementaciones.
#Todas las QUERYS indicadas en este archivo fueron ejecutadas por medio de la 
#herramienta MySQL Workbench

#Crear Bases de datos
create database if not exists curso_sql;  
use curso_sql;

#Eliminar la base de datos ya existente
Drop database if exists curso_sql;
Drop database curso;
show databases; #Mostrar Bases de datos

#Creacion de una tabla
create table if not exists usuario(
nombre varchar (50),
apellido varchar (50),
correo varchar (50),
primary key (nombre)
);

#Describe la composición de la tabla (Nombre campo,tipo,Null,Key,default value)
describe usuario;


#Insertar entrada em la tabla
insert into usuario values ('Nombre','Apellido', 'correo@dominio.com');
insert into usuario values ('Nombre_1','Apellido_1', 'correo@dom.com');

#Seleccionar todos los registros de una tabla.
select * from usuario;

#Crea tabla de nombre producto 
create table if not exists producto (
id int(10) auto_increment,
producto varchar(50),
descripcion  text,
precio float(11,2),
primary key (id)
);

#Inserta registros en la tabla producto
insert into producto values(null,'laptop','laptop rojo',99999);
insert into producto values(null,'mouse','laptop rojo',55.5);

#Describe la tabla producto
describe producto;
select * from producto;

#Elimina todos los registros de la tabla productos (eliminando el comando autoincremental)
truncate table producto;

#Crea tabla persona
create table persona(
id integer unsigned not null,
nombre varchar (50),
edad integer unsigned,
primary key (id)
);

#Describe tabla persona
describe persona;

#Crea tabla libros
create table if not exists libros(
id int(6) zerofill auto_increment,
titulo varchar(40) not null,
editorial varchar (15),
autor varchar(30) default 'Desconocido',
precio decimal(5,2) unsigned default 8.25,
cantidad mediumint unsigned not null,
primary key(id)
);
 
#Describir tabla libros
describe libros;

#Insertar registros en la tabla
insert into libros(titulo,editorial,autor,precio,cantidad) values('C# en una hora','Udemy','Miguel',15.2,50);
insert into libros(titulo,editorial,autor,cantidad) values ('Java','SDK','Juan',30);
insert into libros(titulo,cantidad) values ('SQL',200);

#Seleccionar todos los valores de la tabla libros
select * from libros;

#Borrar registro de la tabla libros que cumpla con id=4
delete from libros where id=4;

#Elimina la tabla libros
drop table libros;