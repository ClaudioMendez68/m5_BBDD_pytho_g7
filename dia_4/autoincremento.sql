-- AQUÍ TRABAJO EN EL SERVIDOR 'PostgreSQL13' --
-- Paso 1: Creamos la base de datos restricciones_psql
CREATE DATABASE restricciones_psql;
-- Paso 2: Creamos una tabla llamada company con los campos id y nombre.
CREATE TABLE company(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR NOT NULL UNIQUE);
-- Paso 3: Hacemos dos insert a la tabla.
INSERT INTO company(nombre) VALUES ('Amazon');
INSERT INTO company(nombre) VALUES ('Apple');
-- Paso 4: Validar la restricción Unique dentro de la tabla.
INSERT INTO company VALUES ('Apple');
-- ERROR:  la sintaxis de entrada no es válida para tipo integer: «Apple»
-- LÍNEA 1: INSERT INTO company VALUES ('Apple');

-- Comprueba la restricción not null del campo nombre.
INSERT INTO company(nombre) VALUES (NULL);
-- ERROR:  el valor nulo en la columna «nombre» de la relación «company» viola la restricción de no nulo
-- DETALLE:  La fila que falla contiene (4, null).