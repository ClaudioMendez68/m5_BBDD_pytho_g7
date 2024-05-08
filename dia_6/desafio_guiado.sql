-- AQUÍ TRABAJO CON EL SERVIDOR PostgreSQL16 --
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

-- GUÍA DE EJERCICIOS --

-- Paso 1: Nos conectamos a la base de datos.
\connect transacciones
-- Se deja la tabla en el estado inicial requerido
DELETE FROM cuentas WHERE numero_cuenta = 3;
-- Paso 2: En la tabla cuentas realizamos una transacción en donde transferimos $1000 de la cuenta 1 a la cuenta 2
-- y no obtuvimos ningún error. Sin embargo, podemos verificar que en las transacciones que terminan en error
-- no se altera el estado de nuestros datos.
BEGIN TRANSACTION;
UPDATE cuentas SET balance = balance + 1000 WHERE numero_cuenta = 2;
UPDATE cuentas SET balance = balance - 1000 WHERE numero_cuenta = 1;
-- ERROR:  el nuevo registro para la relación «cuentas» viola la restricción «check» «cuentas_balance_check»
-- DETALLE:  La fila que falla contiene (1, -1000).
SELECT * FROM cuentas;
-- ERROR:  transacción abortada, las órdenes serán ignoradas hasta el fin de bloque de transacción
ROLLBACK;
-- Paso 3: Verificamos el estado de la tabla.
SELECT * FROM cuentas;

-- SAVEPOINT --
-- Paso 4: Intentemos registrar una nueva cuenta de número 3 en nuestra tabla “cuentas” con un saldo de $5000
-- y justo luego guardemos ese punto de la transacción con un SAVEPOINT de nombre “nueva_cuenta”.
BEGIN TRANSACTION;
INSERT INTO cuentas(numero_cuenta, balance)
VALUES (3, 5000);
SAVEPOINT nueva_cuenta;
-- Paso 5: Hasta este punto tenemos la transacción en curso y hemos fijado que podríamos volver a este estado
-- en cualquier circunstancia. Ahora, intentemos transferir a esta nueva cuenta $3000 desde la cuenta 2.
UPDATE cuentas SET balance = balance + 4000 WHERE numero_cuenta = 3;
UPDATE cuentas SET balance = balance - 4000 WHERE numero_cuenta = 2;
-- ERROR:  el nuevo registro para la relación «cuentas» viola la restricción «check» «cuentas_balance_check»
-- DETALLE:  La fila que falla contiene (2, -1000).
ROLLBACK TO nueva_cuenta;
COMMIT;
-- A continuación, deberás insertar al menos 10 registros más en la base de datos de transacciones.
INSERT INTO cuentas(numero_cuenta, balance) VALUES (4, 7000);
INSERT INTO cuentas(numero_cuenta, balance) VALUES (5, 500);
INSERT INTO cuentas(numero_cuenta, balance) VALUES (6, 900);
INSERT INTO cuentas(numero_cuenta, balance) VALUES (7, 12000);
INSERT INTO cuentas(numero_cuenta, balance) VALUES (8, 100);
INSERT INTO cuentas(numero_cuenta, balance) VALUES (9, 17000);
INSERT INTO cuentas(numero_cuenta, balance) VALUES (10, 100);
INSERT INTO cuentas(numero_cuenta, balance) VALUES (11, 6000);
INSERT INTO cuentas(numero_cuenta, balance) VALUES (12, 4000);
INSERT INTO cuentas(numero_cuenta, balance) VALUES (13, 500);
INSERT INTO cuentas(numero_cuenta, balance) VALUES (14, 18000);

-- ● Reporta aquellas cuentas cuyo balance sea mayor a 2000.
SELECT numero_cuenta AS cuenta FROM cuentas WHERE balance > 2000;
transacciones=# SELECT numero_cuenta AS cuenta FROM cuentas WHERE balance > 2000;
 cuenta
--------
      2
      3
      4
      7
      9
     11
     12
     14
(8 filas)

-- ● Reporta cuántas tienen un balance inferior a 1000.
SELECT COUNT(numero_cuenta) AS cantidad FROM cuentas WHERE balance < 1000;
transacciones=# SELECT COUNT(numero_cuenta) AS cantidad FROM cuentas WHERE balance < 1000;
 cantidad
----------
        6
(1 fila)
-- ● Reporta el promedio total de las cuentas registradas según su balance.
SELECT ROUND(AVG(balance)) AS promedio_total FROM cuentas;
transacciones=# SELECT AVG(balance) AS promedio_total FROM cuentas;
  promedio_total
-------------------
 5292.857142857143
(1 fila)
-- ● Reporta el promedio de cuentas cuyo balance sea mayor o igual a 10000.
SELECT AVG(balance) AS promedio FROM cuentas WHERE balance >= 10000;
transacciones=# SELECT AVG(balance) AS promedio FROM cuentas WHERE balance >= 10000;
      promedio
--------------------
 15666.666666666666
(1 fila)