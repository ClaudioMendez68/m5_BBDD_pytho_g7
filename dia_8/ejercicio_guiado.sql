-- AQUÍ TRBAJARÉ CON EL SERVIDOR PostgreSQL13 --
CREATE DATABASE ejercicio_guiado;
-- Paso 1: Creamos la tabla clientes create table clientes.
CREATE TABLE clientes(
    id INTEGER UNIQUE NOT NULL,
    name VARCHAR(25) NOT NULL,
    email VARCHAR(50)
);
-- Paso 2: Insertamos al menos 3 registros, todos sin ingresar el campo email.
INSERT INTO clientes(id, name) VALUES (1, 'Nombre 1');
INSERT INTO clientes(id, name) VALUES (2, 'Nombre 2');
INSERT INTO clientes(id, name) VALUES (3, 'Nombre 3');

-- Paso 3: Modificamos el campo email a not null con alter table.
ALTER TABLE clientes
ALTER COLUMN email SET NOT NULL;
-- ERROR:  la columna «email» de la relación «clientes» contiene valores null.

-- ● Paso 4: Debemos actualizar la tabla con el comando UPDATE, seguidamente debemos indicar la columna a modificar
-- y por último con WHERE definir la condición cuando el campo sea nulo.
UPDATE clientes SET email = '' WHERE email IS NULL;

-- Paso 5: Corremos nuevamente el comando de alteración de la columna.
ALTER TABLE clientes
ALTER COLUMN email SET NOT NULL;
-- En la tabla clientes del ejercicio anterior, crearemos un campo fecha.
-- Para esto, modifica la tabla y asigna la restricción.
ALTER TABLE clientes
ADD COLUMN fecha DATE NOT NULL;
-- ERROR:  la columna «fecha» de la relación «clientes» contiene valores null