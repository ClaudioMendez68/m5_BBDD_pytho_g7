-- AQUÍ TRABAJO EN EL SERVIDOR POSTGRESQL13 --
-- Paso 1: Creamos una base de datos de comidas típicas chilenas.
CREATE DATABASE comidas_tipicas;
-- Paso 2: Creamos una tabla llamada cocina chilena con los campos id y nombre.
CREATE TABLE comida_chilena(id INT, nombre VARCHAR(50));
# Paso 3: Insertamos 2 registros a la tabla con sus respectivos campos.
INSERT INTO comida_chilena(id, nombre)
VALUES
    ('1', 'Pastel de Choclo'),
    ('2', 'Umitas');
-- Paso 4: Para actualizar un registro utilizamos update.
UPDATE comida_chilena
SET nombre = 'Humitas'
WHERE id = '2';
-- Ingresa 3 registros más a la tabla e intenciona el update en al menos 2 de ellos
INSERT INTO comida_chilena(id, nombre)
VALUES
    ('3', 'Tomaticán'),
    ('4', 'Cazuela'),
    ('5', 'Porotos con Riendas');
UPDATE comida_chilena
SET nombre = 'Cazuela de Vacuno'
WHERE id = '4';
UPDATE comida_chilena
SET nombre = 'Pollo Arvejado' 
WHERE id = '5';
-- Paso 5: Eliminar un registro lo podremos hacer con la sentencia Delete. 
-- Así como hicimos con la actualización, utilizaremos el id para capturar un registro puntual.
DELETE FROM comida_chilena WHERE id = '2';
-- Paso 6: Eliminar múltiples registros en la tabla.
INSERT INTO comida_chilena (id, nombre) values ('2','Humitas');
INSERT INTO comida_chilena (id, nombre) values ('3','Cazuela');
INSERT INTO comida_chilena (id, nombre) values ('4','Empanada chilena');
INSERT INTO comida_chilena (id, nombre) values ('5','Charquicán');
DELETE FROM comida_chilena WHERE id IN (3, 4, 5);