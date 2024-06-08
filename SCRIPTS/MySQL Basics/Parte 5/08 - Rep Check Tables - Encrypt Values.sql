#chequear y reparar tablas(CHECK-REPAIR)

check table productos;

# quick
# fast
# changed
# medium
# extented

check table productos fast quick;

repair table productos;

#ENCRIPTAR VALORES DENTRO DE LA TABLA

#aes_encrypt("dato a encriptar", "clave de encriptacion")

drop table if exists clientes;

create table clientes(
  nombre varchar(50),
  mail varchar(70),
  tarjetacredito blob,
  primary key (nombre)
);

insert into clientes 
  values ('Marcos Luis','marcosluis@gmail.com',aes_encrypt('5390700823285988','xyz123'));
insert into clientes 
  values ('Ganzalez Ana','gonzalesa@gmail.com',aes_encrypt('4567230823285445','xyz123'));
insert into clientes 
  values ('Lopez German','lopezg@yahoo.com',aes_encrypt('7840704453285443','xyz123'));
  
  select tarjetacredito from clientes;
  
  select nombre,mail,cast(aes_decrypt(tarjetacredito, 'xyz123') as char) from clientes;