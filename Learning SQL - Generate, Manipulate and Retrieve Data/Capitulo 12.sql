use sakila;
## CAPITULO 12 

## PREGUNTA 1

CREATE TABLE account(
	account_id int,
    avail_balance int,
    last_activity_date datetime
);

CREATE TABLE Transaction(
	txn_id_amount int,
    txn_date date,
    account_id int,
    txn_type_cd varchar(2),
    amount int
);

## Se  insertan los datos a la tabla 1 
INSERT INTO account Values(123,500,'2019-07-10 20:53:27');
INSERT INTO account Values(789,75,'2019-06-22 15:18:35');

## Se insertan los datos de la tabla 2

INSERT INTO Transaction Values(1001,'2019-05-15',123,'C',500);
INSERT INTO Transaction Values(1002,'2019-06-01',789,'C',75);

## Como generar una transaccion

-- SE DEBEN TRANSFERIR 50 DESDE LA CUENTA 123 A LA CUENTA 789

START TRANSACTION;

SET @transferencia = 50;

/*SE ACTUALIZA EL MONTO DE LA CUENTA DE ORIGEN Y SE LE RESTAN 50 DOLARES*/

UPDATE account 
SET avail_balance = avail_balance - @transferencia
WHERE 
	account_id = 123
    AND avail_balance > 50;
  
/*SE ACTUALIZA EL MONTO DE TRASPASO A LA NUEVA CUENTA */

UPDATE account 
SET avail_balance = avail_balance + @transferencia
WHERE 
	account_id = 789;
    
INSERT INTO Transaction Values(1003,convert(now(),date),123,'C',@transferencia);
COMMIT;


Select
	*
from Transaction;

DROP TABLE Transaction;
DROP TABLE account;


    
    


