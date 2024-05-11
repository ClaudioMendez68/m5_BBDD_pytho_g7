-- AQUÍ ESTOY TRABAJANDO EN EL SERVIDOR PostgreSQL16 --

CREATE DATABASE descripciones;

-- ● Paso 1: Creamos la tabla clientes create table clientes;
CREATE TABLE clientes (
    id INTEGER UNIQUE NOT NULL,
    name VARCHAR(25) NOT NULL,
    email VARCHAR(50)
);
-- ● Paso 2: Insertamos al menos 3 registros, todos sin ingresar el campo email.
INSERT INTO clientes(id, name) values (1, 'Nombre 1');
INSERT INTO clientes(id, name) values (2, 'Nombre 2');
INSERT INTO clientes(id, name) values (3, 'Nombre 3');
INSERT INTO clientes(id, name, email) values (4, 'Nombre 4', 'email@gmail.com');

-- ● Paso 3: Modificamos el campo email a not null con alter table.
ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;
-- ERROR:  la columna «email» de la relación «clientes» contiene valores null.

-- ● Paso 4: Debemos actualizar la tabla con el comando UPDATE, seguidamente debemos indicar la columna a modificar
--  y por último con WHERE definir la condición cuando el campo sea nulo

UPDATE clientes SET email = '' WHERE email IS NULL;

-- ● Paso 5: Corremos nuevamente el comando de alteración de la columna.
ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;

-- Paso 6: En la tabla clientes del ejercicio anterior, crearemos un campo fecha.
-- Para esto, modifica la tabla y asigna la restricción.
ALTER TABLE clientes
ADD COLUMN fecha DATE NOT NULL;
-- ERROR:  la columna «fecha» de la relación «clientes» contiene valores null.
ALTER TABLE clientes
ADD COLUMN fecha DATE DEFAULT '1111-11-11' NOT NULL;

-- COALESCE: Esta función permite seleccionar campos que sean nulos en una tabla y modificarlos con un valor determinado.

-- PARA QUITAR UNA RESTRICCIÓN --
ALTER TABLE IF EXISTS clientes
ALTER COLUMN email DROP NOT NULL;

-- ● Paso 6: Agregamos un nuevo campo a la tabla de clientes pero los registros que ya existen no tienen dicha fecha incorporada.
-- Asignemos una fecha a esos registros con COALESCE.
UPDATE clientes SET email = COALESCE(email, 'sin email');
ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;

-- Ejercicio propuesto: "Datos nulos en tabla de productos"
UPDATE productos SET sku = COALESCE(sku, 'Dato no ingresado');
-- Por último, el cliente nos solicita que no quiere que sigan ingresando datos con el SKU en nulo.
ALTER TABLE productos
ALTER COLUMN sku SET NOT NULL;