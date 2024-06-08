
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


#Actualizar registros con valores de otra tabla(UPDATE)

#Eliminar la tabla proveedor y guardar el atributo en la misma tabla producto. 

#Primero: Se añade el nuevo campo en la tabla producto.
alter table productos add proveedor varchar(50); 
alter table productos add proveedor varchar(50);

describe productos;
#Segundo: Se actualiza los registros de la tabla proveedor
update productos
join proveedor
on productos.proveedorid=proveedor.id
set productos.proveedor=proveedor.nombre;

#Tercero: eliminar la tabla de proveedores por que ya no es necesaria.
drop table proveedor;
select * from productos;

####----------------------------------

## Se elimina la columna proveedorid
alter table productos drop proveedorid;
drop table proveedor;

select * from productos;
select * from proveedor;

#Actualizacion en cascada(UPDATE-JOIN)
#cambiar el id de logitech y cambiarlo automaticamente en dos tablas

update productos as p
join proveedor as pro
on p.proveedorid=pro.id
set p.proveedorid=8,
pro.id=8
where pro.nombre='Logitech';

select * from productos;
delete  from productos;
select * from productos;
select * from proveedor;

#Borrar Registros consultando otras tablas(DELETE-JOIN)
#Borrar los registros de HP sin tener el id del proveedor

delete productos 
from productos 
join proveedor as pro
on productos.proveedorid=pro.id
where pro.nombre='Logitech';

select * from productos;

delete productos
from productos
join proveedor
on productos.proveedorid=proveedor.id
where proveedor.nombre = 'HP';

select * from productos;
select * from proveedor;

#Borrar registros en cascada
# Eliminar el proveedor HP desde las diferentes tablas 

delete productos, proveedor
from productos
join proveedor
on productos.proveedorid=proveedor.id
where proveedor.nombre='Lenovo';

select * from productos; 
select * from proveedor;

delete productos, proveedor
from productos
join proveedor
on productos.proveedorid=proveedor.id
where proveedor.nombre='Lenovo';


