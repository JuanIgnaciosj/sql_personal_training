#Todo este codigo es la parte de mis anotaciones para futuras implementaciones.
#Todas las QUERYS indicadas en este archivo fueron ejecutadas por medio de la 
#herramienta MySQL Workbench

#Eliminar la base de datos ya existente.
drop database if exists curso_sql;


#show databases;

#Crear base de dato de nombre curso_sql;
create database if not exists curso_sql;
use curso_sql; #Se selecciona la base de datos a utilizar

#Crea una tabla si no existe para usuarios
create table if not exists usuario(
nombre varchar(50),
apellido varchar(50),
correo varchar(100),
primary key(nombre)
);


#Inserta registros a la tabla

insert into usuario values('Juan','Perez','juan@juan.com');
insert into usuario values('Juan','Lopez','juan@Lopez.com'); #ERROR: NO SE PERMITE EL INGRESO DE VALORES DUPLICADOS (PK)

#Describe la tabla de usuario
describe usuario;

#Selecciona todos los registros de la tabla
select * from usuario;
drop table if exists producto; # Elimina la tabla producto

#Se crea nuevamente la tabla producto
create table if not exists producto(
id int(11) not null auto_increment,
producto varchar(50) not null,
descripcion text null,
precio float(11,2) not null,
primary key(id)
);

#Se describe la tabla con sus valores
describe producto;

#Se insertan registros en la tabla 
insert into producto values(null,'Laptop','La mejor laptop del mercado.',128.6);
insert into producto(id, producto, descripcion, precio) values(null,'','Mejor producto.',78.5);
insert into producto values(null,'Mouse','Prende luz.',5.8);
insert into producto(id, producto, descripcion, precio) values(null,'Laptop','La mejor laptop del mercado.',128.6);

#Se seleccionan todos los registros de la tabla productos (4 Ingresados anteriormente)
select * from producto;

#Elimina la tabla completa (CONSEJO: UTILIZAR SIEMPRE WHERE)
delete from producto; #(NO RECOMENDABLE POR QUE BORRA LA TABLA)

#Vacia la tabla completa Incluido el valor autoincremental
truncate table producto;

#UNSIGNED: EL ATRIBUTO NO ACEPTA VALORES NEGATIVOS
create table persona(
id integer unsigned not null,
nombre varchar(50),
edad integer unsigned,
primary key(id)
);

#Describe la tabla persona
describe persona;


#TIPOS DE DATOS

#Recordatorio sobre los tipos de datos existentes en el lenguaje para un rapido acceso a la información

#numericos

#enteros
TINYINT -127 128 UNSIGNED 
SMALLINT 
MEDIUMINT 
INT O INTEGER
BIGINT 

#decimales
FLOAT
precio float(6.24)
DOUBLE
precio double(4.53)
DECIMAL


#cadenas

CHAR 255 
nombre char(100) juan 

VARCHAR 255 - 65.534
nombre varchar(100) juan

BINARY Y VARBINARY

TEXT 

BLOB

TINYBLOB 255, MEDIUMBLOB  Y LONGBLOB 4GB

ENUM 

SET 

#fecha

DATE
AAAA-MM-DD

20190715
2019-07-15

DATETIME
AAAA-MM-DD HH:MM:SS

TIME
HH:MM:SS

TIMESTAMP

AAAA-MM-DD
AA-MM-DD

ON UPDATE CURRENT_TIMESTAMP

YEAR