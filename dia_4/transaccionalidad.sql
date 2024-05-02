-- DQL: Lenguaje de Consulta de Datos: SELECT
-- DML : Lenguaje de Maniipulación de Datos: INSERT, UPDATE, DELETE
-- DDL:
-- DCL:

CREATE DATABASE comidas_tipicas;

CREATE TABLE cocina_chilena(
    id INT,
    nombre VARCHAR(50)
    );

SELECT * FROM cocina_chilena;

INSERT INTO cocina_chilena (id, nombre) values ('1','Pastel de choclo');
INSERT INTO cocina_chilena (id, nombre) values ('2', 'Umitas');

UPDATE cocina_chilena SET nombre='Humitas'  WHERE id = 2;

ALTER TABLE cocina_chilena ADD PRIMARY KEY(id);
UPDATE cocina_chilena SET nombre='Humitas';
UPDATE cocina_chilena SET nombre='Pastel de choclo'  WHERE id = '1';

DELETE FROM cocina_chilena -- Borra todos los registros de la tabla 'cocina_chilena'
DELETE FROM cocina_chilena WHERE id = 2;

INSERT INTO cocina_chilena (id, nombre) values ('2','Humitas'); -- A pesar que 'id' se inserta como varchar, psql lo incorpora como 'int'
INSERT INTO cocina_chilena (id, nombre) values ('3','Cazuela');
INSERT INTO cocina_chilena (id, nombre) values ('4','Empanada chilena');
INSERT INTO cocina_chilena (id, nombre) values ('5','Charquicán');

DELETE FROM cocina_chilena WHERE id IN (3, 4, 5);

DELETE FROM cocina_chilena WHERE id = 5 AND id = 3; -- DELETE 0
DELETE FROM cocina_chilena WHERE id = 5 OR id = 3;
DELETE FROM cocina_chilena 
WHERE id = 2 OR nombre = 'Cazuela';