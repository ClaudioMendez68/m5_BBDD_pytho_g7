CREATE DATABASE claudio
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Primero hay que conectarse a una base de datos desde la terminal
-- Paso 1: Accedemos al cliente de postgresql via el terminal.
-- Paso 2: Crea una base de datos llamada prueba1.
CREATE DATABASE prueba1;
--  Paso 3: Lista las bases de datos creadas.
\l;
-- Paso 4: Conéctate a la base de datos.
\c prueba1;

-- Creación de una tabla
create table clientes(
    nombre varchar(30),
    apellido varchar(30)
);

-- Listar las tablas de una base de datos

-- Detallar información de la tabla (relación) clientes
\d clientes

-- Paso 6: Insertar valores a los campos nombre y apellido.
-- Paso 7: Consultamos los datos ingresados con:
-- Conectando a una base de datos con PostgreSQL
insert into clientes (nombre, apellido) values ('Claudio','Méndez');
insert into clientes (nombre, apellido) values ('Elon','Musk');
select * from clientes;
insert into clientes values ('Tony', 'Stark');
insert into clientes (apellido, nombre) values ('Johansson', 'Scarlett');

-- Consultar registros en una tabla
select * from clientes order by nombre DESC;

-- Borrar algunos registros de la tabla
DELETE FROM clientes WHERE nombre = 'Claudio' AND apellido = 'Méndez';