#############-------------
#VARIABLES DE USUARIO
 
# @nombrevariable:= 
# int nombrevarible
#$variable
 
 
 select @preciomayor:=max(precio) from productos;
 
 select * from productos where precio=@preciomayor;
###########-------------

 #Mostrar todos el producto con el precio mas alto
 #Para cada uno de los proveedores
 select p.nombre, p.descripcion, pro.nombre
 from productos as p
 join proveedor as pro
 on p.proveedorid=pro.id
 where p.precio=@preciomayor;
 
 #CREAR TABLA A PARTIR DE OTRA
 
 #Create Insert
 
 #Elimino ambas tablas productos/proveedores
 drop table productos;
 drop table proveedores;
 
 #Crea tabla productos
 create table if not exists productos(
id int unsigned not null auto_increment,
nombre varchar(50) not null,
descripcion text,
proveedor varchar(50),
precio decimal(5,2),
cantidad smallint unsigned default 0,
primary key(id),
unique index (nombre)
);

describe productos;

#Inserta valores dentro de la tabla de productos
insert into productos(nombre, descripcion, proveedor, precio, cantidad) 
values('Lenovo 310', 'La mejor laptop', 'Lenovo', 100, 50);
insert into productos(nombre, descripcion, proveedor, precio, cantidad) 
values('Mouse', 'mouse inalambrico', 'Logitech', 15.96, 5);
insert into productos(nombre, descripcion, proveedor, precio, cantidad) 
values('Office 360', 'Paquete de Ofice', 'Microsoft', 150.69, 30);
insert into productos(nombre, descripcion, proveedor, precio, cantidad) 
values('HP Y700', 'La mejor laptop del mercado', 'HP', 10, 15);


drop table proveedores;
create table proveedores;

#Selecciona todos los nombres dentro de la tabla (sin repetirse)
#Y los añade en la nueva tabla para proveedores
select distinct proveedor as nombre from productos; 

select * from proveedores;

#Crear una tabla a partir de dos tablas(CREATE-INSERT-JOIN)

drop table productos;

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
describe productos;

select * from productos;

drop table if exists proveedor;

create table if not exists proveedor(
id int unsigned not null auto_increment,
nombre varchar(50),
primary key(id),
unique index (nombre)
);

select * from proveedor;

#Añade valores a la tabla de proveedor

insert into proveedor (nombre) values('Lenovo');
insert into proveedor (nombre) values('Logitech');
insert into proveedor (nombre) values('Microsoft'); 
insert into proveedor (nombre) values('HP');

select * from proveedor;

#Añade registros a la tabla de productos
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

select * from productos;

#Tabla creada a partir de las otras dos
#Contiene las cantidades de productos por cada uno de los proveedores

select pro.nombre,count(*) as cantidad
from productos as p
join proveedor as pro
on p.proveedorid=pro.id
group by pro.nombre;

select * from cantidadporproveedor;


#Insertar datos buscando un valor en otra tabla

#Agrega un registro utilizando info desde otra tabla
insert into productos(nombre,descripcion, precio, proveedorid,cantidad) select 'Teclado', 'El mejor teclado', 100, id, 50
from proveedor where nombre='Logitech';

#Elimina un producto con nombre Teclado
delete from productos where nombre= 'Teclado';

Select * from productos;

#Inserta un registro en productos
#seleccionando ciertos valores para las variables (excepto el ID que se entrega por condicion)

insert into productos(nombre,descripcion, precio, proveedorid, cantidad)
select 'Teclado', 'El mejor teclado', 100, id, 50
from proveedor where nombre='Logitech';

select * from productos;

