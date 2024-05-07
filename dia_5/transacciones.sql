-- AQUÍ ESTOY TRABAJANDO EN EL SERVIDOR PostgreSQL13 --

-- Paso 1: Creamos la base de datos transacciones y nos conectamos.
CREATE DATABASE transacciones;
-- Paso 2: Creamos una tabla llamada cuentas con los campos numero_cuenta y balance.
CREATE TABLE cuentas(
    numero_cuenta INT PRIMARY KEY,
    balance FLOAT CHECK(balance >= 0.00)
);
-- Paso 3: Insertamos dos registros a la tabla.
INSERT INTO cuentas(numero_cuenta, balance) VALUES (1, 1000);
INSERT INTO cuentas(numero_cuenta, balance) VALUES (2, 1000);
-- Paso 4: Si quisiéramos hacer una transferencia de $1000 desde nuestra cuenta 1 a la cuenta 2,
-- una forma de asegurarnos que el monto de nuestro balance disminuya en $1000 y el de la segunda cuenta aumenta en la misma cifra ...
BEGIN TRANSACTION;
UPDATE cuentas SET balance = balance - 1000 WHERE numero_cuenta = 1;
UPDATE cuentas SET balance = balance + 1000 WHERE numero_cuenta = 2;
-- Paso 5: Verificamos el estado de la tabla.
SELECT * FROM cuentas;
-- Paso 6: Confirmamos la transacción con commit.
COMMIT;
-- Paso 7: Continuemos con el ejercicio anterior y apliquemos el uso de ROLLBACK.
-- Para ello haremos un nuevo insert a la base de datos.
INSERT INTO cuentas(numero_cuenta, balance) VALUES (3, 1000);
-- Paso 8: Iniciamos una transacción para transferir 1000 de la cuenta 3 a la 1.
BEGIN TRANSACTION;
UPDATE cuentas SET balance = balance - 1000 WHERE numero_cuenta = 3;
UPDATE cuentas SET balance = balance + 1000 WHERE numero_cuenta = 1;
-- Para deshacer la transacción donde transferimos los 1000 de la cuenta 3 a la 1 ejecutamos el ROLLBACK
ROLLBACK;